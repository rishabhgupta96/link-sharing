function Rating(username , resourceId , value)
{

    for(var i=1;i<=5;i++)
      {
         document.getElementById(i).style.color="black";
      }

   for(var i=1;i<=value;i++)
   {
      document.getElementById(i).style.color="orange";
   }



   $.ajax({
    "url":     ratingurl,
    "type":    "get",
    "data":    {username : username , resourceId : resourceId , value : value},
     success: function(resp){
                       document.getElementById("test").innerHTML=resp.success
                    }
   });

}
function Ratingsprint(value)
{
       for(var i=1;i<=5;i++)
            {
               document.getElementById(i).style.color="black";
            }

         for(var i=1;i<=value;i++)
         {
            document.getElementById(i).style.color="orange";
         }
}
function Show()
{
document.getElementById("drop").style.display="block";
}
function Topicsave(variable)
{

   var id="saving"+variable;
   var id1="topicinput"+variable;
   var id2="topicoutput"+variable;


    document.getElementById(id2).style.display="block";
   document.getElementById(id1).style.display="none";
   document.getElementById(id).style.display="block";





}
function myFunction() {

    var input, filter, ul, li, a, i, txtValue;

    input = document.getElementById("resourceSearch");
    filter = input.value.toLowerCase();




       $.ajax({
        "url":     searchurl,
        "type":    "get",
        "data":    {value : filter},
         success: function(resp){
                           console.log(resp.resources)
                           document.getElementById("showResources").innerHTML=resp.resources
                        }
       });




}

function check() {
  if (document.getElementById('password').value ==
    document.getElementById('confpassword').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
}