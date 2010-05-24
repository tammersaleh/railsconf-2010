$(function() {
  Workshop.hideDescriptions();
});

Workshop = {
  hideDescriptions: function() {
    $("li.workshop .description").hide();
    $("li.workshop>h4").click(function() {
      $("li.workshop>h4").not(this).siblings(".description").hide();
      $(this).siblings(".description").toggle();
    });
  },
}
