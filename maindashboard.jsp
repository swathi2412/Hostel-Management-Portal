<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Eshaara Girls Hostel</title>
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Rubik', sans-serif;
    }

    html {
      scroll-behavior: smooth;
    }

    body {
      background-color: #f9fafc;
      color: #0a0a0a;
    }

    .hero-section {
      background: url('homepage.jpg') no-repeat center center/cover;
      height: 100vh;
      color: white;
      position: relative;
    }

    .overlay {
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 1;
    }

    header {
      position: relative;
      z-index: 2;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px 60px;
    }

    .logo img {
      height: 50px;
    }

    nav a {
      color: white;
      text-decoration: none;
      margin: 0 15px;
      font-size: 16px;
    }

    .main-content {
      position: relative;
      z-index: 2;
      text-align: center;
      top: 30%;
      transform: translateY(-30%);
    }

    .main-content h1 {
      font-size: 60px;
      margin-bottom: 15px;
    }

    .main-content p {
      font-size: 20px;
      margin-bottom: 30px;
    }

    .btn {
      padding: 15px 30px;
      background-color: #FFA500;
      color: white;
      font-weight: bold;
      border: none;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .btn:hover {
      background-color: #ff8800;
    }

    .chat-bubble {
      position: absolute;
      bottom: 30px;
      right: 30px;
      background-color: #8E44AD;
      color: white;
      padding: 10px 20px;
      border-radius: 30px;
      display: flex;
      align-items: center;
      gap: 10px;
      cursor: pointer;
      z-index: 2;
    }

    .container {
      max-width: 1100px;
      margin: auto;
      padding: 2rem;
      text-align: center;
    }

    h1 {
      font-size: 3rem;
      margin-bottom: 0.5rem;
    }

    .subtitle {
      font-weight: 600;
      color: #1c2d48;
      margin-bottom: 2rem;
    }

    .icon-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
      gap: 1.5rem;
      margin-bottom: 3rem;
    }

    .icon-box {
      display: flex;
      flex-direction: column;
      align-items: center;
      font-size: 1rem;
      color: #0a0a0a;
    }

    .icon-box i {
      font-size: 2.5rem;
      margin-bottom: 0.5rem;
    }

    .image-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 1.5rem;
    }

    .image-card {
      position: relative;
      background-size: cover;
      background-position: center;
      height: 180px;
      border-radius: 12px;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-weight: 600;
      font-size: 1rem;
      text-shadow: 1px 1px 6px rgba(0,0,0,0.6);
    }

    .about-section {
      padding: 60px 20px;
      max-width: 1200px;
      margin: auto;
      text-align: center;
    }

    .about-section h1 {
      font-size: 2.8rem;
      margin-bottom: 10px;
    }

    .about-section p.subtitle {
      font-size: 1.1rem;
      font-weight: 600;
      color: #1c2d48;
      margin-bottom: 50px;
    }

    .about-content {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: center;
      gap: 40px;
    }

    .about-image {
      flex: 1 1 400px;
      max-width: 500px;
    }

    .about-image img {
      width: 100%;
      height: auto;
      border-radius: 10px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    }

    .about-text {
      flex: 1 1 500px;
      text-align: left;
    }

    .about-text h2 {
      font-size: 1.8rem;
      margin-bottom: 15px;
    }

    .about-text p {
      font-size: 1rem;
      line-height: 1.7;
    }

    @media (max-width: 768px) {
      .about-content {
        flex-direction: column;
      }

      .about-text {
        text-align: center;
      }
    }

    #contact {
      padding: 80px 20px;
      background-color: #fff;
      text-align: center;
    }

    #contact h1 {
      font-size: 48px;
      color: #0f2027;
      margin-bottom: 20px;
    }

    #contact .subtitle {
      font-size: 20px;
      color: #0f2027;
      margin-bottom: 40px;
    }

    .divider-container {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      margin-bottom: 40px;
    }

    .divider {
      width: 100px;
      border: none;
      border-top: 1px solid #ccc;
    }

    .or-text {
      color: #0f2027;
      font-size: 16px;
    }

    .booking-btn {
      background-color: #ffba00;
      color: white;
      font-weight: bold;
      padding: 16px 32px;
      font-size: 16px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      letter-spacing: 1px;
    }

    .booking-btn:hover {
      background-color: #e0a800;
    }

    footer {
      background-color: #1c2d48;
      color: white;
      padding: 20px 0;
      text-align: center;
      font-size: 14px;
      margin-top: 60px;
    }
  </style>
</head>
<body>

  <!-- Home Section -->
  <section class="hero-section">
    <div class="overlay"></div>

    <header>
      <div class="logo">
        <!-- Logo here -->
      </div>
      <nav>
        <a href="#about">About Us</a>
        <a href="#amenities">Amenities</a>
        <a href="#">Gallery</a>
        <a href="#">Packages</a>
        <a href="#contact">Contact</a>
        <a href="index.php" style="font-weight: 600; color: #FFD700;">Sign In</a>
      </nav>
    </header>

    <!-- Enquiry Section -->
    <div class="main-content" id="enquiry">
      <h1>ESHAARA GIRLS HOSTEL</h1>
      <p>A Home of Comfort and Security for Young Women</p>
      <a href="#contact"><button class="btn">MAKE AN ENQUIRY ➞</button></a>
    </div>

    <div class="chat-bubble">
      <span>Contact us</span>
      <span>💬</span>
    </div>
  </section>

  <!-- Amenities Section -->
  <section class="container" id="amenities">
    <h1>Amenities</h1>
    <p class="subtitle">*Amenities That Enhance Your Stay*</p>

    <div class="icon-grid">
      <div class="icon-box"><i class="fas fa-utensils"></i><span>Mess Facility</span></div>
      <div class="icon-box"><i class="fas fa-hot-tub"></i><span>Geyser</span></div>
      <div class="icon-box"><i class="fas fa-tint"></i><span>Water Purifier</span></div>
      <div class="icon-box"><i class="fas fa-broom"></i><span>House Keeping</span></div>
      <div class="icon-box"><i class="fas fa-video"></i><span>24x7 Security</span></div>
      <div class="icon-box"><i class="fas fa-soap"></i><span>Washing Machine</span></div>
      <div class="icon-box"><i class="fas fa-snowflake"></i><span>Refrigerator</span></div>
      <div class="icon-box"><i class="fas fa-wifi"></i><span>Secure Wi-Fi</span></div>
    </div>

    <div class="image-grid">
      <div class="image-card" style="background-image: url('building.jpg');">Newly Constructed Building</div>
      <div class="image-card" style="background-image: url('market.jpg');">Nearest to Market</div>
      <div class="image-card" style="background-image: url('bedroom.jpg');">AC Rooms with Attached Bathroom</div>
      <div class="image-card" style="background-image: url('charging.jpg');">EVS Charging Facility for 24/7</div>
      <div class="image-card" style="background-image: url('table.jpg');">Individual Study Table</div>
      <div class="image-card" style="background-image: url('internet.jpg');">24/7 High Speed Internet</div>
      <div class="image-card" style="background-image: url('locker.jpg');">Individual Locker & Cupboard</div>
      <div class="image-card" style="background-image: url('cleaning.jpg');">Daily Room & Bathroom Cleaning</div>
      <div class="image-card" style="background-image: url('dining.jpg');">Fine Dining Area</div>
      <div class="image-card" style="background-image: url('warden.jpg');">24/7 Lady Warden</div>
      <div class="image-card" style="background-image: url('security.jpg');">24/7 Security Guard</div>
      <div class="image-card" style="background-image: url('parking.jpg');">Two Wheeler Parking</div>
    </div>
  </section>

  <!-- About Section -->
  <section class="about-section" id="about">
    <h1>About Us</h1>
    <p class="subtitle">“Experience ESHAARA HOSTEL : Your Gateway to Safe and Supportive Living”</p>

    <div class="about-content">
      <div class="about-image">
        <img src="hostel.jpg" alt="Hostel room image" />
      </div>
      <div class="about-text">
        <h2>WELCOME TO ESHAARA HOSTEL</h2>
        <p>
          “Welcome to our Girls’ Hostel, your ideal home-away-from-home designed to provide a safe, nurturing, and empowering environment for young women...
          <br><br>
          We take pride in maintaining high standards of cleanliness and hygiene...
          <br><br>
          Join us and become part of a community that not only supports your academic goals but also helps you build lifelong friendships and experiences.”
        </p>
      </div>
    </div>
  </section>

  <!-- Contact Section -->
  <section id="contact">
    <h1>Contact Us</h1>
    <p class="subtitle">Need Assistance? Ask Your Questions Here</p>

    <div class="divider-container">
      <hr class="divider" />
      <span class="or-text">Or</span>
      <hr class="divider" />
    </div>

    <button class="booking-btn" onclick="document.getElementById('enquiry').scrollIntoView({ behavior: 'smooth' })">
      MAKE A BOOKING →
    </button>
  </section>

  <footer>
    <p>&copy; 2025 Eshaara Girls Hostel. All rights reserved.</p> 
  </footer>

  
<!-- Chatbox Modal -->
<div id="chatModal" style="display: none; position: fixed; bottom: 90px; right: 30px; width: 300px; background: white; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.3); z-index: 10; padding: 15px;">
  <h3 style="margin-bottom: 10px;">Chat with us</h3>
  <div id="chatBox" style="height: 150px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; font-size: 14px; margin-bottom: 10px;"></div>
  <input type="text" id="chatInput" placeholder="Type your message..." style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;" />
</div>

<script>
  const chatBubble = document.querySelector('.chat-bubble');
  const chatModal = document.getElementById('chatModal');
  const chatInput = document.getElementById('chatInput');
  const chatBox = document.getElementById('chatBox');

  // Toggle Chat Modal
  chatBubble.addEventListener('click', () => {
    chatModal.style.display = chatModal.style.display === 'none' ? 'block' : 'none';
  });

  // Simulate AJAX JSON response
  chatInput.addEventListener('keydown', function(e) {
    if (e.key === 'Enter' && chatInput.value.trim() !== '') {
      const userMessage = chatInput.value;
      chatBox.innerHTML += `<div><strong>You:</strong> ${userMessage}</div>`;
      chatInput.value = '';

      // Simulated chatbot response using JSON
      const responses = {
        "hello": "Hi there! How can I help you?",
        "booking": "You can make a booking via the 'MAKE A BOOKING' button!",
        "price": "Please check our packages section for pricing details.",
        "room": "We have single, double and triple seater rooms. Which one are you interested in?",
      };

      const lowerCaseMsg = userMessage.toLowerCase();
      let reply = responses[lowerCaseMsg] || "Thank you for your message. We'll get back to you shortly!";
      
      setTimeout(() => {
        chatBox.innerHTML += `<div><strong>Hostel:</strong> ${reply}</div>`;
        chatBox.scrollTop = chatBox.scrollHeight;
      }, 500);
    }
  });
</script>

</body>
</html>
