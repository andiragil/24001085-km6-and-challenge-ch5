const detailUsecase = require("../usecase/detail");

exports.getDetails = async (req, res, next) => {
    try {
        const data = await detailUsecase.getDetails();

        res.status(200).json({
            message: "Successs",
            data,
        });
    } catch (error) {
        next(error);
    }
};

exports.getDetail = async (req, res, next) => {
    try {
        const { id } = req.params;
        const data = await detailUsecase.getDetail(id);
        if (!data) {
            return next({
                message: `Car type with id ${id} is not found!`,
                statusCode: 404,
            });
        }

        res.status(200).json({
            message: "Successs",
            data,
        });
    } catch (error) {
        next(error);
    }
};

exports.createDetail = async (req, res, next) => {
    try {
        const { type } = req.body;
        if (!type || type == "") {
            return next({
                message: "Type must be provided!",
                statusCode: 400,
            });
        }

        const data = await detailUsecase.createDetail({
            type,
        });

        res.status(201).json({
            message: "Successs",
            data,
        });
    } catch (error) {
        next(error);
    }
};

exports.updateDetail = async (req, res, next) => {
    try {
        const { id } = req.params;
        const { type } = req.body;
        if (!type || type == "") {
            return next({
                message: "type must be provided!",
                statusCode: 400,
            });
        }

        const data = await detailUsecase.updateDetail(id, { type });

        res.status(200).json({
            message: "Successs",
            data,
        });
    } catch (error) {
        next(error);
    }
};

exports.deleteDetail = async (req, res, next) => {
    try {
        const { id } = req.params;
        const data = await detailUsecase.deleteDetail(id);

        res.status(200).json({
            message: "Successs",
            data,
        });
    } catch (error) {
        next(error);
    }
};