// ESSAI 1 Autocomplete the station input with AJAX calls.
// const input = document.querySelector('#search');
// const results = document.querySelector('#results');
// const stations = {"Marseille", "Marseille Saint-Charles"}

// const drawResponseList = (data) => {
//   results.innerHTML = '';
//   data.words.forEach((word) => {
//     results.insertAdjacentHTML('beforeend', `<li>${word}</li>`);
//   });
// };

// const autocomplete = (e) => {
//   fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${e.target.value}`)
//     .then(response => response.json())
//     .then(data =>
//       // console.log(data.words));
//       drawResponseList(data));
// };

// input.addEventListener('keyup', autocomplete);

// ESSAI 2 New try with JQuery

// $(function() {
//   $(input).autocomplete({
//     source:[stations]
//   });
// });

// ESSAI 3 :http://easyautocomplete.com/examples

// var options = {
//     url: Rails.root.join('db', 'stations.json')

//     getValue: "name",

//     template: {
//         type: "description",
//         fields: {
//             description: "gare"
//         }
//     },

//     list: {
//         match: {
//             enabled: true
//         }
//     },

//     theme: "plate-dark"
// };

// $("#results").easyAutocomplete(options);

// ESSAI 4 : Avec typeahead
var stations = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/autocomplete-station?search%5Bstart_point=%QUERY',
    wildcard: '%QUERY',
  },
});

$('#search-stations').typeahead({
  highlight: true
},
{
  name: 'no-bullet',
  source: stations,
  limit: 4,
})

