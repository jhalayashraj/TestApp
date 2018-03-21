// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.validate.min.js
//= require bootstrap-sprockets
//= require bootstrap.min
//= require turbolinks
//= require bootstrap-datepicker
//= require bootstrap-tagsinput
//= require tinymce
//= require jquery_nested_form
//= require_tree .

$(document).ready(function () {
   $('#new_user').validate({
   	rules: {
   		"user[password]":{
          required: true,
          minlength: 6
      },
      "user[password_confirmation]":{
          minlength: 6,
          equalTo: "#user_password"
      }
   	}
   });
   validation();
});

function validation()
{
  $('#post-form').validate({
    rules: {
      "post[content]": {
        required: true,
        remote: {
          url: '/content_validator',
          type: 'get',
          data: {
            'content': $('#content').val()
          }
        }
      }
    },
    messages: {
      "post[content]": {
        remote: "This Post is Already Present!"
      } 
    },
  });
  $('#comment-form').validate({
    rules: {
      "comment[content]": {
        required: true,
        remote: {
          url: '/content_validator_comment',
          type: 'get',
          data: {
            'content': $('#content').val()
          }
        }
      }
    },
    messages: {
      "comment[content]": {
        remote: "This Comment is Already Present!"
      }
    },
  });
}