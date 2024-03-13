document.addEventListener("DOMContentLoaded", function() {
  document.querySelector(".navbar-top").style.display = "none";

  document.addEventListener("click", function(event) {
    const isButton = event.target.closest(".button-add-functionality");
    const navbarTop = document.querySelector(".navbar-top");

    if (isButton) {
      if (navbarTop.style.display === 'none') {
        navbarTop.style.display = "";
      } else {
        navbarTop.style.display = "none";
      }
    } else {
      navbarTop.style.display = "none";
    }
  });
});
