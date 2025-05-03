
    document.getElementById('profileBtn').addEventListener('click', function(event) {
        event.stopPropagation(); // Prevents closing immediately
        const dropdown = document.getElementById('profileDropdown');
        dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
    });

    // 2. Close dropdown when clicking elsewhere
    window.addEventListener('click', function(event) {
        const dropdown = document.getElementById('profileDropdown');
        if (dropdown && dropdown.style.display === 'block') {
            dropdown.style.display = 'none';
        }
    });

    
