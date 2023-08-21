// script.js

// Function to read text file and convert to HTML table
function processTextFile(fileContent) {
    var lines = fileContent.split('\n');
    var table = '<table><tr><th>Column 1</th><th>Column 2</th><th>Column 3</th><th>Column 4</th></tr>';

    for (var i = 0; i < lines.length; i++) {
        var cols = lines[i].split(/\s+/); // Split based on whitespace

        if (cols.length >= 4) {
            table += '<tr><td>' + cols[0] + '</td><td>' + cols[1] + '</td><td>' + cols[2] + '</td><td>' + cols[3] + '</td></tr>';
        }
    }

    table += '</table>';
    return table;
}

// Function to create HTML table for a text file
function createTableForFile(filename) {
    fetch(filename)
        .then(response => response.text())
        .then(text => {
            var tableHTML = processTextFile(text);
            var tablesContainer = document.getElementById('tables-container');
            tablesContainer.innerHTML += tableHTML;
        })
        .catch(error => console.error('Error reading the file:', error));
}

// Call the function for each text file you want to display
createTableForFile('data.txt');
createTableForFile('second.txt');
// Add more file names as needed
