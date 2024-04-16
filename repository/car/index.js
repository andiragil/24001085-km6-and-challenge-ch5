const { details, car } = require("../../models");
const { getData, setData, deleteData } = require("../../helper/redis");
const crypto = require("crypto");
const path = require("path");
const { uploader } = require("../../helper/cloudinary");

exports.getCars = async () => {
    const data = await car.findAll({
        include: {
            model: details,
        },
    });
    return data;
};

exports.getCar = async (id) => {
    const key = `car:${id}`;

    let data = await getData(key);
    if (data) {
        return data;
    }

    data = await car.findAll({
        where: {
            id,
        },
        include: {
            model: details,
        },
    });
    if (data.length > 0) {
        await setData(key, data[0], 300);
        return data[0];
    }

    throw new Error(`Car is not found!`);

};


exports.createCar = async (payload) => {
    if (payload.image) {
        // upload image to cloudinary
        const { image } = payload;

        // make unique filename 
        image.publicId = crypto.randomBytes(16).toString("hex");

        // rename the file 
        image.name = `${image.publicId}${path.parse(image.name).ext}`;

        // Process to upload image
        const imageUpload = await uploader(image);
        payload.image = imageUpload.secure_url;
    }
    const data = await car.create(payload);

    const key = `car:${data.id}`;
    await setData(key, data, 300);

    return data;

};

exports.updateCar = async (id, payload) => {
    if (payload.image) {
        // upload image to cloudinary
        const { image } = payload;

        // make unique filename 
        image.publicId = crypto.randomBytes(16).toString("hex");

        // rename the file 
        image.name = `${image.publicId}${path.parse(image.name).ext}`;

        // Process to upload image
        const imageUpload = await uploader(image);
        payload.image = imageUpload.secure_url;
    }
    const key = `car:${id}`;

    await car.update(payload, {
        where: {
            id,
        },
    });

    const data = await car.findAll({
        where: {
            id,
        },
        include: {
            model: details,
        },
    });

    if (data.length > 0) {
        await setData(key, data[0], 300);
        return data[0];
    }

    throw new Error(`Car is not found!`);

};

exports.deleteCar = async (id) => {
    const key = `car:${id}`;

    const data = await car.destroy({ where: { id } });

    await deleteData(key);

    return null;

};