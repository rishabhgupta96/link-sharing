<g:each in="${trending}" var="us" status="i">
                    <li>
                    <div class="row">
                        <div class="col-md-4">
                                        <g:link controller="users" action="profile" params="[username : us.owner.username]" > <asset:image src="${us.owner.photo}"  style="width:70px;height:70px"/></g:link></div>
                                        <div class="col-sm-8">

                                        <div id="topicinput${us.id}" style="font-size:23px;"><g:link controller="Topic" action="index" params="[id:us.id]"  >${us.name}</g:link></div>
                                                                          <g:form controller="topic" action="update">
                                                                          <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                                                          <div id="topicoutput${us.id}" style="display:none"><input type="text" name="name" value="${us.name}"></div>
                                                                          <input id="saving${us.id}" type="submit" value="Save" style="display:none" ></g:form>

                                        <div>@${us.owner.username}</div>

                                        <div class="col-sm-6">
                                        Subscriptions:
                                        <div>${countforsubs.getAt(i)}</div></div>
                                            <div class="col-sm-6">

                                        Posts:
                                        <div><a>${countforposts.getAt(i)}</a></div></div>
                                        </div>
                                        <g:if test="${session.username!=us.owner.username}">
                                        <g:if test="${topics.contains(us) }">
                                        <g:link controller="subscription" action="save" params="[id:us.id ,  flag:0]">Unsubscribe</g:link></div></g:if>
                                        <g:else><g:link controller="subscription" action="save" params="[id:us.id , flag:1]">Subscribe</g:link></g:else></g:if>
                                                                                <g:if test="${(us.owner.username==session.username) || (user.admin)}">
                                                                                    <i  onclick="Topicsave(${us.id})" class='far fa-file'  style="font-size:20px"></i>
                                                                                    <g:link class="glyphicon glyphicon-trash" controller="topic" action="delete" params="[id:us.id]"></g:link></g:if>



                    </li>
                </g:each>