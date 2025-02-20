const User = require('../models/User');
const UserList = require('../models/UserList');

const lista = new UserList();

lista.addUser(new User('Bruna Savelli', 'bnsavelli@gmail.com', 17));
lista.addUser(new User('Alejandra', '4yob@gmail.com', 17));

const router = {
    getAllUsers: (req, res) => {
        res.json(lista.getAllUsers());
    },

    getUserById: (req, res) => {
        try {
            res.json(lista.getUserById(req.params.id));
        } catch (error) {
            res.status(404).json({message: 'Erro ao buscar usuário por ID', error});
        }
    },

    addUser: (req, res) => {
        try {
            const {name, email, age} = req.body;
            if(!name || !email || !age) {
                throw new Error('Todos os campos devem ser preenchidos');
            }
            const newUser = new User(name, email, age);
            lista.addUser(newUser);
            res.status(201).json({message: 'Usuário adicionado com sucesso', newUser});
        } catch (error) {
            res.status(400).json({message: 'Erro ao adicionar usuário', error});
        }
    },

    updateUser: (req, res) => {
        try {
            res.json(lista.updateUser(req.params.id, req.body));
        } catch (error) {
            res.status(404).json({message: 'Erro ao atualizar usuário', error});
        }
    },

    deleteUser: (req, res) => {
        lista.deleteUser(req.params.id);
        res.status(200).json({message: 'Usuário deletado com sucesso', IdDeletado: req.params.id});
    }
}

module.exports = router;