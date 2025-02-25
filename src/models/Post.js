const { v4: uuid4 } = require ('uuid');
const User = require('./User');

class Post {
    constructor(userName, legend, image) {
        this.id = uuid4();
        this.userId = User.id;
        this.user = userName;
        this.legend = legend;
        this.image = image;
    }
}

module.exports = Post;