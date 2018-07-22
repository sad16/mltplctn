if (~location.href.indexOf('multiplications')) {
  document.addEventListener('DOMContentLoaded', multiplicationsReady);
}

function multiplicationsReady() {
  var id = findElementById('multiplication_id').innerText;
  subscribeToMultiplicationChannel(id);
  callMultiplication(id);
}