<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome to Vökuró</title>
    {% if dispatcher.getControllerName() == "index" OR dispatcher.getControllerName() == "session" %}
      {{ stylesheet_link('/css/telisir.css') }}
    {% else %}
      {{ stylesheet_link('/css/admin-dark.css') }}
    {% endif %}
    {{ stylesheet_link('/css/bootstrap-datetimepicker.min.css') }}
    {{ stylesheet_link('/css/jquery.smartmenus.bootstrap.css') }}
    {{ stylesheet_link('/css/style.css') }}
    <!-- Text Editor -->
    {{ stylesheet_link('summernote/summernote.css') }}
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    {{ javascript_include('/js/moment.min.js') }}
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body>

    {{ content() }}

    <!-- datetimepicker -->
    {{ javascript_include('/js/bootstrap-datetimepicker.min.js') }}
    <!-- SmartMenus jQuery plugin -->
    {{ javascript_include('/js/jquery.smartmenus.min.js') }}
    <!-- SmartMenus jQuery Bootstrap Addon -->
    {{ javascript_include('/js/jquery.smartmenus.bootstrap.min.js') }}
    <!-- Text Editor -->
    {{ javascript_include('summernote/summernote.min.js') }}

    <script>
    $(document).ready(function () {
      // Sidebar Collapse
      $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
      });
      $('[data-toggle="tooltip"]').tooltip();

      // Backend Text Editor
      $('#summernote').summernote({
        height: 400,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
          ['fontname', ['fontname', 'fontsize']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'image', 'video']],
          ['view', ['fullscreen', 'codeview']]
        ],
        buttons: {
            image: function() {
            var ui = $.summernote.ui;
            var button = ui.button({
              contents: '<i class="fa fa-image" />',
              tooltip: "Image manager",
              click: function () {
                $('#modal-image').modal('show');
              }
            });
            return button.render();
          }
        },
        insertTableMaxSize: {
          col: 20,
          row: 20
        },
      });
      $('.insert-image').on('click', function() {
        var image = $(this).data('image');
        $('#summernote').summernote('editor.insertImage', image);
        $('#modal-image').modal('hide');
      });
      $(".thumb").on("click", function() {
         $('#imagepreview').attr('src', $(this).data('image'));
         $('#imagemodal').modal('show');
      });
      $(".close-modal").on("click", function() {
         $('#imagepreview').attr('src', '');
         $('#imagemodal').modal('hide');
         $('#imagemodaldelete').modal('hide');
      });
      var image_to_delete;
      var image_id;
      $(".delete-image").on("click",function() {
        $('#imagemodaldelete').modal('show');
        image_to_delete = $(this).data('image');
        image_id = $(this).data('image_id');
      });
      $('#delete_image').on('click', function() {
        $.ajax({
          type: "POST",
          data:({'image':image_to_delete}),
          url: "{{url('filemanager/delete')}}",
          success: function(data){
            $("#image_"+image_id).fadeOut()
            $('#imagemodaldelete').modal('hide');
          }
        });
      });
      $('#button-upload').on('click', function() {
        $('#form-upload').remove();
        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" value="" /></form>');
        $('#form-upload input[name="file"]').trigger('click');
        if (typeof timer != 'undefined') {
          clearInterval(timer);
        }
        timer = setInterval(function() {
          if ($('#form-upload input[name="file"]').val() != '') {
            clearInterval(timer);
            $.ajax({
              url: '{{url("filemanager/save")}}',
              type: 'post',
              data: new FormData($('#form-upload')[0]),
              dataType: 'json',
              cache: false,
              contentType: false,
              processData: false,
              beforeSend: function() {
                $('#button-upload').html('<i class="fa fa-circle-o-notch fa-spin"></i>&nbsp;&nbsp;UPLOADING');
                $('#button-upload').prop('disabled', true);
              },
              complete: function() {
                $('#button-upload').html('<i class="fa fa-upload"></i>&nbsp;&nbsp;UPLOAD IMAGE');
                $('#button-upload').prop('disabled', false);
              },
              success: function(json) {
                $('#summernote').summernote('editor.insertImage', json['content']);
                $('#modal-image').modal('hide');
              },

              error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }
            });
          }
        }, 500);
      });
      // create url/post_url from title
      function slugify(text) {
        // https://gist.github.com/mathewbyrne/1280286
        return text.toString().toLowerCase().trim()
        .replace(/&/g, '-and-')         // Replace & with 'and'
        .replace(/[\s\W-]+/g, '-')      // Replace spaces, non-word characters and dashes with a single dash (-)
      }
      $('input[name="post_title"]').keyup(function(){
        //console.log($(this).val());
        $slug = slugify($(this).val());
        $('input[name="post_url"]').val($slug);
      });
      // Date Time Picker
      $('.datetime').datetimepicker({
        format: "YYYY/MM/DD HH:mm:ss"
      });
      // auto save post
      $(function () {
        //setup before functions
        var typingTimer;                //timer identifier
        var doneTypingInterval = 5000;  //time in ms, 5 second for example
        var $input = $('#contentForm .note-editable');

        //on keyup, start the countdown
        $input.on('keyup', function () {
            clearTimeout(typingTimer);
            typingTimer = setTimeout(doneTyping, doneTypingInterval);
        });

        //on keydown, clear the countdown
        $input.on('keydown', function () {
            clearTimeout(typingTimer);
        });

        //user is "finished typing," do something
        function doneTyping () {
          //do something
          $.post(
            "{{ url('posts/create') }}", // url
            $("form#contentForm").serialize(), // data
            function () { // if success
              $("#new_post").remove();
              $(".notif").html('<div class="alert alert-success"><strong>Success!</strong> Simpan otomatis.</div>').fadeTo(3000, 500).slideUp(500, function(){
                  $(".alert-slideout").slideUp(500);
              });
            }
          )
          .fail(function (data) {
              alert( "error" );
          });
        }
      }); // E.O auto save post
      
      // Thousand separator
      (function($, undefined) {
          "use strict";
          // When ready.
          $(function() {
              var $form = $( "#form" );
              var $input = $form.find( "input[type='numeric']" );
              $input.on( "keyup", function( event ) {
                  // When user select text in the document, also abort.
                  var selection = window.getSelection().toString();
                  if ( selection !== '' ) {
                      return;
                  }
                  // When the arrow keys are pressed, abort.
                  if ( $.inArray( event.keyCode, [38,40,37,39] ) !== -1 ) {
                      return;
                  }
                  var $this = $( this );
                  // Get the value.
                  var input = $this.val();
                  var input = input.replace(/[\D\s\._\-]+/g, "");
                          input = input ? parseInt( input, 10 ) : 0;
                          $this.val( function() {
                              return ( input === 0 ) ? "" : input.toLocaleString( "id-ID" );
                          } );
              } );
              /**
               * ==================================
               * When Form Submitted
               * ==================================
               */
              // $form.on( "submit", function( event ) {                  
              //     var $this = $( this );
              //     var arr = $this.serializeArray();              
              //     for (var i = 0; i < arr.length; i++) {
              //             arr[i].value = arr[i].value.replace(/[($)\s\._\-]+/g, ''); // Sanitize the values.
              //     };                  
              //     console.log( arr );                  
              //     event.preventDefault();
              // });              
          });
      })(jQuery); // E.O Thousand separator
    }); // E.O. (document).ready()
    </script>
  </body>
</html>