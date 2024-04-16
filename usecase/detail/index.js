const detailRepo = require("../../repository/detail");

exports.getDetails = async () => {
    const data = await detailRepo.getDetails();
    return data;
};

exports.getDetail = async (id) => {
    const data = await detailRepo.getDetail(id);
    return data;
};

exports.createDetail = async (payload) => {
    const data = await detailRepo.createDetail(payload);
    return data;
};

exports.updateDetail = async (id, payload) => {
    // update old data
    await detailRepo.updateDetail(id, payload);

    // find the new data
    const data = await detailRepo.getDetail(id);

    return data;
};

exports.deleteDetail = async (id) => {
    const data = await detailRepo.deleteDetail(id);
    return data;
};


