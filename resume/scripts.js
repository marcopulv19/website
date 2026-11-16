let alerted = false;

function checkScreenSize() {
  if (window.innerWidth < 768 && !alerted) {
    alert("Screen size is less than 768px!\nThe resume will be displayed in reduced version.");
    alerted = true;
  } else if (window.innerWidth >= 768) {
    alerted = false;
  }
}

window.addEventListener('resize', checkScreenSize);
checkScreenSize();
