$('#tags').on('keypress', getSearchSuggestions);

function getSearchSuggestions() {
  $.get("/search_suggestions.json", displaySuggestions);
}

function displaySuggestions(results) {  
  $( "#tags" ).autocomplete({
      source: results.autocomplete
    });

}

