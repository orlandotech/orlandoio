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
//= require turbolinks

$(function() {
  $("#skills_tags").tokenInput("/tags.json", {
      prePopulate:       $("#skills_tags").data("pre"),
      preventDuplicates: true,
      allowCustomEntry: true,
      noResultsText:     "No results, needs to be created.",
      animateDropdown:   false,
      theme: 'facebook',
      onResult: function (results) {
            if ( results.length == 0 ){
              result = new Object();
              result['id']    = $('#token-input-skills').val();
              result['name']  = $('#token-input-skills').val();
              results.push(result);
            }
            return results;
        }
  });
});

window.analytics||(window.analytics=[]),window.analytics.methods=["identify","track","trackLink","trackForm","trackClick","trackSubmit","page","pageview","ab","alias","ready","group","on","once","off"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var method=window.analytics.methods[i];window.analytics[method]=window.analytics.factory(method)}window.analytics.load=function(t){var a=document.createElement("script");a.type="text/javascript",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"d2dq2ahtl5zl1z.cloudfront.net/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)},window.analytics.SNIPPET_VERSION="2.0.8",
window.analytics.load("tr23ud47wp");
window.analytics.page();
