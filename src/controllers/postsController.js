const Post = require('../models/Post');
const PostList = require('../models/PostList');
const { post } = require('../routes/postRoutes');

const lista = new PostList();

lista.addPost(new Post('Bruna Savelli', 'Tarde no parque', 'https://weochoichoi.com'));
lista.addPost(new Post('Alejandra', 'Sorvete com as amigas', 'https://weochoichoi.com'));

const router = {
    getAllPosts: (req, res) => {
        res.json(lista.getAllPosts());
    },

    addPost: (req,res) =>{
        try {
            const {userName, legend, image} = req.body;
            if(!userName || !legend || !image) {
                throw new Error('Todos os campos devem ser preenchidos');
            }
            const newPost = new Post(userName,legend, image);
            lista.addPost(newPost);
            res.status(201).json('Postagem adicionada');
        } catch (error) {
            res.status(400).json({message: 'Erro ao fazer postagem', error});
        }
    },

    getPostById: (req,res) => {
        try {
            const post = lista.getPostById(req.params.id);
            res.status(200).json(post);
        } catch (error) {
            res.status(404).json({message: 'Erro ao buscar postagem', error});
        }
    },

    updatePost: (req, res) => {
        try {
            res.json(lista.updatePost(req.params.id, req.body));
        } catch (error) {
            res.status(404).json({message: 'Erro ao atualizar postagem', error});
        }
    },

    deletePost: (req, res) => {
        lista.deletePost(req.params.id);
        res.status(200).json({message: 'Postagem deletada', IdDeletado: req.params.id});
    }
}

module.exports = router;