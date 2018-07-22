function callMultiplication(id) {
  var authorization_token = document.getElementsByName('csrf-token')[0].content;
  var xhr = new XMLHttpRequest();
  xhr.open('PATCH', '/multiplications/' + id + '/call', true);
  xhr.setRequestHeader('X-CSRF-Token', authorization_token);
  xhr.send();
}

function subscribeToMultiplicationChannel(id) {
  App.cable.subscriptions.create({
    channel: 'MultiplicationChannel',
    id: id
  }, {
    connected: function() {
      // Called when the subscription is ready for use on the server
      // console.log('MultiplicationChannel connected');
    },
    disconnected: function() {
      // Called when the subscription has been terminated by the server
      // console.log('MultiplicationChannel disconnected');
    },
    received: function(data) {
      // Called when theres incoming data on the websocket for this channel
      var multiplication = data.multiplication;
      changeInnerTextInElement(findElementById('multiplicand'), multiplication.multiplicand); 
      changeInnerTextInElement(findElementById('multiplier'), multiplication.multiplier); 
      changeInnerTextInElement(findElementById('result'), multiplication.result); 
      changeInnerTextInElement(findElementById('sum'), multiplication.sum); 
    }
  });
}

