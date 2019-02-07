import consumer from "./consumer"

// this the client side, where  

consumer.subscriptions.create("CommentsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    $('#comments').append data.comment
  }
});
