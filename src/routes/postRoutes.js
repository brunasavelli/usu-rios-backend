const express = require('express');
const router = express.Router();
const postsController = require('../controllers/postsController');

router.get('/posts', postsController.getAllPosts);
router.post('/posts', postsController.addPost);
router.get('/posts/:id', postsController.getPostById);
router.delete('/posts/:id', postsController.deletePost);
router.put('/posts/:id', postsController.updatePost);

module.exports = router;