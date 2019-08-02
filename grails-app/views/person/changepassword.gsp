<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>
    <meta charset="utf-8" />
           <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

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
               <h4><a href="/"><strong> <u>Link Sharing</u></strong></a></h4>
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
 <br><br><br>

                         <g:uploadForm class="form-horizontal" controller="person" action="changepassword" name="change-password">
                         <div class="form-group">
                                                          <label for="username" class="col-sm-2 control-label">Username</label>
                                                          <div class="col-sm-3">
                                                              <input type="text" class="form-control" name="username" id="username" required="true" >
                                                          </div>
                                                      </div>
                             <div class="form-group">
                                 <label for="password" class="col-sm-2 control-label">Password</label>
                                 <div class="col-sm-3">
                                     <input type="password" class="form-control" name="password" id="password" required="true">
                                 </div>
                             </div>
                             <div class="form-group">
                                 <label for="confirmPassword" class="col-sm-2 control-label">Confirm Password</label>
                                 <div class="col-sm-3">
                                     <input type="password" class="form-control" name="confpassword" id="confpassword" onkeyup='check()' required="true">
                                 </div>
                             </div>


                             <div class="form-group">
                                 <div class="col-sm-offset-2 col-sm-10">
                                     <button type="submit" class="btn btn-default">update</button>
                                 </div>
                             </div>
                         </g:uploadForm>

</body>
</html>