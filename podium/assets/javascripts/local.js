$(function(){
  $(".slide:has(img)").addClass("with_image")

  // Fancy Ampersands
  $(":header:contains('&')").each(function(){
    $(this).html($(this).html().replace(/&amp;/, "<span class='ampersand'>&amp;</span>"))
  });

  $("#slides .slide .background").each(function(){
    // alert("Found slide with background " + $(this).text());
    $(this).parent(".slide").
      css("background", "url(" + $(this).text() + ") no-repeat").
      addClass("has_background");
  });
});

