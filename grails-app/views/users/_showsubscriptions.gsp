

<div class="modal fade" id="showsubscriptions">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" >Topic names subscribed</h4>
              </div>
              <div class="modal-body">
              <ul>
              <g:each in="${topics}" var="subs" status="i">
              <li><a>${subs.name}</a></li>
              </g:each>
              </ul>
            </div>
            </div>
            </div></div>
