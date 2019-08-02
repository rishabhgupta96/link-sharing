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
             <div class= "col-md-3">

             </div>



             <div class ="col-md-2">
             ${session.username}

             <li class="fa fa-caret-down"  onclick="Show()"></li>
            <ul class="nav nav-pills nav-stacked" id="drop" style="display:none">
                       <li style="height:20px"><g:link controller="users" action="editprofile" params="[username:session.username]">Profile</g:link></li>
                           <g:if test="${Users.findByUsername(session.username).admin}">
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


       <div class="panel panel-default">
       <div class="panel-heading">${t.name}</div>

                       <div class="panel-body">
                       <div class="col-md-3">
                       <asset:image src="${t.owner.photo}"  style="width:70px;height:70px"/></div>
                       <div class="col-md-9">
                       <div style="font-size:23px;"><b style="text-transform: uppercase">${t.name}</b>(${t.visibility})</div>
                       <div>@${t.owner.username}</div>

                       <div class="col-md-6">
                       Subscriptions:
                       <div>${subscount}</div></div>
                           <div class="col-md-6">

                       Posts:
                       <div><a>${postcount}</a></div></div>
                       </div>
                       <div class="row">
                       <div class="col-md-5">

                       <g:if test="${sub}">
                       <g:if test="${t.owner.username!=session.username}">

                          <g:link controller="subscription" action="save" params="[id:us ,  flag:0]">Unsubscribe</g:link></g:if>
                          </g:if>
                           <g:else><g:link controller="subscription" action="save" params="[id:us , flag:1]">Subscribe</g:link></g:else></div>
                       <div class="col-md-7">
                        <g:form controller="subscription" action="updateSerious">
                                               <g:field type="hidden" name="id" value="${t.id}"></g:field>

                                                                                                           </g:form></div></div></div>







                        </div>


                       <div class="panel panel-default">
                                 <div class="panel-heading">Users : ${t.name}

                                 </div>
                                 <div class="panel-body">
                                  <g:each in="${subscription}" var="us" status="i">
                                      <li>
                                      <div class="row">
                                          <div class="col-md-4">
                                                          <asset:image src="${us.user.photo}"  style="width:70px;height:70px"/></div>
                                                          <div class="col-sm-8">
                                                          <div style="font-size:23px;"><b style="text-transform: uppercase">${us.user.firstname}&nbsp${us.user.lastname} </b></div>

                                                          <div>@${us.user.username}</div>

                                                          <div class="col-sm-6">
                                                          Subscriptions:
                                                          <div>${subscriptioncount.getAt(i)}</div></div>
                                                              <div class="col-sm-6">

                                                          Topics:
                                                          <div><a>${postscount.getAt(i)}</a></div></div>



                                      </li>
                                  </g:each>


                                 </div>

                               </div>


















                       </div>
                       <div class="col-md-1">
                       </div>
                       <div class="col-md-6">
                      <div class="panel panel-default">

                              <div class="panel-heading"><div style="float:left">Inblox : ${t.name}</div>
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









       </div>

</body>
</html>
