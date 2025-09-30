const express = require("express");
const mysql = require("mysql2");
const bodyParser = require("body-parser");
const bcrypt = require("bcryptjs");
const cors = require("cors");
const path = require("path");

const app = express();
const PORT = 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Serve static frontend files (login.html, index.html, etc.)
// app.use(express.static(path.join(__dirname, "public")));
app.use(express.static(__dirname));


// Database connection
const db = mysql.createConnection({
  host: "localhost",
  user: "root",        // change if needed
  password: "Garima@321", // change if needed
  database: "odisha"
});

db.connect(err => {
  if (err) throw err;
  console.log("✅ MySQL Connected!");
});

// Serve login page
app.get("/login", (req, res) => {
  res.sendFile(path.join(__dirname,"login.html"));
});

// Serve homepage
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});

// ✅ Register: username + email + password
app.post("/register", async (req, res) => {
  const { username, email, password } = req.body;

  if (!username || !email || !password) {
    return res.status(400).json({ message: "All fields are required" });
  }

  try {
    // Hash password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert user into database
    const sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
    db.query(sql, [username, email, hashedPassword], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Email already exists or error occurred" });
      }
      res.json({ message: "User registered successfully!" });
    });
  } catch (error) {
    res.status(500).json({ message: "Error registering user" });
  }
});

// ✅ Login: email + password
app.post("/login", (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: "Email and password required" });
  }

  const sql = "SELECT * FROM users WHERE email = ?";
  db.query(sql, [email], async (err, results) => {
    if (err) throw err;

    if (results.length === 0) {
      return res.status(400).json({ message: "Invalid email or password" });
    }

    const user = results[0];
    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
      return res.status(400).json({ message: "Invalid email or password" });
    }

    // ✅ Successful login: send JSON (frontend will redirect)
    res.json({
      message: "Login successful!",
      user: { id: user.id, username: user.username, email: user.email }
    });
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});
