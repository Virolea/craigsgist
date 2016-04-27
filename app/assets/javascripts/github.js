var title = $('.gist-title');
var description = $('.gist-description');
var content = editor.getSession().getValue();

function getGistDataAsJson() {
  return JSON.stringify({
    "description": description,
    "public": true,
    "files": {
      title: { "content": content }
    }
  });
}

function createGist() {
  $.ajax({
    type: "POST",
    url: "https://api.github.com/gists",
    data: getGistDataAsJson(),
    success: function(data) {
      $('#result').removeClass('error').html(
        "Successfully created gist at " + data.html_url);
    },
    error: function(jqXHR) {
      $('#result').addClass('error').html(jqXHR.responseText);
    }
  });
}

$(document).ready(function() {
  $("#create-gist").submit(function(e) {
    e.preventDefault();
    createGist();
  });
});
