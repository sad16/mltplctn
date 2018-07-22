if (location.pathname == "/") {
  document.addEventListener("DOMContentLoaded", welcomeReady);
}

function welcomeReady() {
  var form = findElementById("new_multiplication");

  form.addEventListener("ajax:success", function(event) {
    clearFormErrors(form);

    var xhr = event.detail[0];
    var redirect_url = xhr.success.result.redirect_url;

    window.open(redirect_url, '_self');
  });

  form.addEventListener("ajax:error", function(event) {
    clearFormErrors(form);

    var xhr = event.detail[0];
    var errors = xhr.error.result.errors;

    for (field in errors) {
      var error_field = findElementById(field + "_errors");
      error_field.innerText = errors[field][0];
    }
  });
}
