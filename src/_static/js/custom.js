// Implement Details-like hide/show on class "details"

$(function(){
    // Wrap list item contents after 'first' with a details div.
    $("ol > li > .first").each(function(){
	$(this).siblings().wrapAll(
	    "<div class='details'></div>"
	)
    });

    // Wrap style-test code blocks with a details div.
    $(".style-checks, .extra-checks, .proselint-extra-checks").each(function(){
	$(this).wrap(
	    "<div class='details'></div>"
	)
    });
    // Add a toggler to each details element.
    var id = 1000000
    $(".details").each(function(index){
	id = id + 1;
	$(this).attr('id', id);
	togl = "<span class='toggler hiding' data-toggle='" + id + "'></span><br>";
	$(this).before(togl);
	$(this).addClass('hidden');
	$(this).has("img:only-child").addClass('screenshot-only');
	$(this).has(".style-checks, .extra-checks, .proselint-extra-checks").addClass('code-only');
	if ( $(this).is("img") ) {
	    $(this).addClass("screenshot-only");
	}
    });

    // Add class to list items that include togglers
    $("li").has(".details").each(function(index){
	$(this).addClass("has-details");
    });

    // Define the toggler labels
    hiding_label = "[<span class='toggle-sign'>&plus;</span>] show details";
    showing_label = "[<span class='toggle-sign'>&minus;</span>] hide details";
    ss_hiding_label = "[<span class='toggle-sign'>&plus;</span>] show screenshot";
    ss_showing_label = "[<span class='toggle-sign'>&minus;</span>] hide screenshot";
    code_hiding_label = "[<span class='toggle-sign'>&plus;</span>] show code<br>";
    code_showing_label = "[<span class='toggle-sign'>&minus;</span>] hide code<br>";


    // Add labels and onclick function to togglers
    $(".toggler").each(function(index){
	if ($(this).siblings().hasClass('screenshot-only')) {
	    $(this).html(ss_hiding_label);
	} else if ($(this).siblings().hasClass('code-only')) {
	    $(this).html(code_hiding_label);
	} else {
	    $(this).html(hiding_label);
	}
	$(this).click(function(e){
	    toggle_image = $('#' + $(this).attr('data-toggle'));
	    if ($(this).hasClass('hiding')) {
		$(this).removeClass('hiding');
		toggle_image.removeClass("hidden");
		if ($(this).siblings().hasClass('screenshot-only')) {
		    $(this).html(ss_showing_label);
		} else if ($(this).siblings().hasClass('code-only')) {
		    $(this).html(code_showing_label);
		} else {
		    $(this).html(showing_label);
		}
	    } else {
		$(this).addClass('hiding');
		toggle_image.addClass("hidden");
		if ($(this).siblings().hasClass('screenshot-only')) {
		    $(this).html(ss_hiding_label);
		} else if ($(this).siblings().hasClass('code-only')) {
		    $(this).html(code_hiding_label);
		} else {
		    $(this).html(hiding_label);
		}
	    }
	})
    });    
});


// Add a class to dt elements
// when they contain guilabel or menuselection
// so that we can style away collisions between lines.
// Problem discovered while working on issue #399

$('dt').has('.guilabel, .menuselection').addClass('gui-term')
