function submitArticle() {
         document.getElementById('article-form').submit();
     }

     function displayFileName(input) {
         const fileName = input.files.length > 0 ? input.files[0].name : "No file chosen";
         document.getElementById('file-name').textContent = fileName;
     }