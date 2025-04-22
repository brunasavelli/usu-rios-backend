const express = require("express");
const router = express.Router();

const reportsController = require("../controllers/reportController");
const apiKeyMiddleware = require("../config/apiKey")

router.use(apiKeyMiddleware);
router.get("/report/pdf", reportsController.exportUserPDF);

module.exports = router;