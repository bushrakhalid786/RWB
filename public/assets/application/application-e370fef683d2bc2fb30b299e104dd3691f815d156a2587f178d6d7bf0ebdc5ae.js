function sign_in_link(){
  $("#register_tab li").removeClass("active")
  $("#logintab").addClass("active")
  $("#registertab").removeClass("active")
  $("#tab1").show()
  $("#tab2").hide()
  $(".headline").hide()
  return false;
}

function sign_up_link(){
  $("#register_tab li").removeClass("active")    
  $("#registertab").addClass("active")
  $("#logintab").removeClass("active")
  $("#tab1").hide()
  $("#tab2").show()
  $(".headline").show()
  return false;
}
;
