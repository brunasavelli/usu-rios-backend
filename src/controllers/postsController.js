const postModel = require("../models/postModel");

const getPosts = async (req, res) => {
    try {
        const posts = await postModel.getPosts();
        res.json(posts);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar posts."});
    }
};

const getPostById = async (req, res) => {
    try {
        const post = await postModel.getPostById(req.params.id);
        if (!post) {
            return res.status(404).json({ message: "Post não encontrado." });
        }
        res.json(post);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar post." });
    }
};

const createPost = async (req, res) => {
    try {
        const { content, user_id } = req.body;
        const newPost = await postModel.createPost({ content, user_id });
        res.status(201).json(newPost);
    } catch (error) {
        res.status(500).json({ message: "Erro ao criar post." });
    }
};

const updatePost = async (req, res) => {
    try {
        const { content, user_id } = req.body;
        const updatedPost = await postModel.updatePost(req.params.id, { content, user_id });
        if (!updatedPost) {
            return res.status(404).json({ message: "Post não encontrado." });
        }
        res.json(updatedPost);
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar post." });
    }
};

const deletePost = async (req, res) => {
    try {
        const message = await postModel.deletePost(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar post." });
    }
};

module.exports = { getPosts, getPostById, createPost, updatePost, deletePost };