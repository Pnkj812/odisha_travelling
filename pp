<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Stylish Bubbles Login</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0; padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      background: linear-gradient(135deg, #3a0d0d, #fafafa, #d9d9d9, #3a0d0d);
      background-size: 300% 300%;
      animation: bgMove 15s ease infinite;
      overflow: hidden;
    }

    @keyframes bgMove {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    /* Bubble Effect */
    .bubbles span {
      position: absolute;
      bottom: -150px;
      border-radius: 50%;
      animation: rise 20s linear infinite;
    }

    @keyframes rise {
      0% { transform: translateY(0) scale(1); opacity: 0.6; }
      100% { transform: translateY(-110vh) scale(1.4); opacity: 0; }
    }

    /* Mix sizes + colors */
    .bubbles span:nth-child(1) { left: 5%;  width: 60px; height: 60px; background: rgba(128,0,0,0.35); animation-delay: 0s; }
    .bubbles span:nth-child(2) { left: 15%; width: 30px; height: 30px; background: rgba(255,255,255,0.3); animation-delay: 3s; }
    .bubbles span:nth-child(3) { left: 25%; width: 80px; height: 80px; background: rgba(128,0,0,0.25); animation-delay: 6s; }
    .bubbles span:nth-child(4) { left: 40%; width: 40px; height: 40px; background: rgba(255,255,255,0.25); animation-delay: 2s; }
    .bubbles span:nth-child(5) { left: 55%; width: 70px; height: 70px; background: rgba(128,0,0,0.3); animation-delay: 5s; }
    .bubbles span:nth-child(6) { left: 65%; width: 25px; height: 25px; background: rgba(255,255,255,0.35); animation-delay: 1s; }
    .bubbles span:nth-child(7) { left: 75%; width: 50px; height: 50px; background: rgba(128,0,0,0.25); animation-delay: 4s; }
    .bubbles span:nth-child(8) { left: 85%; width: 20px; height: 20px; background: rgba(255,255,255,0.3); animation-delay: 7s; }
    .bubbles span:nth-child(9) { left: 92%; width: 65px; height: 65px; background: rgba(128,0,0,0.4); animation-delay: 2.5s; }
    .bubbles span:nth-child(10){ left: 50%; width: 35px; height: 35px; background: rgba(255,255,255,0.2); animation-delay: 8s; }

    /* Login Box */
    .login-box {
      position: relative;
      z-index: 2;
      width: 370px;
      padding: 45px;
      border-radius: 20px;
      backdrop-filter: blur(12px);
      background: rgba(255, 255, 255, 0.75);
      border: 2px solid maroon;
      box-shadow: 0 12px 40px rgba(60,0,0,0.45);
      animation: fadeIn 1.3s ease;
      text-align: center;
    }

    @keyframes fadeIn {
      from { transform: translateY(40px); opacity: 0; }
      to { transform: translateY(0); opacity: 1; }
    }

    .login-box h2 {
      margin-bottom: 25px;
      font-weight: 700;
      font-size: 24px;
      color: maroon;
    }

    .input-group {
      margin-bottom: 20px;
      text-align: left;
    }

    .input-group label {
      font-size: 14px;
      margin-bottom: 6px;
      display: block;
      font-weight: 500;
      color: #3a0d0d;
    }

    .input-group input {
      width: 100%;
      padding: 12px;
      border: 1.5px solid #a6a6a6;
      border-radius: 12px;
      outline: none;
      font-size: 14px;
      background: #f8f8f8;
      color: #3a0d0d;
      transition: 0.3s;
    }

    .input-group input:focus {
      border-color: maroon;
      box-shadow: 0 0 8px rgba(128,0,0,0.4);
    }

    .checkbox {
      text-align: left;
      font-size: 13px;
      margin: 10px 0 22px;
      color: #3a0d0d;
    }

    .login-btn {
      width: 100%;
      padding: 12px;
      border: none;
      border-radius: 12px;
      background: maroon;
      color: #fff;
      font-size: 15px;
      cursor: pointer;
      font-weight: 600;
      transition: all 0.3s ease;
    }
    .login-btn:hover {
      background: #660000;
      transform: scale(1.05);
    }

    .cancel-btn {
      margin-top: 14px;
      width: 100%;
      padding: 12px;
      border: none;
      border-radius: 12px;
      background: #e6e6e6;
      color: maroon;
      font-size: 15px;
      cursor: pointer;
      font-weight: 600;
      transition: all 0.3s ease;
    }
    .cancel-btn:hover {
      background: #d9d9d9;
      transform: scale(1.05);
    }
  </style>
</head>
<body>
  <!-- bubbles -->
  <div class="bubbles">
    <span></span><span></span><span></span><span></span><span></span>
    <span></span><span></span><span></span><span></span><span></span>
  </div>

  <!-- login box -->
  <div class="login-box">
    <h2>Login</h2>
    <div class="input-group">
      <label for="uname">Username</label>
      <input type="text" id="uname" placeholder="Enter username">
    </div>
    <div class="input-group">
      <label for="pass">Password</label>
      <input type="password" id="pass" placeholder="Enter password">
    </div>
    <div class="checkbox">
      <input type="checkbox" checked> Remember me
    </div>
    <button class="login-btn">Login</button>
    <button class="cancel-btn">Cancel</button>
  </div>

  <script>
  document.querySelector(".login-btn").addEventListener("click", async () => {
    const username = document.getElementById("uname").value;
    const password = document.getElementById("pass").value;

    const response = await fetch("http://localhost:5000/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ username, password })
    });

    const data = await response.json();
    alert(data.message);
  });
</script>

</body>
</html>
