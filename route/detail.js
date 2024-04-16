const express = require("express");
const router = express.Router();
const { authMiddleware } = require("../middleware/auth");
const detailController = require("../controller/detail");

router
    .route("/")
    .get(authMiddleware(["member", "admin", "superAdmin"]), detailController.getDetails)
    .post(authMiddleware(["admin", "superAdmin"]), detailController.createDetail);

router
    .route("/:id")
    .get(authMiddleware(["member", "admin", "superAdmin"]), detailController.getDetail)
    .put(authMiddleware(["admin", "superAdmin"]), detailController.updateDetail)
    .delete(authMiddleware(["admin", "superAdmin"]), detailController.deleteDetail);

module.exports = router;