
(function() {
    var dialog = document.getElementById('window');
  document.getElementById('lookup').onclick = function() {
    dialog.show();
  };
})();

function goBack() {
    window.history.back()
}

 $(".button-fill").hover(function () {
    $(this).children(".button-inside").addClass('full');
}, function() {
  $(this).children(".button-inside").removeClass('full');
});

