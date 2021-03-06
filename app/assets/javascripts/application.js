// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-tagsinput
//= require atv-img-animation
//= require material-kit
//= require material.min
//= require_tree .

$(document).ready(function() {
  // 收起通知
  slideUpAlert();

})

// 收起通知信息
function slideUpAlert() {
  // 消息停留2000毫秒（2秒），消失动画时间250毫秒
  $(".alert").delay(2000).slideUp(250, function() {
    $(this).remove();
  });
}

// 确认删除
function confirmDelete(path, message) {
  var dialog = $("#confirm-dialog");
  dialog.find(".btn-confirm").attr("href", path);
  if (message !== undefined) {
    dialog.find(".modal-body").html(message);
  }
}
