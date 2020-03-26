<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="{{ asset('js/app.js') }}"></script>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/4.9/tinymce.min.js" referrerpolicy="origin"></script>
<script>
	var editor_config = {
		path_absolute : "/",
		selector: "textarea.wysiwyg",
		plugins: [
		"advlist autolink lists link image charmap print preview hr anchor pagebreak",
		"searchreplace wordcount visualblocks visualchars code fullscreen",
		"insertdatetime media nonbreaking save table contextmenu directionality",
		"emoticons template paste textcolor colorpicker textpattern"
		],
		toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media",
		relative_urls: false,
		file_browser_callback : function(field_name, url, type, win) {
			var x = window.innerWidth || document.documentElement.clientWidth || document.getElementsByTagName('body')[0].clientWidth;
			var y = window.innerHeight|| document.documentElement.clientHeight|| document.getElementsByTagName('body')[0].clientHeight;

			var cmsURL = editor_config.path_absolute + 'laravel-filemanager?field_name=' + field_name;
			if (type == 'image') {
				cmsURL = cmsURL + "&type=Images";
			} else {
				cmsURL = cmsURL + "&type=Files";
			}

			tinyMCE.activeEditor.windowManager.open({
				file : cmsURL,
				title : 'Filemanager',
				width : x * 0.8,
				height : y * 0.8,
				resizable : "yes",
				close_previous : "no"
			});
		}
	};

	tinymce.init(editor_config);
</script>
<script>
	$(document).ready(function() {
		$('.add-answer').click(function() {
			var $answer = $('.question-answer').last().clone();

			$answer.removeClass('first-answer');
			$answer.find('.is-correct').removeClass('btn-success').addClass('btn-outline-success');
			$answer.find('input').val('');
			$answer.find('input').attr('value', '');

			$('.question-answers').append($answer.wrap('<p/>').parent().html());
		});

		$(document).on('click', '.delete-answer', function() {
			$(this).closest('.question-answer').not('.first-answer').remove();
		});

		$(document).on('click', '.is-correct', function() {
			$(this).toggleClass('btn-success');
			$(this).toggleClass('btn-outline-success');

			if ($(this).hasClass('btn-success')) {
				$(this).closest('.question-answer').find('input[name="correct[]"]').val(1);
			} else {
				$(this).closest('.question-answer').find('input[name="correct[]"]').val(0);
			}
		});
	});
</script>
@yield('scripts')
