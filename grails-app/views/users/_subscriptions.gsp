<div class="panel-body">
          <g:each in="${subscriptions}" var="us" status="i">
              <li>
              <div class="row">
                  <div class="col-md-4">
                                  <g:link controller="users" action="profile" params="[username : us.topic.owner.username]" ><asset:image src="${us.user.photo}" style="width:60px;height:60px"/></g:link></div>
                                  <div class="col-sm-8">
                                  <div id="topicinput${us.id}" style="font-size:23px;"><g:link controller="Topic" action="index" params="[id:us.topic.id]"  >${us.topic.name}</g:link></div>
                                  <g:form controller="topic" action="update">
                                  <g:field type="hidden" name="id" value="${us.topic.id}"></g:field>
                                  <div id="topicoutput${us.id}" style="display:none"><input type="text" name="name" value="${us.topic.name}"></div>
                                  <input id="saving${us.id}" type="submit" value="Save" style="display:none" ></g:form>

                                  <div>@${us.topic.owner.username}</div>


                                  <div class="col-sm-6">
                                  Subscriptions:
                                  <div>${subscount.getAt(i) }</div></div>
                                      <div class="col-sm-6">

                                  Posts:
                                  <div><a>${resourcecount.get(i)}</a></div></div>


                          <g:if test  = "${us.topic.owner.username==session.username}" >

                                             <div class="row">
                                                 <div class="col-md-12">
                                                     <ul class="list-inline">
                                                         <li>
                                                             <g:form controller="subscription" action="updateSerious">
                                                                 <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                                                 <g:select onChange="submit()" name="seriousness" from="${rx.bootcamp.Seriousness}"
                                                                             value="${us.seriousness}" />
                                                             </g:form>
                                                         </li>
                                                         <li>
                                                             <g:form controller="topic" action="updateVisibility">
                                                                 <g:field type="hidden" name="id" value="${us.topicId}"></g:field>
                                                                 <g:select onChange="submit()" name="visibility" from="${rx.bootcamp.Visibility}"
                                                                             value="${us.topic.visibility}" />
                                                             </g:form>
                                                         </li>
                                                         <li>


                                                         </li>

                                                     </ul>
                                                 </div>
                                             </div>
                                         </g:if>

                                         <g:else>
                                                                           <g:form controller="subscription" action="updateSerious">
                                                                               <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                                                                <g:select onChange="submit()" name="seriousness" from="${rx.bootcamp.Seriousness}"
                                                                                                                                                        value="${us.seriousness}" />
                                                                                    </g:form>
                                                                           <g:link controller="subscription" action="delete" params="[id:us.id]">Unsubscribe</g:link></div></div>


                                         </g:else>

                                          <g:if test="${(us.topic.owner.username==session.username) || (user.admin)}">
                                                                                                                                           <i  onclick="Topicsave(${us.id})" class='far fa-file'  style="font-size:20px"></i>
                                                                                                                                           <g:link class="glyphicon glyphicon-trash" controller="topic" action="delete" params="[id:us.topic.id]"></g:link></g:if>

              </li>
          </g:each>


         </div>