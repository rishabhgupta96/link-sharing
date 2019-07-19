<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>
    <meta charset="utf-8" />
           <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
           <meta name="description" content="" />
           <meta name="author" content="" />
           <!--[if IE]>
               <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
               <![endif]-->
           <title>LINK SHARING APPLICATION</title>
           <!-- BOOTSTRAP CORE STYLE  -->
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>

           <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
           <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
       	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="container"><br>
       <div class="panel panel-default">
         <div class="panel-body">
           <div class="container">
             <div class="col-md-8">
               <h4><a href="#"><strong> <u>Link Sharing</u></strong></a></h4>
             </div>
             <div class="col-md-3">
               <div class="input-group">
                 <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>
                 <div class="input-group-btn">
                   <button class="btn btn-basic" type="submit">
                     <span class="glyphicon glyphicon-search"></span>
                   </button>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>
       <div class="col-md-7">
       <div class="panel panel-default">
         <div class="panel-heading">Recent shares</div>
         <div class="panel-body">
         <img src="image"></img>

         </div>
       </div>
       <div class="panel panel-default">
                <div class="panel-heading">Top posts</div>
                <div class="panel-body">Panel Content</div>





              </div>

       </div>
       <div class="col-md-5">

        <div class="panel panel-default">
                       <div class="panel-heading">Login</div>
                       <div class="panel-body">
                       <form>
                       Email/Username : <input type = "text" name="username" required><br><br><br>
                       Passowrd : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type = "password" name="password" required>
                       </form><br>
                       <a href="#" >Forget Password</a>
                       <input type="Submit" value="Login" style="float:right;width:100px;background-color:#dcdcdc">






                       </div>
       </div>

         <div class="panel panel-default">
                              <div class="panel-heading">Signup</div>
                              <div class="panel-body">
                              <g:form url="[controller:'Signing',action:'signup']">
                              First Name : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type = "text" name="firstname" required><br><br>
                              Last Name : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type = "text" name="lastname" required><br><br>
                              Email : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type = "text" name="email" required><br><br>
                              Username : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type = "text" name="username" required><br><br>
                              Password : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type = "password" name="password" required><br><br>
                              Confirm Password :  &nbsp<input type = "password" name="confpassword" required><br><br>
                               <input type="Submit" value="SignUp" style="float:right;width:100px;background-color:#dcdcdc">
                              </g:form><br>








                              </div>
              </div>

       </div>

</body>
</html>
