if (location.pathname == "/") {
  document.addEventListener("DOMContentLoaded", welcomeReady);
}

function welcomeReady() {
  var form = document.getElementById("new_multiplication");

  form.addEventListener("ajax:success", function(event) {
    xhr = event.detail[0];
    redirect_url = xhr.success.result.redirect_url;
    window.open(redirect_url, '_self');
  });

  form.addEventListener("ajax:error", function(event) {
    xhr = event.detail[0];
    errors = xhr.error.result.errors;
    console.log(errors);
  });
}
