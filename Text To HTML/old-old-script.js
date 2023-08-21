// script.js

// Function to read text file and convert to HTML table
function processTextFile(fileContent) {
    var lines = fileContent.split('\n');
    var table = '<tr><th>Column 1</th><th>Column 2</th><th>Column 3</th><th>Column 4</th></tr>';

    for (var i = 0; i < lines.length; i++) {
        // var cols = lines[i].split('\t'); // Assuming tab-separated columns
        var cols = lines[i].split(/\s+/); // Split based on whitespace

        if (cols.length >= 4) {
            table += '<tr><td>' + cols[0] + '</td><td>' + cols[1] + '</td><td>' + cols[2] + '</td><td>' + cols[3] + '</td></tr>';
        }
    }

    document.getElementById('table').innerHTML = table;
}

// Read text file and process it (for local server run: python -m http.server)
// fetch('data.txt')
//     .then(response => response.text())
//     .then(text => processTextFile(text))
//     .catch(error => console.error('Error reading the file:', error));

fetch('http://localhost:8000/data.txt')
    .then(response => response.text())
    .then(text => processTextFile(text))
    .catch(error => console.error('Error reading the file:', error));
