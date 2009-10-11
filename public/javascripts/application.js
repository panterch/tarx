function search_by_code(event) {
  window.location = "/people/"+$F('code_input');
  event.stop();
}

Event.observe(window, 'load', function() {
  Event.observe('code_input', 'click', function() { $('code').clear(); });
  Event.observe('code_form', 'submit', search_by_code);
});
