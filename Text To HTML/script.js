// script.js

// Function to read text file and convert to HTML table
function processTextFile(fileContent) {
    var lines = fileContent.split('\n');
    var headers = lines[0].split(/\s+/); // Split by whitespace
    var table = '<table><tr>';

    // Create table headers
    for (var h = 0; h < headers.length; h++) {
        table += '<th>' + headers[h] + '</th>';
    }
    table += '</tr>';

    // Create table rows
    for (var i = 1; i < lines.length; i++) {
        var cols = lines[i].split(/\s+/); // Split by whitespace

        if (cols.length >= 4) {
            table += '<tr><td>' + cols[0] + '</td><td>' + cols[1] + '</td><td>' + cols[2] + '</td><td>' + cols[3] + '</td></tr>';
        }
    }

    table += '</table>';
    return table;
}

// Read text files and process them
var files = ['data.txt', 'second.txt']; // Add more file names as needed
var tablesContainer = document.getElementById('tables-container');

for (var i = 0; i < files.length; i++) {
    fetch(files[i])
        .then(response => response.text())
        .then(text => {
            var table = processTextFile(text);
            var container = document.createElement('div');
            container.innerHTML = table;
            tablesContainer.appendChild(container);
        })
        .catch(error => console.error('Error reading the file:', error));
}
