App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    var list      = $('.users');
    var thread    = $('.thread');
    var user    = thread.data('user');
    var latest    = $('.message[data-user="'+data.user+'"]');
 
    // prepend to message thread
    if (thread.length &&
        data.user == user) thread.prepend(data.html);
 
    // prepend to list of ongoing threads
    if (list.length) {
      latest.remove();
      list.prepend(data.html);
    }
 
    $('.message:first').transition('flash');
  }
});