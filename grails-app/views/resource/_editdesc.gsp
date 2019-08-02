

<div class="modal fade" id="editdesc">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" >Topic names subscribed</h4>
              </div>
              <div class="modal-body">
                <g:form class="form-horizontal"  controller="resource" action="updatedescription">
                            <div class="form-group">
                              <label for="description" class="col-sm-2 control-label">Description</label>
                              <div class="col-sm-7">
                              <g:textArea name="description" class="col-sm-8 form-control" value="${resource.description}"/>
                                   </div>
                                     </div>
                                       <g:field type="hidden" name="id" value="${resource.id}"></g:field>
                               <div class="form-group">
                                 <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Save</button>
                                   </div>
                                    </div>
                            </g:form>
            </div>
            </div>
            </div></div>
