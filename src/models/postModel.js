const pool = require("../config/database");

const getPosts = async () => {
    const result = await pool.query(
        `   SELECT posts.*, users.name AS user_name
            FROM posts
            LEFT JOIN users ON posts.user_id = users.id
        `
    );
    return result.rows;
};

const getPostById = async (id) => {
    const result = await pool.query(
        `   SELECT posts.*, users.name AS user_name
            FROM posts
            LEFT JOIN users ON posts.user_id = users.id
            WHERE posts.id = $1
        `, [id]
    );
    return result.rows[0];
};

const createPost = async (content, user_id) => {
    const result = await pool.query(
        `   INSERT INTO posts (content, user_id)
            VALUES ($1, $2)
            RETURNING *
        `, [content, user_id]	
    );
    return result.rows[0];
};

const updatePost = async (id, content, user_id) => {
    const result = await pool.query(
        `   UPDATE posts
            SET content = $1,
            user_id = $2
            WHERE id = $3
            RETURNING *
        `, [content, user_id, id]
    );
    return result.rows[0];
};

const deletePost = async (id) => {
    const result = await pool.query(
        `   DELETE FROM posts
            WHERE id = $1
            RETURNING *
        `, [id]
    );
    return { message: `Post de id ${id} deletado com sucesso.`};
};

module.exports = { getPosts, getPostById, createPost, updatePost, deletePost };