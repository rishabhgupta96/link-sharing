<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
           <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

           <asset:javascript src="project.js"/>
           <g:javascript>
                var searchurl="${createLink(controller:'Resource',action:'search')}"
           </g:javascript>



           <title>LINK SHARING APPLICATION</title>

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
             <div class= "col-md-3">
              <ul class="nav navbar-nav">

                     <li><a href="" data-toggle="modal" data-target="#createtopic"  ><span class="glyphicon glyphicon-comment"></span></a></li>
                     <li><a href="" data-toggle="modal" data-target="#sendinvitation" ><span class="glyphicon glyphicon-envelope"></span></a></li>
                     <li><a href="" data-toggle="modal" data-target="#createLink" ><span class="glyphicon glyphicon-link"></span></a></li>
                     <li><a href="" data-toggle="modal" data-target="#createDocument" ><span class="glyphicon glyphicon-file"></span></a></li>

                 </ul>

             </div>

             <g:render template="createDocument" />
             <g:render template="createLink" />
             <g:render template="createTopic" />
             <g:render template="sendInvitation" />







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
       ${flash.topicError}
       <div class="col-md-5">


        <g:render template="userInfo" />

       <div class="panel panel-default">
         <div class="panel-heading"><div class="row"><div class="col-md-9">Subscriptions</div>

         <div class="col-md-3"><g:link controller="topic" action="topicList">View All</g:link></div></div>

         </div>
         <g:render template="subscriptions"/>



       </div>

       <div class="panel panel-default">
               <div class="panel-heading">Trending Topics</div>





               <div class="panel-body">

                  <g:render template="trendingTopics"  />
               </div>

             </div>

       </div>
       <div class="col-md-7" >
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


        <div class="col-md-5">

        </div>
              </div>

       </div>

</body>
<script>

</script>

</html>
