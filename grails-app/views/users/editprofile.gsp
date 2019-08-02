<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>
    <meta charset="utf-8" />
           <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

           <asset:javascript src="project.js"/>

                     <g:javascript>
                          var searchurl="${createLink(controller:'Resource',action:'search')}"
                     </g:javascript>
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
       <div class="panel panel-default" style="height:70px">
         <div class="panel-body">
           <div class="container">
             <div class="col-md-4">
               <h4><g:link controller="users" action="dashboard"><strong> <u>Link Sharing</u></strong></g:link></h4>
             </div>
             <div class="col-md-3">
             <g:form controller="search" action="search">
               <div class="input-group">
                 <input type="text" name="search" class="form-control" placeholder="Search" id="txtSearch"/>
                 <div class="input-group-btn">
                   <button class="btn btn-basic" type="submit">
                     <span class="glyphicon glyphicon-search"></span>
                   </button>
                 </div>
               </div>
               </g:form>
             </div>
             <div class="col-md-3"></div>



             <div class ="col-md-2">
                       ${user.username}
                       <li class="fa fa-caret-down"  onclick="Show()"></li>
                       <ul class="nav nav-pills nav-stacked" id="drop" style="display:none">
                       <li style="height:20px"><g:link controller="users" action="editprofile" params="[username:session.username]">Profile</g:link></li>
                           <g:if test="${user.admin}">
                           <li style="height:20px"><g:link controller="users" action="usersList">Users</g:link></li>
                           <li style="height:20px"><g:link controller="topic" action="topicList">Topics</g:link></li>
                           <li style="height:20px"><a href="#">Posts</a></li></g:if>
                           <li style="height:20px"><g:link controller="users" action="delete">Logout</g:link></li>
                         </ul>

                         </div>
           </div>
         </div>
       </div>

   <div class="col-md-5">

           <g:render template="userInfo"/>








                   </div>


        <div class="col-md-7">
          <div class="row inbox">
            <div class="panel panel-primary">
              <div class="panel-heading">
                Profile
              </div>
              <div class="panel-body">
                  <g:uploadForm class="form-horizontal" controller="users" action="update">
                      <div class="form-group">
                          <label for="firstName" class="col-sm-2 control-label">First Name</label>
                          <div class="col-sm-10">
                              <input type="text" class="form-control" name="firstname" id="firstName" value="">
                          </div>
                      </div>
                      <div class="form-group">
                          <label for="lastName" class="col-sm-2 control-label">Last Name</label>
                          <div class="col-sm-10">
                              <input type="text" class="form-control" name="lastname" id="lastName" value="">
                          </div>
                      </div>
                      <div class="form-group">
                          <label for="userName" class="col-sm-2 control-label">Username</label>
                          <div class="col-sm-10">
                              <input type="text" class="form-control" name="username" id="userName" value="">
                          </div>
                      </div>
                      <div class="form-group">
                          <label for="photograph" class="col-sm-2 control-label">Photograph</label>
                          <div class="col-sm-10">
                              <input type="file" class="form-control" id="photo" name="photo">
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                              <button type="submit" class="btn btn-default">update</button>
                          </div>
                      </div>
                  </g:uploadForm>
              </div> <!-- body-->
            </div>
          </div> <!-- row inbox-->

            <div class="row inbox">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Change Password
                    </div>
                    <div class="panel-body">
                        <g:uploadForm class="form-horizontal" controller="users" action="updatepass" name="change-password">
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="password" id="password" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword" class="col-sm-2 control-label">Confirm Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="confpassword" id="confpassword" onkeyup='check()' >
                                </div>
                            </div>
                            <p id="message"></p>
                            <p>${flash.message}</p>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">update</button>
                                </div>
                            </div>
                        </g:uploadForm>
                    </div> <!-- body-->
                </div>
            </div> <!-- row inbox-->


        </div>
      </div>
    </div>



  </body>
  <script>
  function check() {
    if (document.getElementById('password').value ==
      document.getElementById('confpassword').value) {
      document.getElementById('message').style.color = 'green';
      document.getElementById('message').innerHTML = 'matching';
    } else {
      document.getElementById('message').style.color = 'red';
      document.getElementById('message').innerHTML = 'not matching';
    }
  }</script>
</html>