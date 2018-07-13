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
      console.log("MultiplicationChannel received");
    }
  });
}