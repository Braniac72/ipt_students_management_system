const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser'); // Corrected variable name
var app = express();

app.use(express.urlencoded({ extended: true }));
app.set('view engine', 'pug');
app.set('views', './views');

app.use(bodyParser.json()); // Corrected variable name
app.use(express.static('public'));
app.set("view engine", "pug");

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'ipt_students_management_system'
});

var server = app.listen(8080, function () {
    console.log('Server is listening on port 8080');
});

connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
    } else {
        console.log('Connected to MySQL');
    }
});

// Handle form submission
app.post('/submitstaffinfo', (req, res) => {
    const { fname, lname, email, mobile, department, password, Password } = req.body;

    // Perform validation and password matching here if needed

    const staffData = {
        first_Name: fname,
        last_Name: lname,
        email: email,
        mobile_no: mobile,
        password:password,
        // Add more fields as needed
    };

    // Insert data into the 'Staff' table
    connection.query('INSERT INTO Staff SET ?', staffData, (err, results) => {
        if (err) {
            console.error('Error inserting data:', err);
            res.send('Error inserting data');
        } else {
            console.log('Data inserted successfully');
            res.send('Data inserted successfully');
        }
    });
});
// Handle staff information form submission
app.post('/submitStaffInfo', (req, res) => {
    const { fname, lname, email, mobile, department, password } = req.body;

    // Validate form data as needed

    const staffData = {
        First_Name: fname,
        Last_Name: lname,
        Email: email,
        Mobile_Number: mobile,
        Password: password,
        // Add more fields as needed
    };

    // Insert data into the 'Staff' table
    connection.query('INSERT INTO Staff SET ?', staffData, (err, results) => {
        if (err) {
            console.error('Error inserting staff data:', err);
            res.send('Error inserting staff data');
        } else {
            console.log('Staff data inserted successfully');
            res.send('Staff data inserted successfully');
        }
    });
});

// Handle student information form submission
app.post('/submitStudentInfo', (req, res) => {
    const { first_name, last_name, email, phone_number, password, rep_password } = req.body;

    // Validate form data as needed

    const studentData = {
        First_Name: first_name,
        Last_Name: last_name,
        Email: email,
        Phone_Number: phone_number,
        Password: password,
        // Add more fields as needed
    };

    // Insert data into the 'Students' table
    connection.query('INSERT INTO Students SET ?', studentData, (err, results) => {
        if (err) {
            console.error('Error inserting student data:', err);
            res.send('Error inserting student data');
        } else {
            console.log('Student data inserted successfully');
            res.send('Student data inserted successfully');
        }
    });
});
app.get('/', (req, res) => {
    res.render('index');
});
app.get('/Dashboard', (req, res) => {
    res.render('Dashboard');
});
app.get('/personal_info', (req, res) => {
    res.render('personal_info');
});
app.get('/IPT_info', (req, res) => {
    res.render('IPT_info');
});
app.get('/staff_info', (req, res) => {
    res.render('staff_info');
});
app.get('/assessment', (req, res) => {
    res.render('assessment');
});
app.get('/profile', (req, res) => {
    res.render('profile');
});

