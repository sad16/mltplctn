if (~location.href.indexOf('multiplications')) {
  document.addEventListener("DOMContentLoaded", multiplicationsReady);
}

function multiplicationsReady() {
  var id = document.getElementById("multiplication_id").innerText;
  subscribeToMultiplicationChannel(id);
  callMultiplication(id);
}