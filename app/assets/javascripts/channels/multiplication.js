function callMultiplication(id) {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', '/multiplications/' + id + '/call', true);
  xhr.send();
}

function subscribeToMultiplicationChannel(id) {
  App.cable.subscriptions.create({
    channel: "MultiplicationChannel",
    id: id
  }, {
    connected: function() {
      // Called when the subscription is ready for use on the server
      console.log("MultiplicationChannel connected");
    },
    disconnected: function() {
      // Called when the subscription has been terminated by the server
      console.log("MultiplicationChannel disconnected");
    },
    received: function(data) {
      // Called when theres incoming data on the websocket for this channel
      document.getElementById("max_multiplicand").innerText = data.multiplication.multiplicand;
      document.getElementById("max_multiplier").innerText = data.multiplication.multiplier;
      document.getElementById("result").innerText = data.multiplication.result;
      document.getElementById("sum").innerText = data.multiplication.sum;
    }
  });
}