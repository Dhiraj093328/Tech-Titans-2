<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Appointment Booked</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
            height: 100vh;
        }
    </style>
</head>
<body>
<script>
    setTimeout(function(){
        window.location.href = "UserDashboard.jsp";
    }, 3000);
</script>


<!-- Modal -->
<div class="modal fade show" style="display:block;" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content shadow">

      <div class="modal-header bg-success text-white">
        <h5 class="modal-title">Success</h5>
      </div>

      <div class="modal-body text-center">
        <h4 class="text-success">✔ Appointment Sent Successfully!</h4>
      </div>

      <div class="modal-footer justify-content-center">
        <a href="index.jsp" class="btn btn-primary">OK</a>
      </div>

    </div>
  </div>
</div>

<div class="modal-backdrop fade show"></div>


<!-- backdrop -->
<div class="modal-backdrop fade show"></div>

</body>
</html>
