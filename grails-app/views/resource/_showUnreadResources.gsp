

                       <g:each in="${resources}" var="res" status="i">
                           <li>
                           <div class="row">
                               <div class="col-md-3">
                                               <asset:image src="${res.owner.photo}"  style="width:70px;height:70px"/></div>
                                               <div class="col-sm-9">
                                               <div class="row">
                                               <div class="col-sm-4">
                                               <b>${res.owner.firstname}&nbsp${res.owner.lastname}</b></div>
                                               <div class="col-sm-5">@${res.owner.username}</div>
                                               <a class=col-sm-3>${res.topic.name}</a></div>
                                               <div class="row">
                                               ${res.description}
                                               </div>
                                               <div class="row">
                                                <div class="col-md-3">
                                                   <g:if test="${res.hasProperty("link_path")}">
                                                   <a >Download<a/>
                                                  </div>
                                                <div class="col-md-3">
                                                <a href="${res.link_path}">View Full Site</a>
                                                  </div></g:if>
                                                <g:else>


                                                 <g:link controller="Document" action="download" params="[id:res.id , tid:res.id , flag:1]" >Download</g:link>
                                                 </div>
                                                  <div class="col-md-3">
                                                  <a href="">View Full Site</a>
                                                    </div></g:else>

                                                    <div class="col-md-3">
                                                    <g:if test="${unreadresources.contains(res)}">
                                                       <g:link controller="resource" action="editread" params="[id:res.id]">Mark as read</g:link>
                                                       </g:if>
                                                       <g:else>Already read by you</g:else>
                                                       </div>
                                                    <div class="col-md-3">
                                                     <g:link controller="resource" action="index" params="[id: res.id]">View post</g:link>
                                                     </div>
                                                      </div>


                           </li>
                       </g:each>



