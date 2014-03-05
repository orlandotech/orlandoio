// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require_tree .
//= require twitter/bootstrap
//= require jquery_nested_form
//= require jquery.tokeninput
//= require select2
//= require turbolinks

$(function() {

  $("#tags").select2({
    placeholder: "Search skills",
    allowClear: true,
    width: "resolve"
  });

  $("#skills_tags").tokenInput("/tags.json", {
      prePopulate:       $("#skills_tags").data("pre"),
      allowCustomEntry: true,
      noResultsText:     "No results, needs to be created.",
      animateDropdown:   false,
      theme: 'facebook',
      onResult: function (results) {
            if ( results.length == 0 ){
              result = new Object();
              result['name']  = $('#token-input-skills').val();
              result['id']    = $('#token-input-skills').val();
              results.push(result);
            }
            return results;
        }
  });


  !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
});