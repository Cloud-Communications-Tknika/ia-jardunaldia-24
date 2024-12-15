const sqlite3 = require('sqlite3').verbose();
const path = require('path');

// Database connection
const db = new sqlite3.Database(path.join(__dirname, './datubasea.db'), (err) => {
    if (err) {
        console.error('Error connecting to database:', err);
    } else {
        console.log('Connected to database');
    }
});

// Database operations
const getHiriak = () => {
    return new Promise((resolve, reject) => {
        db.all("SELECT * FROM hiria ORDER BY izena", [], (err, rows) => {
            if (err) {
                reject(err);
            } else {
                resolve(rows);
            }
        });
    });
};

// Exports
module.exports = {
    getHiriak
};
