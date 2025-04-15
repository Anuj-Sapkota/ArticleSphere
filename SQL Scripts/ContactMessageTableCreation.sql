CREATE TABLE ContactMessage (
    messageId INT AUTO_INCREMENT PRIMARY KEY,
    messageContent TEXT,
    submittedAt DATETIME,
    userId INT,
    FOREIGN KEY (userId) REFERENCES User(userId)
);