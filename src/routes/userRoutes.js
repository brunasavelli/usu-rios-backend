const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');

router.get('/users', usersController.getAllUsers);
router.post('/users', usersController.addUser);
router.get('/users/:id', usersController.getUserById);
router.put('/users/:id', usersController.updateUser);
router.delete('/users/:id', usersController.deleteUser);

module.exports = router;