

<div class="modal fade" id="showtopics">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" >Topic names created</h4>
              </div>
              <div class="modal-body">
              <ul>
              <g:each in="${topics}" var="subs" status="i">
              <g:if test="${subs.owner.username==session.username}">
              <li><a>${subs.name}</a></li>
              </g:if>
              </g:each>
              </ul>
            </div>
            </div>
            </div></div>
