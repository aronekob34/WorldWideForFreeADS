var ready = function() {

    /* Highlighting Navbar link as active */
    var url = window.location.pathname, 
        urlRegExp = new RegExp(url.replace(/\/$/,'')); 
    
    // now grab every link from the navigation
    /*    $('.sidebar a').each(function(){
            // and test its href against the url pathname regexp
            if(urlRegExp.test(this.href)){
                $(this).parents('li').addClass('active');
            }
        });*/

    /* GET companies#index show Print Settings */
    if (urlRegExp.test(/\/companies/)) {
        $('#runForm').hide();
    }

    /* GET companies#index tooltip*/
    $('.options a').tooltip();


    /* GET companies#new Managing Checkboxes Effects*/
    if($('#company_own_style_true').is(':checked')){
        $('.flyer_fields').show();
    } else {
        $('.flyer_fields').hide();
    }

    $("label[for=company_own_style_true] span.second-icon").click(function () {
            $('.flyer_fields').show();
    });

    $("label[for=company_own_style_false] span.second-icon").click(function () {
            $('.flyer_fields').hide();
    });


    /* GET companies#new Managing Checkboxes Effects*/
    /*$('.checkboxes').hide();*/

    if($('#campaign_worldwide_false').is(':checked')) {
        $('.checkboxes').show();
    } else {
        $('.checkboxes').hide();
    }

    $("label[for=campaign_worldwide_true] span.second-icon").click(function () {
    		$('.checkboxes').hide();
    });

    $("label[for=campaign_worldwide_false] span.second-icon").click(function () {
    		$('.checkboxes').show();
    });

    /* GET companies#new Managing Checkboxes Effects*/
    
    $("label[for=company_campaign_worldwide_true] span.second-icon").click(function () {
            $('.checkboxes').hide();
    });

    $("label[for=company_campaign_worldwide_false] span.second-icon").click(function () {
            $('.checkboxes').show();
    });

    /* MEDIA QUERIES */

    /* GET companies#index */

    if ($(window).width() <= 991) { 
        $('.navbarLinks').click(function(){
            $('html').removeClass('nav-open');
            lbd.misc.navbar_menu_visible = 0;
            $('#bodyClick').remove();
             setTimeout(function(){
                $toggle.removeClass('toggled');
             }, 400);

            $('#printButton').click(function(){
                $('#runForm').show("slow");
            });             

        });

    }    

    $('#printButton').click(function(){
        $('#runForm').show("slow");
    });

    /* GET campaigns#index mobile 360px changing the buttons and removing group div*/

    /*if ($(window).width() < 390) { $("#btn-group").removeClass("btn-group"); }*/

}

/* GET companies#new Update char count */

function updateCountdown() {
    // 360 is the max description length
    var remaining = 1500 - $('#company_description').val().length;
    var total = $('#company_description').val().length
    jQuery('.countdown').text(total + ' characters, ' + remaining + ' characters remaining.');
}


$(document).on('turbolinks:load', ready);

$(document).on('turbolinks:load', function() {
    url = window.location.pathname;
    if (url == "/companies/new") {
        updateCountdown();
        $('#company_description').on('input', updateCountdown);
        $('#company_description').keyup(updateCountdown);
    }
});
