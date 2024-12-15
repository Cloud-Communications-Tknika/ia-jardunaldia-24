const express = require('express');
const path = require('path');
const db = require('./db');  // Aldatu hau
const app = express();

// View engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// Static files
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.get('/', async (req, res) => {
    try {
        const hiriak = await db.getHiriak();  // Aldatu hau
        res.render('index', { 
            title: 'ShareTrip - Bidaiak Kontsultatu',
            hiriak: hiriak
        });
    } catch (err) {
        console.error('Error:', err);
        res.status(500).send('Database error');
    }
});

app.get('/about', (req, res) => {
    res.render('index', { title: 'Guri buruzu' , body: 'Guri Buruz Edukia'});
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
