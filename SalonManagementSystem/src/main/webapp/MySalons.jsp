<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Pimpri Chinchwad Salons | Book Appointment</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/userDashboard.css">
  <style>
    .salon-card {
      border-radius: 16px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.08);
      transition: transform 0.3s ease;
    }
    .salon-card:hover { transform: translateY(-6px); }
    .rating { color: #ffc107; font-size: 1.1rem; }
    .location { font-size: 0.9rem; color: #6c757d; }
    .btn-book { background-color: #e83e8c; border: none; }
    .btn-book:hover { background-color: #d63384; }
    .service-list li {
      display: flex;
      justify-content: space-between;
      padding: 6px 0;
      border-bottom: 1px dashed #ddd;
      font-size: 0.9rem;
    }
  </style>
</head>

<body>
<!-- ================= HEADER ================= -->
<div class="header">
  <div class="logo">Beauty Hub</div>
  <div class="nav">
    <a href="<%=request.getContextPath()%>/UserDashboard.jsp">Home</a>
    <a href="<%=request.getContextPath()%>/MySalons.jsp" class="active">My Salons</a>
    <a href="#">Chat with Expert</a>
    <a href="<%=request.getContextPath()%>/TrendingSample.jsp">Trending Style</a>
<a href="<%=request.getContextPath()%>/UserNotificationsServlet">Notifications</a>
    <a href="<%=request.getContextPath()%>/userProfile.jsp">Profile</a>
  </div>
</div>

<nav class="navbar navbar-dark bg-dark mb-4">
  <div class="container">
    <span class="navbar-brand">Salons in Pimpri Chinchwad</span>
  </div>
</nav>

<div class="bg-dark text-white py-5 mb-5">
  <div class="container text-center">
    <h1 class="fw-bold">Book Salon Appointments Easily</h1>
    <p class="lead">Top-rated salons ! Trusted professionals ! Best prices</p>
    <span class="badge bg-warning text-dark px-3 py-2">Pimpri Chinchwad</span>
  </div>
</div>

<div class="container">
  <h3 class="text-center mb-4">Choose Your Salon</h3>

  <div class="row g-4">

    <!-- Salon Card 1 -->
    <div class="col-md-4">
      <div class="card salon-card h-100">
        <img src="images/7.jpg" class="card-img-top" alt="Lakme Salon">
        <div class="card-body">
          <h5 class="card-title">Lakme Salon</h5>
          <p class="location"> Pimpri, Pune</p>
          <p class="rating">***** <span class="text-dark">4.8</span></p>
          <p class="card-text">Premium beauty & hair services by certified professionals.</p>
          <h6 class="mt-3">Services & Prices</h6>
          <ul class="list-unstyled service-list mb-3">
            <li>Haircut <span>Rs.400</span></li>
            <li>Hair Spa <span>Rs.1200</span></li>
            <li>Facial <span>Rs.1500</span></li>
            <li>Bridal Makeup <span>Rs.3000</span></li>
          </ul>

          <form action="<%=request.getContextPath()%>/bookAppointment.jsp" method="post">
            <input type="hidden" name="salon" value="Lakme Salon Pimpri">
            <input type="hidden" name="shopOwnerId" value="1">
            <button type="submit" class="btn btn-book text-white w-100">Book Appointment</button>
          </form>
        </div>
      </div>
    </div>

    <!-- Salon Card 2 -->
    <div class="col-md-4">
      <div class="card salon-card h-100">
        <img src="images/8.jpg" class="card-img-top" alt="Jawed Habib Salon">
        <div class="card-body">
          <h5 class="card-title">Jawed Habib Salon</h5>
          <p class="location">Chinchwad, Pune</p>
          <p class="rating">**** <span class="text-dark">4.5</span></p>
          <p class="card-text">Trendy haircuts & grooming with modern techniques.</p>
          <h6 class="mt-3">Services & Prices</h6>
          <ul class="list-unstyled service-list mb-3">
            <li>Haircut <span>Rs.350</span></li>
            <li>Beard Trim <span>Rs.150</span></li>
            <li>Hair Color <span>Rs.1800</span></li>
          </ul>

          <form action="<%=request.getContextPath()%>/bookAppointment.jsp" method="post">
            <input type="hidden" name="salon" value="Jawed Habib Chinchwad">
            <input type="hidden" name="shopOwnerId" value="1">
            <button type="submit" class="btn btn-book text-white w-100">Book Appointment</button>
          </form>
        </div>
      </div>
    </div>

    <!-- Salon Card 3 -->
    <div class="col-md-4">
      <div class="card salon-card h-100">
        <img src="images/9.jpg" class="card-img-top" alt="Naturals Salon">
        <div class="card-body">
          <h5 class="card-title">Naturals Salon</h5>
          <p class="location"> Akurdi, Pune</p>
          <p class="rating">***** <span class="text-dark">4.6</span></p>
          <p class="card-text">Affordable beauty & wellness services for everyone.</p>
          <h6 class="mt-3">Services & Prices</h6>
          <ul class="list-unstyled service-list mb-3">
            <li>Facial <span>Rs.999</span></li>
            <li>Waxing <span>Rs.700</span></li>
            <li>Haircut <span>Rs.300</span></li>
          </ul>

          <form action="<%=request.getContextPath()%>/bookAppointment.jsp" method="post">
            <input type="hidden" name="salon" value="Naturals Salon Akurdi">
            <input type="hidden" name="shopOwnerId" value="1">
            <button type="submit" class="btn btn-book text-white w-100">Book Appointment</button>
          </form>
        </div>
      </div>
    </div>

    <!-- (For all remaining salon cards) ✅ Add same hidden shopOwnerId=1 -->
    <!-- Just copy the same two hidden inputs inside each form -->
    <!-- input salon + input shopOwnerId -->

  </div>
</div>

<script src="<%= request.getContextPath() %>/JS/userProfile.js"></script>

<footer class="footer">
  <p class="footer-text">&copy; 2026 Salon Management System. All Rights Reserved.</p>
  <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
</footer>

</body>
</html>
