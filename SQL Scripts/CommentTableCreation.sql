CREATE TABLE Comment (
    commentId INT AUTO_INCREMENT PRIMARY KEY,
    commentContent TEXT,
    commentDate DATETIME, 
    userId INT,
    articleId INT,
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (articleId) REFERENCES Article(articleId)
);