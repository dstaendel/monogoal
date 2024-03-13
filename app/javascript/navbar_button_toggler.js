document.addEventListener("DOMContentLoaded", function() {
  // document.querySelector(".navbar-top").style.display = "none";

  document.addEventListener("click", function(event) {
    const isButton = event.target.closest(".button-add-functionality");
    // console.log(event.target.closest(".button-add-functionality"));
    const navbarTop = document.querySelector(".navbar-top");

    if (isButton) {
      console.log(isButton);
      console.log(navbarTop);
      navbarTop.classList.remove("d-none");
    } else {
      navbarTop.classList.add("d-none");
    }
  });
});
