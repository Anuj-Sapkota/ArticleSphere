
document.addEventListener('DOMContentLoaded', function() {
    // Close button functionality is already handled by onclick attribute
    
    // Post button functionality
    document.querySelector('.post-btn').addEventListener('click', function() {
        const form = document.getElementById('article-form');
        if (form.checkValidity()) {
            // Create FormData object to easily handle file uploads if needed
            const formData = new FormData();
            
            formData.append('title', document.getElementById('title').value);
            formData.append('category', document.getElementById('category').value);
            formData.append('content', document.getElementById('content').value);
            
            const imageInput = document.getElementById('image-upload');
            if (imageInput.files.length > 0) {
                formData.append('image', imageInput.files[0]);
            }
            
            // You have two options:
            
            // Option 1: Submit via AJAX (requires server-side handling)
            /*
            fetch('your-article-submit-servlet-url', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
                window.location.href = 'profile.jsp';
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to submit article. Please try again.');
            });
            */
            
            // Option 2: Create a hidden form and submit it traditionally
            const hiddenForm = document.createElement('form');
            hiddenForm.method = 'POST';
            hiddenForm.action = 'ArticleServlet'; // Your servlet URL
            hiddenForm.enctype = 'multipart/form-data';
            
            for (const [key, value] of formData.entries()) {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = key;
                input.value = value instanceof File ? value.name : value;
                hiddenForm.appendChild(input);
            }
            
            document.body.appendChild(hiddenForm);
            hiddenForm.submit();
        } else {
            // Trigger HTML5 validation
            form.reportValidity();
        }
    });
    
    // Image upload functionality
    document.querySelector('.image-icon').addEventListener('click', function() {
        document.getElementById('image-upload').click();
    });
    
    // Display selected image name
    document.getElementById('image-upload').addEventListener('change', function() {
        if (this.files.length > 0) {
            const fileName = this.files[0].name;
            // Create a small label next to the icon
            const fileLabel = document.createElement('span');
            fileLabel.className = 'file-name';
            fileLabel.textContent = fileName;
            
            // Remove any existing label
            const existingLabel = document.querySelector('.file-name');
            if (existingLabel) {
                existingLabel.remove();
            }
            
            // Add the new label
            document.querySelector('.image-upload').appendChild(fileLabel);
        }
    });
});
