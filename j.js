var thisRandomVariable;

function tada() {
  thisRandomVariable = setTimeout(showPage, 3000);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("page-content").style.display = "block";
}