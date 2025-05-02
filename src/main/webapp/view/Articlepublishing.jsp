<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Create New Article</title>
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/ArticlePublish.css">
</head>
<body>
   
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="logo" onclick="window.location.href='index.jsp">Article Sphere</div>
        
        <div class="search-container">
            <span class="search-icon">
                <i class="fa-solid fa-magnifying-glass"></i>
            </span>
            <input type="text" class="search-input" placeholder="Search">
        </div>
        
        <div class="nav-buttons">
            <button class="publish-btn" id="publishBtn">Publish</button>
            <button class="icon-btn" onclick="window.location.href='Articlepublishing.jsp">
                <i class="fa-solid fa-ellipsis"></i>
            </button>
            <button class="icon-btn" onclick="navigateTo('notifications')">
                <i class="fa-solid fa-bell"></i>
            </button>
            <div class="dropdown">
                <button class="profile-btn" id="profileBtn">B</button>
                <div class="dropdown-content" id="profileDropdown">
                    <a href="#" onclick="window.location.href='index.jsp">
                        <span class="menu-icon"><i class="fa-solid fa-user"></i></span>
                        Profile
                    </a>
                    <a href="#" onclick="navigateTo('stories')">
                        <span class="menu-icon"><i class="fa-solid fa-book"></i></span>
                        Stories
                    </a>
                    <div class="divider"></div>
                    <a href="#" onclick="navigateTo('settings')">
                        <span class="menu-icon"><i class="fa-solid fa-gear"></i></span>
                        Settings
                    </a>
                    <a href="#" onclick="navigateTo('signout')">
                        <span class="menu-icon"><i class="fa-solid fa-right-from-bracket"></i></span>
                        Sign out
                    </a>
                </div>
            </div>
        </div>
    </nav>
    
    <!-- Main Content - Article Editor -->
    <div class="main-content">
        <div class="formatting-toolbar">
            <button class="toolbar-btn" data-command="bold">
                <i class="fa-solid fa-bold"></i>
            </button>
            <button class="toolbar-btn" data-command="italic">
                <i class="fa-solid fa-italic"></i>
            </button>
            <button class="toolbar-btn" data-command="link">
                <i class="fa-solid fa-link"></i>
            </button>
            <button class="toolbar-btn" data-command="image">
                <i class="fa-solid fa-image"></i>
            </button>
        </div>
        
        <input type="text" class="article-title" placeholder="Title" value="">
        
        <div class="article-content" contenteditable="true" placeholder="Tell your story..."></div>
        
        <div id="sectionsContainer">
            <!-- Sections will be added here dynamically -->
        </div>
        
        <button class="add-content-btn" id="addSectionBtn">
            <i class="fa-solid fa-plus"></i>
            Add section
        </button>
    </div>
    
    <!-- Image Upload Modal -->
    <div class="modal" id="imageModal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">Add Image</div>
                <button class="close-modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="file-input-container">
                    <input type="file" id="imageUpload" class="file-input" accept="image/*">
                    <label for="imageUpload" class="file-input-label">
                        <i class="fa-solid fa-cloud-arrow-up"></i> 
                        Click to upload an image or drag and drop
                    </label>
                </div>
                <div class="image-preview-container" id="previewContainer">
                    <img id="imagePreview" class="image-preview">
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" id="cancelImage">Cancel</button>
                <button class="btn btn-primary" id="insertImage">Insert Image</button>
            </div>
        </div>
    </div>
    
    <!-- Add Section Modal -->
    <div class="modal" id="sectionModal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">Add New Section</div>
                <button class="close-modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="section-options">
                    <button class="btn" data-section-type="text">
                        <i class="fa-solid fa-align-left"></i> Text
                    </button>
                    <button class="btn" data-section-type="image">
                        <i class="fa-solid fa-image"></i> Image
                    </button>
                    <button class="btn" data-section-type="quote">
                        <i class="fa-solid fa-quote-left"></i> Quote
                    </button>
                    <button class="btn" data-section-type="code">
                        <i class="fa-solid fa-code"></i> Code
                    </button>
                    <button class="btn" data-section-type="embed">
                        <i class="fa-solid fa-video"></i> Embed
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Publish Modal -->
    <div class="modal" id="publishModal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">Publish Article</div>
                <button class="close-modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="form-label">Add tags (up to 5)</label>
                    <input type="text" id="tagInput" class="tag-input" placeholder="Add a tag and press Enter">
                    <div class="tag-container" id="tagsContainer"></div>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Category</label>
                    <select class="category-select" id="categorySelect">
                        <option value="">Select a category</option>
                        <option value="technology">Technology</option>
                        <option value="science">Science</option>
                        <option value="health">Health</option>
                        <option value="business">Business</option>
                        <option value="culture">Culture</option>
                        <option value="politics">Politics</option>
                        <option value="education">Education</option>
                        <option value="arts">Arts</option>
                        <option value="sports">Sports</option>
                        <option value="travel">Travel</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Reading time: <span id="readingTime">0 min</span></label>
                </div>
                
                <div class="form-group">
                    <label class="form-label">SEO Preview</label>
                    <div class="seo-preview">
                        <div style="font-size: 1.1rem; color: #1a0dab; margin-bottom: 5px;" id="seoTitle">Title preview</div>
                        <div style="color: #006621; font-size: 0.9rem; margin-bottom: 5px;">articlepshere.com › <span id="seoCategory">category</span></div>
                        <div style="color: #545454; font-size: 0.9rem;" id="seoDescription">Your article description will appear here...</div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" id="saveDraft">Save as Draft</button>
                <button class="btn btn-primary" id="confirmPublish">Publish Now</button>
            </div>
        </div>
    </div>
    
    <!-- Notification -->
    <div class="notification" id="notification"></div>

    <script>
    // --------- NAVIGATION FUNCTIONALITY ---------
    function navigateTo(page) {
        showNotification(`Navigating to ${page} page`, 'success');
        
        // In a real app, you would redirect to the appropriate page
        // For example: window.location.href = `${page}.jsp`;
    }
    
    // --------- PROFILE DROPDOWN FUNCTIONALITY ---------
    // Toggle dropdown menu
    document.getElementById('profileBtn').addEventListener('click', function(event) {
        event.stopPropagation();
        const dropdown = document.getElementById('profileDropdown');
        dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
    });
    
    // Close dropdown when clicking elsewhere
    window.addEventListener('click', function(event) {
        const dropdown = document.getElementById('profileDropdown');
        if (dropdown && dropdown.style.display === 'block') {
            dropdown.style.display = 'none';
        }
    });
    
    // --------- TEXT EDITOR FUNCTIONALITY ---------
    // Placeholder functionality for title
    const titleInput = document.querySelector('.article-title');
    titleInput.addEventListener('focus', function() {
        if (this.value === 'Title') {
            this.value = '';
            this.classList.remove('placeholder');
        }
    });
    
    titleInput.addEventListener('blur', function() {
        if (this.value === '') {
            this.value = 'Title';
            this.classList.add('placeholder');
        }
    });
    
    // --------- FORMATTING TOOLBAR FUNCTIONALITY ---------
    document.querySelectorAll('.toolbar-btn').forEach(button => {
        button.addEventListener('click', function() {
            const command = this.getAttribute('data-command');
            
            if (command === 'image') {
                openModal('imageModal');
                return;
            }
            
            if (command === 'link') {
                const url = prompt('Enter the URL:');
                if (url) {
                    document.execCommand('createLink', false, url);
                }
                return;
            }
            
            document.execCommand(command, false, null);
            document.querySelector('.article-content').focus();
        });
    });
    
    // --------- IMAGE UPLOAD FUNCTIONALITY ---------
    // Handle image upload preview
    const imageUpload = document.getElementById('imageUpload');
    const imagePreview = document.getElementById('imagePreview');
    const previewContainer = document.getElementById('previewContainer');
    
    imageUpload.addEventListener('change', function() {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            
            reader.onload = function(e) {
                imagePreview.src = e.target.result;
                previewContainer.style.display = 'flex';
            };
            
            reader.readAsDataURL(file);
        }
    });
    
    // Insert image into content
    document.getElementById('insertImage').addEventListener('click', function() {
        const imgSrc = imagePreview.src;
        if (imgSrc) {
            const imgElement = document.createElement('img');
            imgElement.src = imgSrc;
            imgElement.style.maxWidth = '100%';
            imgElement.style.height = 'auto';
            imgElement.style.margin = '15px 0';
            imgElement.style.borderRadius = '8px';
            
            document.querySelector('.article-content').appendChild(imgElement);
            document.querySelector('.article-content').appendChild(document.createElement('br'));
            
            // Reset and close modal
            closeModal('imageModal');
            imageUpload.value = '';
            previewContainer.style.display = 'none';
            
            showNotification('Image added successfully', 'success');
        }
    });
    
    // Cancel image upload
    document.getElementById('cancelImage').addEventListener('click', function() {
        closeModal('imageModal');
        imageUpload.value = '';
        previewContainer.style.display = 'none';
    });
    
    // --------- ADD SECTION FUNCTIONALITY ---------
    let sectionCounter = 0;
    
    // Open section type selection modal
    document.getElementById('addSectionBtn').addEventListener('click', function() {
        openModal('sectionModal');
    });
    
    // Handle section type selection
    document.querySelectorAll('[data-section-type]').forEach(button => {
        button.addEventListener('click', function() {
            const sectionType = this.getAttribute('data-section-type');
            addSection(sectionType);
            closeModal('sectionModal');
        });
    });
    
    // Add new section
    function addSection(type) {
        sectionCounter++;
        const sectionId = `section-${sectionCounter}`;
        
        const section = document.createElement('div');
        section.className = 'section';
        section.id = sectionId;
        
        const sectionHeader = document.createElement('div');
        sectionHeader.className = 'section-heading';
        
        const sectionTitle = document.createElement('div');
        sectionTitle.className = 'section-title';
        
        const sectionControls = document.createElement('div');
        sectionControls.className = 'section-controls';
        
        const moveUpBtn = document.createElement('button');
        moveUpBtn.className = 'toolbar-btn';
        moveUpBtn.innerHTML = '<i class="fa-solid fa-arrow-up"></i>';
        moveUpBtn.onclick = function() { moveSection(sectionId, 'up'); };
        
        const moveDownBtn = document.createElement('button');
        moveDownBtn.className = 'toolbar-btn';
        moveDownBtn.innerHTML = '<i class="fa-solid fa-arrow-down"></i>';
        moveDownBtn.onclick = function() { moveSection(sectionId, 'down'); };
        
        const deleteBtn = document.createElement('button');
        deleteBtn.className = 'toolbar-btn';
        deleteBtn.innerHTML = '<i class="fa-solid fa-trash"></i>';
        deleteBtn.onclick = function() { deleteSection(sectionId); };
        
        sectionControls.appendChild(moveUpBtn);
        sectionControls.appendChild(moveDownBtn);
        sectionControls.appendChild(deleteBtn);
        
        sectionHeader.appendChild(sectionTitle);
        sectionHeader.appendChild(sectionControls);
        
        const sectionContent = document.createElement('div');
        sectionContent.className = 'section-content';
        
        // Create different content based on section type
        switch(type) {
            case 'text':
                sectionTitle.textContent = 'Text Section';
                sectionContent.contentEditable = true;
                sectionContent.setAttribute('placeholder', 'Write your content here...');
                break;
                
            case 'image':
                sectionTitle.textContent = 'Image Section';
                
                const imageUploadContainer = document.createElement('div');
                imageUploadContainer.className = 'file-input-container';
                
                const fileInput = document.createElement('input');
                fileInput.type = 'file';
                fileInput.className = 'file-input';
                fileInput.accept = 'image/*';
                fileInput.id = `image-upload-${sectionCounter}`;
                
                const fileLabel = document.createElement('label');
                fileLabel.className = 'file-input-label';
                fileLabel.setAttribute('for', `image-upload-${sectionCounter}`);
                fileLabel.innerHTML = '<i class="fa-solid fa-cloud-arrow-up"></i> Click to upload an image';
                
                const sectionImagePreview = document.createElement('div');
                sectionImagePreview.className = 'image-preview-container';
                sectionImagePreview.style.display = 'none';
                
                const imgPreview = document.createElement('img');
                imgPreview.className = 'image-preview';
                
                fileInput.addEventListener('change', function() {
                    const file = this.files[0];
                    if (file) {
                        const reader = new FileReader();
                        
                        reader.onload = function(e) {
                            imgPreview.src = e.target.result;
                            sectionImagePreview.style.display = 'flex';
                        };
                        
                        reader.readAsDataURL(file);
                    }
                });
                
                sectionImagePreview.appendChild(imgPreview);
                imageUploadContainer.appendChild(fileInput);
                imageUploadContainer.appendChild(fileLabel);
                
                sectionContent.appendChild(imageUploadContainer);
                sectionContent.appendChild(sectionImagePreview);
                break;
                
            case 'quote':
                sectionTitle.textContent = 'Quote Section';
                
                const blockquote = document.createElement('blockquote');
                blockquote.contentEditable = true;
                blockquote.setAttribute('placeholder', 'Enter a quote...');
                blockquote.style.borderLeft = '4px solid #1a73e8';
                blockquote.style.paddingLeft = '15px';
                blockquote.style.fontStyle = 'italic';
                blockquote.style.color = '#555';
                
                const cite = document.createElement('div');
                cite.contentEditable = true;
                cite.setAttribute('placeholder', 'Source (optional)');
                cite.style.marginTop = '10px';
                cite.style.fontSize = '0.9rem';
                cite.style.textAlign = 'right';
                
                sectionContent.appendChild(blockquote);
                sectionContent.appendChild(cite);
                break;
                
            case 'code':
                sectionTitle.textContent = 'Code Section';
                
                const pre = document.createElement('pre');
                pre.style.backgroundColor = '#f5f5f5';
                pre.style.borderRadius = '4px';
                pre.style.padding = '15px';
                pre.style.overflowX = 'auto';
                pre.style.fontFamily = 'monospace';
                
                const code = document.createElement('code');
                code.contentEditable = true;
                code.setAttribute('placeholder', 'Enter code here...');
                
                pre.appendChild(code);
                sectionContent.appendChild(pre);
                break;
                
            case 'embed':
                sectionTitle.textContent = 'Embed Section';
                
                const embedInput = document.createElement('input');
                embedInput.type = 'text';
                embedInput.placeholder = 'Paste embed code or URL (YouTube, Twitter, etc.)';
                embedInput.style.width = '100%';
                embedInput.style.padding = '8px';
                embedInput.style.marginBottom = '10px';
                embedInput.style.border = '1px solid #ddd';
                embedInput.style.borderRadius = '4px';
                
                const embedBtn = document.createElement('button');
                embedBtn.textContent = 'Embed Content';
                embedBtn.className = 'btn btn-primary';
                embedBtn.style.marginRight = '10px';
                
                const embedPreview = document.createElement('div');
                embedPreview.className = 'embed-preview';
                embedPreview.style.marginTop = '15px';
                embedPreview.style.padding = '15px';
                embedPreview.style.border = '1px dashed #ddd';
                embedPreview.style.borderRadius = '4px';
                embedPreview.style.display = 'none';
                
                embedBtn.addEventListener('click', function() {
                    const url = embedInput.value.trim();
                    if (url) {
                        // Simple example for YouTube embed
                        if (url.includes('youtube.com') || url.includes('youtu.be')) {
                            let videoId = '';
                            if (url.includes('v=')) {
                                videoId = url.split('v=')[1].split('&')[0];
                            } else if (url.includes('youtu.be/')) {
                                videoId = url.split('youtu.be/')[1];
                            }
                            
                            if (videoId) {
                                embedPreview.innerHTML = `<iframe width="100%" height="315" src="https://www.youtube.com/embed/${videoId}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>`;
                                embedPreview.style.display = 'block';
                            } else {
                                showNotification('Invalid YouTube URL', 'error');
                            }
                        } else {
                            // For other embeds, just show a placeholder
                            embedPreview.innerHTML = `<div style="padding: 20px; background-color: #f5f5f5; text-align: center;">Embedded content from: ${url}</div>`;
                            embedPreview.style.display = 'block';
                        }
                    }
                });
                
                sectionContent.appendChild(embedInput);
                sectionContent.appendChild(embedBtn);
                sectionContent.appendChild(embedPreview);
                break;
        }
        
        section.appendChild(sectionHeader);
        section.appendChild(sectionContent);
        
        document.getElementById('sectionsContainer').appendChild(section);
        showNotification(`${type.charAt(0).toUpperCase() + type.slice(1)} section added`, 'success');
    }
    
    // Move section up or down
    function moveSection(sectionId, direction) {
        const section = document.getElementById(sectionId);
        const container = document.getElementById('sectionsContainer');
        const sections = container.children;
        
        let index;
        for (let i = 0; i < sections.length; i++) {
            if (sections[i].id === sectionId) {
                index = i;
                break;
            }
        }
        
        if (direction === 'up' && index > 0) {
            container.insertBefore(section, sections[index - 1]);
            showNotification('Section moved up', 'success');
        } else if (direction === 'down' && index < sections.length - 1) {
            container.insertBefore(sections[index + 1], section);
            showNotification('Section moved down', 'success');
        }
    }
    
    // Delete section
    function deleteSection(sectionId) {
        if (confirm('Are you sure you want to delete this section?')) {
            document.getElementById(sectionId).remove();
            showNotification('Section deleted', 'success');
        }
    }
    
    // --------- PUBLISH FUNCTIONALITY ---------
    // Open publish modal
    document.getElementById('publishBtn').addEventListener('click', function() {
        const title = document.querySelector('.article-title').value;
        const content = document.querySelector('.article-content').innerHTML;
        
        if (!title || title === 'Title' || !content || content === '<br>') {
            showNotification('Please add both a title and content before publishing', 'error');
            return;
        }
        
        // Update SEO preview
        document.getElementById('seoTitle').textContent = title;
        document.getElementById('seoDescription').textContent = getPreviewText(content, 160);
        
        // Calculate reading time
        const wordCount = countWords(content);
        const readingTime = Math.ceil(wordCount / 200); // Average reading speed: 200 words per minute
        document.getElementById('readingTime').textContent = `${readingTime} min read`;
        
        openModal('publishModal');
    });
    
    // Handle tags input
    const tagInput = document.getElementById('tagInput');
    const tagsContainer = document.getElementById('tagsContainer');
    const tags = new Set();
    
    tagInput.addEventListener('keydown', function(e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            
            const tag = this.value.trim();
            if (tag && tags.size < 5 && !tags.has(tag)) {
                addTag(tag);
                this.value = '';
            } else if (tags.size >= 5) {
                showNotification('Maximum 5 tags allowed', 'error');
            } else if (tags.has(tag)) {
                showNotification('Tag already exists', 'error');
            }
        }
    });
    
    function addTag(tagText) {
        tags.add(tagText);
        
        const tag = document.createElement('div');
        tag.className = 'tag';
        tag.innerHTML = `${tagText} <i class="fa-solid fa-xmark"></i>`;
        
        tag.querySelector('i').addEventListener('click', function() {
            tags.delete(tagText);
            tag.remove();
        });
        
        tagsContainer.appendChild(tag);
    }
    
    // Save as draft
    document.getElementById('saveDraft').addEventListener('click', function() {
        // In a real application, you would save the article to the database as a draft
        showNotification('Article saved as draft', 'success');
        closeModal('publishModal');
    });
    
    // Confirm publish
    document.getElementById('confirmPublish').addEventListener('click', function() {
        const title = document.querySelector('.article-title').value;
        const content = document.querySelector('.article-content').innerHTML;
        const category = document.getElementById('categorySelect').value;
        
        if (!category) {
            showNotification('Please select a category', 'error');
            return;
        }
        
        // Here you would typically send the data to the server
        const articleData = {
            title: title,
            content: content,
            tags: Array.from(tags),
            category: category,
            sections: getSectionsData()
        };
        
        // For demo purposes, we're just logging the data
        console.log('Publishing article:', articleData);
        
        closeModal('publishModal');
        showNotification('Article published successfully!', 'success');
        
        // In a real application, you would redirect to the published article
        setTimeout(() => {
            alert('Published successfully! In a real app, you would be redirected to your published article.');
        }, 1500);
    });
    
    // Get sections data
    function getSectionsData() {
        const sections = document.getElementById('sectionsContainer').children;
        const sectionsData = [];
        
        for (let i = 0; i < sections.length; i++) {
            const section = sections[i];
            const title = section.querySelector('.section-title').textContent;
            const content = section.querySelector('.section-content').innerHTML;
            
            sectionsData.push({
                type: title.split(' ')[0].toLowerCase(),
                content: content
            });
        }
        
        return sectionsData;
    }
    
    // --------- HELPER FUNCTIONS ---------
    // Modal functionality
    function openModal(modalId) {
        document.getElementById(modalId).style.display = 'block';
    }
    
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }
    
    // Close modals when clicking the X button
    document.querySelectorAll('.close-modal').forEach(button => {
        button.addEventListener('click', function() {
            const modal = this.closest('.modal');
            modal.style.display = 'none';
        });
    });
    
    // Close modals when clicking outside
    window.addEventListener('click', function(event) {
        document.querySelectorAll('.modal').forEach(modal => {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });
    });
    
    // Show notification
    function showNotification(message, type = '') {
        const notification = document.getElementById('notification');
        notification.textContent = message;
        notification.className = 'notification';
        
        if (type) {
            notification.classList.add(type);
        }
        
        notification.classList.add('show');
        
        setTimeout(() => {
            notification.classList.remove('show');
        }, 3000);
    }
    
    // Count words in HTML content
    function countWords(htmlString) {
        // Create a temporary div to parse HTML
        const tempDiv = document.createElement('div');
        tempDiv.innerHTML = htmlString;
        
        // Get the text content and count words
        const text = tempDiv.textContent || tempDiv.innerText;
        const words = text.trim().split(/\s+/);
        
        return words.length === 1 && words[0] === '' ? 0 : words.length;
    }
    
    // Get preview text for SEO description
    function getPreviewText(htmlString, maxLength) {
        const tempDiv = document.createElement('div');
        tempDiv.innerHTML = htmlString;
        
        let text = tempDiv.textContent || tempDiv.innerText;
        text = text.trim().replace(/\s+/g, ' ');
        
        if (text.length > maxLength) {
            text = text.substring(0, maxLength - 3) + '...';
        }
        
        return text;
    }
    
    // Initialize the page
    document.addEventListener('DOMContentLoaded', function() {
        console.log('Article editor initialized');
    });
    </script>
</body>
</html>