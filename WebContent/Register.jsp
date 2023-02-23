<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Register here</title>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/Register.css">
<script>
function validate()
{
  m=document.frm.mob.value;
  if(m.length!=10 || isNaN(m))
  {
      alert("invalid...Mobile Number");
      return false;
  }
  else
  {
    return true;
  }
}

function checkPassword()
{
  psw=document.frm.psw1.value="";
  psw1=document.frm.psw2.value="";
  if(psw != psw1)
  {
    alert("Password Did't Match: Please Try Again....");
    return false;
  }
}

</script>
</head>
<body>

<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">E-Wallet</a>
    <form class="d-flex">
    </form>
  </div>
</nav>

<div class="container-fluid py-5">
  <div class="container hi-5">
  <%@ include file="Message.jsp" %>
    <h3 style="text-align: center">Register Here...</h3>
    <div class="container py-5">
      <form name="frm" method="post" action="newregister" onsubmit="validate()" enctype="multipart/form-data">
       <div class="form-group row">
          <label class="col-sm-2 offset-sm-3 col-form-label">Profile Photo</label>
          <div class="col-sm-4">
            <input type="file" name="photo" autocomplete="off">
          </div>
          </div>
          <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Name</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="nm" autocomplete="off" placeholder="Enter Name" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Password</label>
              <div class="col-sm-4">
                <input type="password" class="form-control" name="psw" size="15" autocomplete="off" placeholder="Enter Password" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Conform Password</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="psw1" size="15" autocomplete="off" placeholder="Conform Password" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Email</label>
              <div class="col-sm-4">
                <input type="email" class="form-control" name="email" placeholder="email@example.com" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Mobile No.</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="mob" autocomplete="off" placeholder="Enter Number" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Gender</label>
              <div class="col-sm-4">
                  <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="gender" value="Male" checked>
                      <label class="form-check-label" for="inlineRadio1">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="gender" value="Female">
                      <label class="form-check-label" for="inlineRadio2">Female</label>
                    </div>
              </div>
            </div><div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">City</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" autocomplete="off" name="city" placeholder="Enter City" required>
              </div>
            </div>
            <div class="conatiner text-center">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
      </form>
    </div>


  </div>
</div>
  

</body>
</html>