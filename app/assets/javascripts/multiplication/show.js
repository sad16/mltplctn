if (~location.href.indexOf('multiplications')) {
  document.addEventListener("DOMContentLoaded", ready);
}

function ready() {
  var id = document.getElementById("multiplication_id").innerText;
  subscribeToMultiplicationChannel(id);
}