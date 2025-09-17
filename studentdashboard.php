<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Hostel Management Dashboard</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Roboto', sans-serif;
    }

    body {
      display: flex;
      height: 100vh;
      background: url('dash5.jpg') no-repeat center center fixed;
      background-size: cover;
    }

    .sidebar {
      width: 250px;
      background: #2c3e50;
      color: white;
      padding: 20px;
      display: flex;
      flex-direction: column;
    }

    .sidebar h2 {
      margin-bottom: 30px;
      font-size: 22px;
      text-align: center;
    }

    .sidebar a {
      color: white;
      text-decoration: none;
      padding: 12px 10px;
      margin-bottom: 10px;
      border-radius: 8px;
      display: flex;
      align-items: center;
      transition: 0.3s;
    }

    .sidebar a:hover {
      background: #34495e;
    }

    .sidebar a i {
      margin-right: 10px;
    }

    .main-content {
      flex: 1;
      padding: 30px;
    }

    .dashboard-header {
      font-size: 28px;
      margin-bottom: 20px;
    }

    .cards {
      display: flex;
      gap: 20px;
    }

    .card {
      flex: 1;
      background: white;
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      text-align: center;
      transition: 0.3s;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card img {
      width: 100px;
      margin-bottom: 10px;
    }

    .card h3 {
      margin-bottom: 10px;
      color: #2c3e50;
    }

    .card a {
      text-decoration: none;
      color: #3498db;
      font-weight: bold;
    }
  </style>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>

  <div class="sidebar">
    <h2>Student Hostel</h2>
    <a href="#"><i class="fas fa-home"></i> My Dashboard</a>
    <a href="roomlist.html"><i class="fas fa-home"></i> Available Rooms</a>
    <a href="room_booking.html"><i class="fas fa-bed"></i> Book Hostel Room</a>
    <a href="complaint.html"><i class="fas fa-edit"></i> Hostel Complaint Registration</a>
    <a href="hostel_feedback.html"><i class="fas fa-comments"></i> Hostel Feedback</a>
    <a href="#"><i class="fas fa-user"></i> My Profile</a>
  </div>

  <div class="main-content">

    <div style="display: flex; justify-content: flex-end; margin-bottom: 10px;">
      <a href="logout.php" 
         style="background: #e74c3c; color: white; padding: 8px 16px; border-radius: 6px; text-decoration: none; font-weight: bold; box-shadow: 0 2px 6px rgba(0,0,0,0.2);">
        Logout
      </a>
    </div>
    

    <div style="margin-bottom: 30px;">
      <form id="searchForm" style="display: flex; gap: 10px;">
        <input type="text" id="searchQuery" placeholder="Search by Name or Reg. No"
               style="flex: 1; padding: 10px; border-radius: 8px; border: 1px solid #ccc;">
        <button type="submit"
                style="padding: 10px 20px; border: none; border-radius: 8px; background: #3498db; color: white; cursor: pointer;">
          Search
        </button>
      </form>
    </div>
    
    <!-- This div will hold search results -->
    <div id="resultsContainer" style="margin-top: 30px;"></div>
    
    <div class="dashboard-header">My Dashboard</div>
    <div class="cards">
      <div class="card">
        <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" alt="Profile Icon">
        <h3>My Profile</h3>
        <a href="#">Show All Information →</a>
      </div>
      <div class="card">
        <img src="https://cdn-icons-png.flaticon.com/512/1946/1946488.png" alt="Room Icon">
        <h3>My Room</h3>
        <a href="http://localhost:8080/hostel_project/booked_details.php">Show Details →</a>
      </div>
    </div>
  </div>

  
  

  <script>
    document.getElementById("searchForm").addEventListener("submit", function(e) {
      e.preventDefault(); // Prevent page reload
    
      const query = document.getElementById("searchQuery").value;
    
      fetch("search_booked.php?query=" + encodeURIComponent(query))
        .then(response => response.text())
        .then(data => {
          document.getElementById("resultsContainer").innerHTML = data;
        })
        .catch(error => {
          document.getElementById("resultsContainer").innerHTML = "<p style='color:red;'>Error fetching results.</p>";
          console.error("Error:", error);
        });
    });
    </script>
    

</body>
</html>
