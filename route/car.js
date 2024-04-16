const express = require("express");
const router = express.Router();
const { authMiddleware } = require("../middleware/auth");
const carController = require("../controller/car");

router
    .route("/")
    .get(authMiddleware(["member", "admin", "superAdmin"]), carController.getCars)
    .post(authMiddleware(["admin", "superAdmin"]), carController.createCar);

router
    .route("/:id")
    .get(authMiddleware(["member", "admin", "superAdmin"]), carController.getCar)
    .put(authMiddleware(["admin", "superAdmin"]), carController.updateCar)
    .delete(authMiddleware(["admin", "superAdmin"]), carController.deleteCar);

module.exports = router;