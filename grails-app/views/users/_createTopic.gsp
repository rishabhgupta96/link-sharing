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
                                                 <g:select name="visibility" from="${rx.bootcamp.Visibility}"
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








