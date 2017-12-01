# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "ajax:success", "form#detail_invoices-form", (ev,data)->
  console.log data
  $(this).find("textarea").val("")
  $("#detail_invoices-box").append("<tr> #{data.cantidad}</tr>")

$(document).on "ajax:error", "form#detail_invoices-form", (ev,data)->
  console.log data