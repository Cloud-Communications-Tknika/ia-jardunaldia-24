const express = require('express');
const path = require('path');
const app = express();

// View engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// Static files
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.get('/', function(req, res) {
    res.render('index', { title: 'Main' , body: 'Main Edukia'});
});

app.get('/about', (req, res) => {
    res.render('index', { title: 'Guri buruzu' , body: 'Guri Buruz Edukia'});
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
