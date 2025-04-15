CREATE TABLE Article (
    articleId INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255), 
    content TEXT,
    publishDate DATETIME,
    authorId INT,
    categoryId INT,
    FOREIGN KEY (authorId) REFERENCES User(userId),
    FOREIGN KEY (categoryId) REFERENCES Category(categoryID)
);