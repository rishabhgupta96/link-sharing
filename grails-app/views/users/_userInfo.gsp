 <div class="panel panel-default">

                <div class="panel-body">
                <div class="col-md-3">
                <g:link controller="users" action="profile" params="[username : user.username]"  ><asset:image src="${user.photo}" style="width:60px;height:60px"/></g:link></div>
                <div class="col-md-9">
                <div style="font-size:23px;"><g:link controller="users" action="profile" params="[username : user.username]" ><b>${user.firstname} &nbsp ${user.lastname}</b></g:link></div>
                <div>@${user.username}</div>

                <div class="col-md-6">
                Subscriptions:
               <div> <a  data-toggle="modal" data-target="#showsubscriptions" >${count_subscribe}</a></div></div>
                    <div class="col-md-6">

                Topics:
                <div><a  data-toggle="modal" data-target="#showtopics" >${count_topic}</a></div></div>
                </div>


                 </div>
                </div>
                 <g:render template="showsubscriptions"/>
                 <g:render template="showtopics"/>
