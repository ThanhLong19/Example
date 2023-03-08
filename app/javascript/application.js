// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).on('turbolinks:load', function () {
  $('form').on('click', '.add_fields', function (event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $('.fields').append($(this).data('fields').replace(regexp, time));
  return event.preventDefault();
  });
});
