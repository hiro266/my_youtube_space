//= require jquery3
//= require rails-ujs
//= require bootstrap-material-design/dist/js/bootstrap-material-design.js

// 新規投稿&プロフィール編集 imageプレビュー
$(function () {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $('#user_user_image').change(function () {
    readURL(this);
  });
});