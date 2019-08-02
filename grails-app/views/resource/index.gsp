<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>
    <meta charset="utf-8" />
           <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

           <asset:javascript src="project.js"/>
           <g:javascript>
                           var ratingurl="${createLink(controller:'ResourceRating',action:'save')}"
                      </g:javascript>
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
<body onload="Ratingsprint('${rating}')">
<div class="container"><br>
       <div class="panel panel-default" style="height:70px">
         <div class="panel-body">
           <div class="container">
             <div class="col-md-6">
               <h4><g:link controller="users" action="dashboard"><strong> <u>Link Sharing</u></strong></g:link></h4>
             </div>
             <div class="col-md-4">
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
             <div class="container">
             <div class="row">
             <div class="col-md-7">


        <div class="panel panel-default">


                               <div class="panel-body">
                               <div class="row">
                               <div class="col-md-2">
                               <asset:image src="${resource.owner.photo}" style="width:70px;height:70px"/></div>
                               <div class="col-md-6">
                               <div style="font-size:18px;"><b>${resource.owner.firstname}&nbsp${resource.owner.lastname}</b></div>
                               <div>@${resource.owner.username}</div></div>
                               <div class="col-md-4">
                               <g:link controller="topic" action="index" params="[id: resource.topic.id]">${resource.topic.name}</g:link><br>
                               ${resource.dateCreated}
                               </div></div>
                               <div class="row">
                               <div class="col-md-9">



                               ${resource.description}</div>
                               <div class="col-md-3">
                               <span id="1" onclick="Rating('${session.username}' , '${resource.id}' , '${1}')"class="glyphicon glyphicon-star"></span>
                               <span id="2" onclick="Rating('${session.username}' , '${resource.id}' , '${2}')"class="glyphicon glyphicon-star"></span>
                               <span id="3" onclick="Rating('${session.username}' , '${resource.id}' , '${3}')"class="glyphicon glyphicon-star"></span>
                               <span id="4" onclick="Rating('${session.username}' , '${resource.id}' , '${4}')"class="glyphicon glyphicon-star"></span>
                               <span id="5" onclick="Rating('${session.username}' , '${resource.id}' , '${5}')"class="glyphicon glyphicon-star"></span>
                               </div>
                               </div><br><br><br>
                               <p id="test"></p>


                               <div class="row">
                               <div class="col-md-4"></div>
                                 <div class="col-md-2">
                                 <g:if test="${resource.owner.username==session.username}">
                               <g:link controller="resource" action="delete" params="[id:resource.id]">Delete</g:link>
                                   </div>
                              <div class="col-md-2">
                              <a data-toggle="modal" data-target="#editdesc">Edit</a>
                             </div>
                             div class="col-md-2">
                                                      <g:if test="${resource.hasProperty("link_path")}">
                                                                                                        <a >Download<a/>
                                                                                                       </div>
                                                                                                     <div class="col-md-2">
                                                                                                     <a href="${resource.link_path}">View Full Site</a>
                                                                                                       </div></g:if>
                                                                                                     <g:else>


                                                                                                      <g:link controller="Document" action="download" params="[id:resource.id , tid:resource.id , flag:1]" >Download</g:link>
                                                                                                      </div>
                                                                                                       <div class="col-md-2">
                                                                                                       <a href="">View Full Site</a>
                                                                                                         </div></g:else>
                                           </div></g:if>
                             <g:else>
                             <a>Delete</a>
                                                                </div>
                                                           <div class="col-md-2">
                                                           <a >Edit</a>
                                                          </div>




                          <div class="col-md-2">
                         <g:if test="${resource.hasProperty("link_path")}">
                                                                           <a >Download<a/>
                                                                          </div>
                                                                        <div class="col-md-2">
                                                                        <a href="${resource.link_path}">View Full Site</a>
                                                                          </div></g:if>
                                                                        <g:else>


                                                                         <g:link controller="Document" action="download" params="[id:resource.id , tid:resource.id , flag:1]" >Download</g:link>
                                                                         </div>
                                                                          <div class="col-md-2">
                                                                          <a href="">View Full Site</a>
                                                                            </div></g:else>
              </div>
              </g:else>







                                </div>
                                </div></div>
                                <g:render template="editdesc"/>














                                <div class ="col-md-4">
                                 <div class="panel panel-default">
                                               <div class="panel-heading"><div style="float:left">Trending Topics</div>

                                               </div>
                                               <div class="panel-body">
                                                <g:render template="/users/trendingTopics"  />

                                               </div>

                                             </div>
                                       </div>

                                </div>










