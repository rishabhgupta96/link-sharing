
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
         <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
         <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

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
            <div class ="col-md-5">
            </div></div></div>
              <div class="col-md-6"><br>



 <div class="panel panel-default">
               <div class="panel-heading"><div class="row"><div class="col-md-9">Trending Topics</div>
               <div class="col-md-3">View all</div>

               </div></div>


               <div class="panel-body">
                <g:each in="${trending}" var="us" status="i">
                    <li>
                    <div class="row">
                        <div class="col-md-4">
                                        <asset:image src="${Topic.get(us).owner.photo}"  style="width:70px;height:70px"/></div>
                                        <div class="col-sm-8">
                                        <div style="font-size:23px;">
                                        <g:link controller="topic" action="index" params="[id: us]"><b>${Topic.get(us).name}</g:link></b></div>
                                        <div>@${Topic.get(us).owner.username}</div>

                                        <div class="col-sm-6">
                                        Subscriptions:
                                        <div>${countforsubs.getAt(i)}</div></div>
                                            <div class="col-sm-6">

                                        Posts:
                                        <div><a>${countforposts.getAt(i)}</a></div></div>
                                        </div>

                    </li>
                </g:each>

               </div>

             </div>



       <div class="panel panel-default">
<div class="panel-heading"><div style="float:left">Posts  }</div>
                                                        <div class="input-group" style="margin-left:350px">
                                                                                                        <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>
                                                                                                        <div class="input-group-btn">
                                                                                                          <button class="btn btn-basic" type="submit">
                                                                                                            <span class="glyphicon glyphicon-search"></span>
                                                                                                          </button>
                                                                                                        </div>
                                                                                                      </div>
                                                        </div>
                                                        <div class="panel-body">
                                                         <g:each in="${topposts}" var="res" status="i">
                                                         <li>
                                                             <div class="row">
                                                                                            <div class="col-md-3">
                                                                                                            <asset:image src="${Resources.get(res).owner.photo}"  style="width:70px;height:70px"/></div>
                                                                                                            <div class="col-sm-9">
                                                                                                            <div class="row">
                                                                                                            <div class="col-sm-4">
                                                                                                            <b>${Resources.get(res).owner.firstname}&nbsp${Resources.get(res).owner.lastname}</b></div>
                                                                                                            <div class="col-sm-5">@${Resources.get(res).owner.username}</div>
                                                                                                            <a class=col-sm-3>${Resources.get(res).topic.name}</a></div>
                                                                                                            <div class="row">
                                                                                                            ${Resources.get(res).description}

                                                                                                            </div>
                                                                                                            <br><br>
                                                                                                            <div class="row">
                                                                                                             <div class="col-md-3">
                                                                                                                <g:if test="${Resources.get(res) instanceof rx.bootcamp.LinkResource}">
                                                                                                                <a >Download<a/>
                                                                                                               </div>
                                                                                                             <div class="col-md-3">
                                                                                                             <a href="${Resources.get(res).link_path}">View Full Site</a>
                                                                                                               </div></g:if>
                                                                                                             <g:else>


                                                                                                              <g:link controller="Document" action="download" params="[id:res , tid:res , flag:1]" >Download</g:link>
                                                                                                              </div>
                                                                                                               <div class="col-md-3">
                                                                                                               <a href="">View Full Site</a>
                                                                                                                 </div></g:else>

                                                                                                                 <div class="col-md-3">
                                                                                                                    <g:link controller="resource" action="editread" params="[id:res]">Mark as read</g:link>
                                                                                                                    </div>
                                                                                                                 <div class="col-md-3">
                                                                                                                  <g:link controller="resource" action="index" params="[id: res]">View post</g:link>
                                                                                                                  </div>
                                                                                                                   </div>



                                                            </li>
                                                         </g:each>


                                                        </div>

                                                      </div>


                       </div>
                       <div class="col-md-6">

                       <div class="panel panel-default">

                               <div class="panel-heading">Search for ${key}</div>

                                                <div class="pannel-body" id="showResources">
                                                <g:render template="/resource/showUnreadResources"/>


                               <g:each in="${topicsResultSet}" var="us" status="i">
                                                   <li>
                                                   <div class="row">
                                                       <div class="col-md-4">
                                                                       <asset:image src="${us.owner.photo}"  style="width:70px;height:70px"/></div>
                                                                       <div class="col-sm-8">
                                                                       <div style="font-size:23px;">
                                                                       <g:link controller="topic" action="index" params="[id: us.id]"><b>${us.name}</g:link></b></div>

                                                                       <div>@${us.owner.username}</div>


                                                   </li>
                                               </g:each>







                               </div>


                       </div>







</body>
</html>