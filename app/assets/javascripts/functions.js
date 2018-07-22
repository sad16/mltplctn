function findElementById(id) {
  return document.getElementById(id);
}

function findElementsByClass(source, class_name) {
  return source.getElementsByClassName(class_name);
}

function changeInnerTextInElement(element, text) {
  element.innerText = text;
}

function clearFormErrors(form) {
  error_fields = findElementsByClass(form, 'error');

  for (var i = 0; i < error_fields.length; i++) {
    changeInnerTextInElement(error_fields[i], '')
  }
}