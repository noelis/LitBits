"use strict";

// validate sign-up form on key-up and submit

$(document).ready(function() {
    console.log("Starting validation..");
    // set-up required parameters/form logic.
    $("#register").validate({
        debug: true,
        rules: {
            name: {
                required: true,
                minlength: 4,
            },
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 8
            },
            confirm_password: {
                required: true,
                minlength: 8,
                equalTo: "#password"
            }
        },
        // If user leaves field empty or does not enter the min. # of characters, raise an error.
        messages: {
            name: {
                required: "Please enter your name.",
                minlength: "Your  name must be at last 4 characters long."
            },
            password:{
                required: "Please enter a password.",
                minlength: "Your password must be at least 8 characters long."
            },
            confirm_password: {
                required: "Please enter a password.",
                minlength: "Your password must be at least 8 characters long.",
                equalTo: "Error: Your password must match in order to continue. "
            }
        },

        submitHandler: function(form) {
            form.submit();
        }

        });
});