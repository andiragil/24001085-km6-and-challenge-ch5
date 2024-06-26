const express = require("express");
const router = express.Router();
const { register } = require("../controller/auth");
const { login } = require("../controller/auth");
const { profile } = require("../controller/auth");
const { registerAdmin } = require("../controller/auth");
const { authMiddleware } = require("../middleware/auth");

router.post("/register", register);
router.post("/login", login);
router.post("/registerAdmin", authMiddleware(["superAdmin"]), registerAdmin);
router.get("/profile", authMiddleware(["member", "admin", "superAdmin"]), profile);


module.exports = router;