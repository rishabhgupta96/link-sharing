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
       <div class="panel panel-default" style="height:70px">
         <div class="panel-body">
           <div class="container">
             <div class="col-md-4">
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
             <div class= "col-md-3">
              <ul class="nav navbar-nav">

                     <li><a href="" data-toggle="modal" data-target="#createtopic"  ><span class="glyphicon glyphicon-comment"></span></a></li>
                     <li><a href="" data-toggle="modal" data-target="#sendinvitation" ><span class="glyphicon glyphicon-envelope"></span></a></li>
                     <li><a href="" data-toggle="modal" data-target="#createLink" ><span class="glyphicon glyphicon-link"></span></a></li>
                     <li><a href="" data-toggle="modal" ><span class="glyphicon glyphicon-file"></span></a></li>

                 </ul>

             </div>

<div class="modal fade" id="createtopic">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" >Create Topic</h4>
        </div>
        <div class="modal-body">
        <g:form class="form-horizontal" controller="topic" action="create" name="topicCreate">
                                         <div class="form-group">
                                             <div class="col-sm-2 control-label">Name</div>
                                             <div class="col-sm-10">
                                                 <input type="text" name="topicName" placeholder="Topic Name"
                                                              class="form-control col-sm-8" />
                                             </div>
                                         </div>
                                         <div class="form-group">
                                             <div class="col-sm-2 control-label">visibility</div>
                                             <div class="col-sm-10">
                                                 <g:select name="visibility" from="${['public' , 'private']}"
                                                           class="dropdown-toggle btn btn-default col-sm-8"  />
                                             </div>
                                         </div>
                                         <div class="form-group">
                                             <div class="col-sm-offset-2 col-sm-10">
                                                 <button type="submit" class="btn btn-default">Save</button>
                                             </div>
                                         </div>
                                     </g:form>

      </div>
      </div>
      </div></div>









      <div class="modal fade" id="sendinvitation">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" >Send Invitation</h4>
              </div>
              <div class="modal-body">
              <g:form class="form-horizontal" controller="topic" action="create" name="topicCreate">
                                               <div class="form-group">
                                                   <div class="col-sm-2 control-label">Email</div>
                                                   <div class="col-sm-10">
                                                       <input type="email" name="topicName" placeholder="Topic Name"
                                                                    class="form-control col-sm-8" />
                                                   </div>
                                               </div>
                                               <div class="form-group">
                                                   <div class="col-sm-2 control-label">Topic</div>
                                                   <div class="col-sm-10">
                                                       <g:select name="visibility" from="${['public' , 'private']}"
                                                                 class="dropdown-toggle btn btn-default col-sm-8"  />
                                                   </div>
                                               </div>
                                               <div class="form-group">
                                                   <div class="col-sm-offset-2 col-sm-10">
                                                       <button type="submit" class="btn btn-default">Save</button>
                                                   </div>
                                               </div>
                                           </g:form>

            </div>
            </div>
            </div></div>
























             <div class ="col-md-2">
             ${user.username}
             <li class="fa fa-caret-down"  onclick="Show()"></li>
             <ul class="nav nav-pills nav-stacked" id="drop" style="display:none">
               <li style="height:20px"><a href="#">Profile</a></li>
               <li style="height:20px"><a href="#">Users</a></li>
               <li style="height:20px"><a href="#">Topics</a></li>
               <li style="height:20px"><a href="#">Posts</a></li>
               <li style="height:20px"><a href="">Logout</a></li>
             </ul>

             </div>
           </div>
         </div>
       </div>
       <div class="col-md-5">

        <div class="panel panel-default">

                <div class="panel-body">
                <div class="col-md-3">
                <g:img uri="${user.photo}"/></div>
                <div class="col-md-9">
                <div style="font-size:23px;"><b>${user.firstname} &nbsp ${user.lastname}</b></div>
                <div>@${user.username}</div>

                <div class="col-md-6">
                Subscriptions:
                <div>${count_subscribe}</div></div>
                    <div class="col-md-6">

                Topics:
                <div><a>${count_topic}</a></div></div>
                </div>

                 </div>
                </div>




       <div class="panel panel-default">
         <div class="panel-heading"><div style="float:left">Subscriptions</div>
         <div style="margin-left:350px">View all</div>
         </div>
         <div class="panel-body">
          <g:each in="${subscriptions}" var="us" status="i">
              <li>
              <div class="row">
                  <div class="col-md-4">
                                  <asset:image src="images.jpeg" style="width:60px;height:60px"/></div>
                                  <div class="col-sm-8">
                                  <div style="font-size:23px;"><g:link controller="topic" action="index" params="[id: us.id]">${us.topic.name}</g:link></div>

                                  <div>@${us.topic.owner.username}</div>

                                  <div class="col-sm-6">
                                  Subscriptions:
                                  <div>${subscount.getAt(i) }</div></div>
                                      <div class="col-sm-6">

                                  Posts:
                                  <div><a>${resourcecount.get(i)}</a></div></div>

                                  <a>Unsubscribe</a></div></div>
                          <g:if test  = "${us.topic.owner.username==session.username}" >
                                             <div class="row">
                                                 <div class="col-md-12">
                                                     <ul class="list-inline">
                                                         <li>
                                                             <g:form controller="subscription" action="updateSerious">
                                                                 <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                                                 <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                                             value="${us.seriousness}" />
                                                             </g:form>
                                                         </li>
                                                         <li>
                                                             <g:form controller="topic" action="updateVisibility">
                                                                 <g:field type="hidden" name="id" value="${us.topicId}"></g:field>
                                                                 <g:select onChange="submit()" name="visibility" from="${['PUBLIC','PRIVATE']}"
                                                                             value="${us.topic.visibility}" />
                                                             </g:form>
                                                         </li>

                                                     </ul>
                                                 </div>
                                             </div>
                                         </g:if>
                                         <g:else>

                                                 <g:form controller="subscription" action="updateSerious">
                                                                                                                  <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                                                                                                  <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                                                                                          value="${us.seriousness}" />
                                                                                                              </g:form>
                                         </g:else>

              </li>
          </g:each>


         </div>

       </div>
       <div class="panel panel-default">
               <div class="panel-heading"><div style="float:left">Trending Topics</div>
               <div style="margin-left:350px">View all</div>
               </div>
               <div class="panel-body">
                <g:each in="${trending}" var="us" status="i">
                    <li>
                    <div class="row">
                        <div class="col-md-4">
                                        <img src="images.jpeg"/></div>
                                        <div class="col-sm-8">
                                        <div style="font-size:23px;"><b>${us.name}</b></div>
                                        <div>@${us.owner.username}</div>

                                        <div class="col-sm-6">
                                        Subscriptions:
                                        <div>2</div></div>
                                            <div class="col-sm-6">

                                        Posts:
                                        <div><a>2</a></div></div>
                                        </div>
                                        <a>Unsubscribe</a></div>

                    </li>
                </g:each>

               </div>

             </div>
       </div>

       <div class="modal fade" id="createLink" tabindex="-1" role="dialog" aria-labelledby="createLink">
           <div class="modal-dialog" role="document">
               <div class="modal-content">
                   <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                       <h4 class="modal-title" id="myModalLabel">Create Link</h4>
                   </div>
                   <div class="modal-body">
                       <g:form class="form-horizontal" controller="Resource" action="save">
                           <div class="form-group">
                               <label for="link" class="col-sm-2 control-label">Link</label>
                               <div class="col-sm-10">
                                   <g:field type="url" class="form-control col-sm-8" name="url"/>
                               </div>
                           </div>
                           <div class="form-group">
                               <label for="description" class="col-sm-2 control-label">Description</label>
                               <div class="col-sm-10">
                                   <g:textArea name="description" class="col-sm-8 form-control"/>
                               </div>
                           </div>
                           <div class="form-group">
                               <label for="topic" class="col-sm-2 control-label">Topic</label>
                               <div class="col-sm-10">
                                   <g:select class="btn dropdown-toggle col-sm-8 form-control" name="topic" from="${subscriptions.topic.name}"  optionValue="value" />
                               </div>
                           </div>
                           <div class="form-group">
                               <div class="col-sm-offset-2 col-sm-10">
                                   <button type="submit" class="btn btn-default">Save</button>
                               </div>
                           </div>
                       </g:form>
                   </div>
               </div>
           </div>
       </div>




       <div class="col-md-5">

        </div>
              </div>

       </div>

</body>
<script>
function Show()
{
document.getElementById("drop").style.display="block";
}
</script>
</html>
