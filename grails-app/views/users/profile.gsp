<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>
    <meta charset="utf-8" />
           <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
          <meta name="description" content="" />
           <meta name="author" content="" />
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
             <div class= "col-md-3">


             </div>


             <div class ="col-md-2">
                       ${session.username}
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

        <g:render template="/users/userInfo"/>




       <div class="panel panel-default">
         <div class="panel-heading"><div style="float:left">Topics</div>
         <div style="margin-left:350px">View all</div>
         </div>
         <div class="panel-body">
          <g:each in="${subscriptions}" var="us" status="i">
          <g:if test = "${us.topic.owner.username==session.username}">
          <g:if test="${us.topic.visibility==Visibility.PUBLIC ||  Users.findByUsername(session.username).admin}">
              <li>
              <div class="row">
                  <div class="col-md-6">
                             <div style="font-size:23px;"><g:link controller="topic" action="index" params="[id: us.topic.id]">${us.topic.name}</g:link></div></div>
                                  <div class="col-md-3">
                                  Subscriptions:
                                   <div>${subscount.getAt(i) }</div></div>
                                      <div class="col-md-3">
                                                     Posts:
                                                      <div><a>${resourcecount.get(i)}</a></div></div>


                                   <g:form controller="subscription" action="updateSerious">
                                  <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                   <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                     value="${us.seriousness}" />
                                       </g:form>
                                              </li>

              </g:if>
              </g:if>
          </g:each>


         </div>

       </div>


 <div class="panel panel-default">
         <div class="panel-heading"><div style="float:left">Subscriptions</div>

         </div>
         <g:render template="subscriptions"/>



       </div></div>
       <div class="col-md-7">
          <div class="panel panel-default">

                 <div class="panel-heading"><div style="float:left">Inblox</div>
                     <div class="input-group" style="margin-left:350px">
                          <input type="text" class="form-control" placeholder="Search"  id="resourceSearch" onkeyup="myFunction()"/>
                             <div class="input-group-btn">
                                 <button class="btn btn-basic" type="submit">
                                      <span class="glyphicon glyphicon-search"></span>
                                          </button>
                                  </div>
                             </div>
                     </div>
                 <div class="pannel-body" id="showResources">

                 <g:render template="/resource/showUnreadResources"  /></div>
                 </div >
        </div>


