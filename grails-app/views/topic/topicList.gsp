<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
</head>
<body>
  <div class="container"><br>
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="container">
          <div class="col-md-8">
            <h4><g:link controller="users" action="dashboard"><strong> <u>Link Sharing</u></strong></g:link></h4>
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
        </div>
      </div>
    </div>
<div class="container">
    <h2>Topics List</h2>
    <p>The table represent the all users</p>
    <table id="example" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Created By</th>
                <th>Visibility</th>

            </tr>
        </thead>
        <tbody>
            <g:each var="top" in="${topicList}">
                <tr>
                    <td>${top.id}</td>
                    <td>${top.name}</td>
                    <td>${top.owner.username}</td>
                    <td>${top.visibility}</td>

                </tr>
            </g:each>
        </tbody>
    </table>
</div>
  <script>
  $(document).ready(function() {
      $('#example').DataTable();
      console.log("hi")
  } );
  </script>
</body>
</html>