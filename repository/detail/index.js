const { details, car } = require("../../models");
const { getData, setData, deleteData } = require("../../helper/redis");

exports.getDetails = async () => {
    const data = await details.findAll({
        include: {
            model: car,
        },
    });
    return data;
};

exports.getDetail = async (id) => {
    const key = `details:${id}`;

    let data = await getData(key);
    if (data) {
        return data;
    }

    data = await details.findAll({
        where: {
            id,
        },
        include: {
            model: car,
        },
    });
    if (data.length > 0) {
        await setData(key, data[0], 300);
        return data[0];
    }
    throw new Error(`Car type is not found!`);
};


exports.createDetail = async (payload) => {
    const data = await details.create(payload);

    const key = `details:${data.id}`;
    await setData(key, data, 300);

    return data;
};

exports.updateDetail = async (id, payload) => {
    const key = `details:${id}`;

    await details.update(payload, {
        where: {
            id,
        },
    });

    const data = await details.findAll({
        where: {
            id,
        },
        include: {
            model: car,
        },
    });
    if (data.length > 0) {
        await setData(key, data[0], 300);
        return data[0];
    }

    throw new Error(`Car type is not found!`);
};

exports.deleteDetail = async (id) => {
    const key = `details:${id}`;

    const data = await details.destroy({ where: { id } });

    await deleteData(key);

    return null;
};