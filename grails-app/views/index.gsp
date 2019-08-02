<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>
    <meta charset="utf-8" />
           <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
           <meta name="description" content="" />
           <meta name="author" content="" />
           <asset:javascript src="project.js"/>
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
         <script type="text/javascript" >
                     function preventBack(){window.history.forward();}
                      setTimeout("preventBack()", 0);
                      window.onunload=function(){null};
                  </script>
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


       </div>
       <div class="col-md-5">

        <div class="panel panel-default">
                       <div class="panel-heading">Login</div>
                       <div class="panel-body">
                       <g:form url="[controller : 'person' , action : 'check']">
                       Email/Username : <input type = "text" name="username" required><br><br><br>
                       Passowrd : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type = "password" name="password" required>
                       <br>

                       <g:link controller="person" action="getEmail" >Forget Password</g:link>
                       <p>${flash.message}</p>
                       <input type="Submit" value="Login" style="float:right;width:100px;background-color:#dcdcdc" required></g:form>''
                       ${flash.incorrectotp}
                       ${flash.inactive}






                       </div>
       </div>

         <div class="panel panel-default">
                              <div class="panel-heading">Signup</div>
                              <div class="panel-body">
                              <g:uploadForm class="form-horizontal" controller="person" action="create" name="register-form" >
                                                  <div class="form-group">
                                                      <label for="firstName" class="col-sm-2 control-label">First Name</label>
                                                      <div class="col-sm-10">
                                                          <input type="text" class="form-control" name="firstname" id="firstName" placeholder="first name" required>
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label for="lastName" class="col-sm-2 control-label">Last Name</label>
                                                      <div class="col-sm-10">
                                                          <input type="text" class="form-control" name="lastname" id="lastName" placeholder="last name" required>
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label for="email" class="col-sm-2 control-label">Email</label>
                                                      <div class="col-sm-10">
                                                          <input type="email" class="form-control" name="email" id="email" placeholder="email" required>
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label for="userName" class="col-sm-2 control-label">Username</label>
                                                      <div class="col-sm-10">
                                                          <input type="text" class="form-control" name="username" id="userName" placeholder="username" required>
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label for="password" class="col-sm-2 control-label">Password</label>
                                                      <div class="col-sm-10">
                                                          <input type="password" class="form-control" name="password" id="password" placeholder="password" required>
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label for="confirmPassword" class="col-sm-2 control-label">Confirm Password</label>
                                                      <div class="col-sm-10">
                                                          <input type="password" class="form-control" name="confpassword" id="confpassword" placeholder="confirmPassword" required onkeyup='check()'>
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                      <label for="photograph" class="col-sm-2 control-label">Photograph</label>
                                                      <div class="col-sm-10">
                                                          <input type="file" class="form-control" id="photograph" name="file">
                                                      </div>
                                                  </div>
                                                  <p id="message"></p>
                                                  <div class="form-group">
                                                      <div class="col-sm-offset-2 col-sm-10">
                                                          <button type="submit" class="btn btn-default">Register</button>
                                                      </div>
                                                  </div>

                                              </g:uploadForm><br>
                                              <p>${flash.message1}</p>








                              </div>
              </div>

       </div>

</body>
<script>

</script>
</html>
