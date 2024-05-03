function paystackPopUp(pubKey, email, amount, ref, onClosed, callback) {
    try {
      let handler = PaystackPop.setup({
        key: pubKey,
        email: email,
        amount: amount,
        ref: ref,
        onClose: function () {
          alert("Window closed.");
          onClosed();
        },
        callback: function (response) {
          callback();
          let message = "Payment complete! Reference: " + response.reference;
          alert(message);
        },
      });
      return handler.openIframe();
    } catch (error) {
      console.log(error);
    }
  }