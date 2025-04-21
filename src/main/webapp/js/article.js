document.addEventListener('DOMContentLoaded', function() {
    const viewCommentsBtn = document.querySelector('.view_comments_btn');
    const viewCommentsDiv = document.querySelector('.view_comments');
    viewCommentsBtn.addEventListener('click', function() {
        viewCommentsDiv.classList.toggle('show');
    });
});