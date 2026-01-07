
// **** FILTER PANEL SETUP ****
/* Set the width of the filter panel to 250px (show it) */
function openNav() {
  document.getElementById("myFilterpanel").style.width = "300px";
}

/* Set the width of the sidebar to 0 (hide it) */
function closeNav() {
  document.getElementById("myFilterpanel").style.width = "0";
}


// *** SEARCH box show / hide / change icon ***

  const hamburger = document.querySelector('.hamburger');
  const navLinks = document.querySelector('.nav-items');
  const icon = hamburger.querySelector('i');

  hamburger.addEventListener('click', () => {
    navLinks.classList.toggle('show');
    icon.classList.toggle('fa-xmark');
    icon.classList.toggle('fa-bars');

  });
