document.addEventListener('DOMContentLoaded', function() {
    // Close button functionality
    document.querySelector('.close-btn').addEventListener('click', function() {
        // Redirect back to previous page
        window.history.back();
    });

    // Create button functionality is already handled by the onclick attribute in HTML
    // But we can add additional functionality if needed
    document.querySelector('.create-btn').addEventListener('click', function() {
        // Additional actions can be added here if needed
        console.log('Create button clicked');
    });

    // View more functionality
    document.querySelectorAll('.view-more').forEach(function(element, index) {
        element.addEventListener('click', function() {
            // Get the corresponding content list
            const contentList = index === 0 ? 
                document.getElementById('articles-container') : 
                document.getElementById('comments-container');
            
            // Toggle expanded class or load more content
            if (contentList.classList.contains('expanded')) {
                contentList.classList.remove('expanded');
                element.innerHTML = 'View More <div class="arrow-down"></div>';
            } else {
                contentList.classList.add('expanded');
                element.innerHTML = 'View Less <div class="arrow-up"></div>';
                
                // Here you would typically load more content via AJAX
                // For demonstration, we'll just add a placeholder
                if (index === 0) {
                    loadMoreArticles();
                } else {
                    loadMoreComments();
                }
            }
        });
    });

    // Function to load more articles
    function loadMoreArticles() {
        // This would typically be an AJAX call to get more articles
        // For now, we'll just add a placeholder
        const articlesContainer = document.getElementById('articles-container');
        if (articlesContainer.classList.contains('expanded') && 
            articlesContainer.querySelectorAll('.content-item').length < 5) {
            
            const newArticle = document.createElement('div');
            newArticle.className = 'content-item';
            newArticle.textContent = 'Additional article loaded';
            articlesContainer.appendChild(newArticle);
            
            const newArticle2 = document.createElement('div');
            newArticle2.className = 'content-item';
            newArticle2.textContent = 'Another additional article';
            articlesContainer.appendChild(newArticle2);
        }
    }

    // Function to load more comments
    function loadMoreComments() {
        // This would typically be an AJAX call to get more comments
        // For now, we'll just add a placeholder
        const commentsContainer = document.getElementById('comments-container');
        if (commentsContainer.classList.contains('expanded') && 
            commentsContainer.querySelectorAll('.content-item').length < 3) {
            
            const newComment = document.createElement('div');
            newComment.className = 'content-item';
            newComment.textContent = 'Additional comment loaded';
            commentsContainer.appendChild(newComment);
            
            const newComment2 = document.createElement('div');
            newComment2.className = 'content-item';
            newComment2.textContent = 'Another additional comment';
            commentsContainer.appendChild(newComment2);
        }
    }

    // Load user data from session if available
    function loadUserData() {
        // This would typically check for user data in session/localStorage
        // For now, we'll just check if a name is available in URL parameters
        const urlParams = new URLSearchParams(window.location.search);
        const userName = urlParams.get('username');
        
        if (userName) {
            document.getElementById('user-name').textContent = userName;
        }
        
        // Check if there are any articles
        const articlesContainer = document.getElementById('articles-container');
        if (articlesContainer.children.length === 0) {
            const noArticles = document.createElement('div');
            noArticles.className = 'content-item';
            noArticles.textContent = 'No articles posted yet';
            articlesContainer.appendChild(noArticles);
        }
        
        // Check if there are any comments
        const commentsContainer = document.getElementById('comments-container');
        if (commentsContainer.children.length === 0) {
            const noComments = document.createElement('div');
            noComments.className = 'content-item';
            noComments.textContent = 'No comments yet';
            commentsContainer.appendChild(noComments);
        }
    }

    // Call loadUserData on page load
    loadUserData();
});