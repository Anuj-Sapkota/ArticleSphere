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
   
   // Handle dropdown menu item clicks
   document.querySelectorAll('.dropdown-content a').forEach(link => {
       link.addEventListener('click', function(event) {
           event.preventDefault();
           const action = this.textContent.trim();
           alert(`${action} action selected`);
           document.getElementById('profileDropdown').style.display = 'none';
       });
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
   
   // Auto-resize textarea
   const textarea = document.querySelector('.article-content');
   textarea.addEventListener('input', function() {
       this.style.height = 'auto';
       this.style.height = this.scrollHeight + 'px';
   });
   
   // --------- FORMATTING TOOLBAR FUNCTIONALITY ---------
   document.querySelectorAll('.toolbar-btn').forEach(button => {
       button.addEventListener('click', function() {
           const command = this.querySelector('i').className.split('-').pop();
           let formatCommand;
           let value = null;
           
           switch(command) {
               case 'bold':
                   formatCommand = 'bold';
                   break;
               case 'italic':
                   formatCommand = 'italic';
                   break;
               case 'link':
                   const url = prompt('Enter the URL:');
                   if (url) {
                       formatCommand = 'createLink';
                       value = url;
                   }
                   break;
               case 'image':
                   alert('Image upload functionality would be here');
                   return;
           }
           
           if (formatCommand) {
               document.execCommand(formatCommand, false, value);
               textarea.focus();
           }
       });
   });
   
   // --------- TOP NAV BUTTON FUNCTIONALITY ---------
   // Publish button
   document.querySelector('.publish-btn').addEventListener('click', function() {
       const title = document.querySelector('.article-title').value;
       const content = document.querySelector('.article-content').value;
       
       if (!title || title === 'Title' || !content) {
           alert('Please add both a title and content before publishing.');
       } else {
           alert('Article published successfully!');
           // Here you would typically save the article data or redirect
       }
   });
   
   // More options button
   document.querySelector('.icon-btn:first-of-type').addEventListener('click', function() {
       alert('More options menu would open here');
   });
   
   // Notifications button
   document.querySelector('.icon-btn:nth-of-type(2)').addEventListener('click', function() {
       alert('Notifications panel would open here');
   });
   
   // Add section button
   document.querySelector('.add-content-btn').addEventListener('click', function() {
       const options = ['Text', 'Image', 'Embed', 'Code', 'Quote'];
       const option = prompt(`Add content section:\n${options.join(', ')}`);
       
       if (option) {
           const lowerOption = option.toLowerCase();
           if (options.map(o => o.toLowerCase()).includes(lowerOption)) {
               alert(`${option} section would be added here`);
               // Implementation would add the appropriate element
           } else {
               alert('Invalid option selected');
           }
       }
   });
   
   // Initialize the page
   document.addEventListener('DOMContentLoaded', function() {
       console.log('Article editor initialized');
       
       // Make the textarea content-editable to support formatting
       textarea.setAttribute('contenteditable', 'true');
       
       // Set initial height of textarea
       textarea.style.height = textarea.scrollHeight + 'px';
   });