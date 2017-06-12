var ready = function() {

    $('#bouncing-button').mouseover(function(){
        var $this = $(this);
        if (!$this.is(":animated"))
            $(this).effect("bounce", { times: 5 }, 2000);
    });

    $('.buttons .btn').mouseover(function(){
        var $this = $(this);
        if (!$this.is(":animated"))
            $(this).effect("bounce", { times: 5 }, 2000);
    });

    /* cookie consent */
    window.cookieconsent.initialise({
      "palette": {
        "popup": {
          "background": "#000"
        },
        "button": {
          "background": "#f1d600"
        }
      },
      "position": "top"
    })    

}

$(document).on('turbolinks:load', ready);