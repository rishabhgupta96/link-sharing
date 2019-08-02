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
                                                       <input type="email" name="email" placeholder="Eamil"
                                                                    class="form-control col-sm-8" />
                                                   </div>
                                               </div>
                                               <div class="form-group">
                                                   <div class="col-sm-2 control-label">Topic</div>
                                                   <div class="col-sm-10">
                                                       <g:select name="topic" from="${subscriptions.topic.name}"
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
