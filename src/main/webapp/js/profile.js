/**
 * 
 */

// Close button functionality
   document.querySelector('.close-btn').addEventListener('click', function() {
     alert('Close button clicked');
   });

   // Create button functionality
   document.querySelector('.create-btn').addEventListener('click', function() {
     alert('Create button clicked');
   });

   // View more functionality
   document.querySelectorAll('.view-more').forEach(function(element) {
     element.addEventListener('click', function() {
       alert('View more clicked');
     });
   });