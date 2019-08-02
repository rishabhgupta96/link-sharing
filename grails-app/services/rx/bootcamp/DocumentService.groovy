package rx.bootcamp

import grails.transaction.Transactional

@Transactional
class DocumentService {

    def saveMethod(params,username,request) {
       String topicname=params.topic
        String description=params.description
       def f = request.getFile('url')
        String filename=f.getOriginalFilename()
        String loc='/home/rishabh/rx-bootcamp/grails-app/assets/documents/' + username + filename
        File des = new File(loc)
        Topic topic=Topic.findByName(topicname)
        Users user=Users.findByUsername(username)
        f.transferTo(des)
        String url=username+filename
        DocumentResource dr=new DocumentResource(doc_path: url , description:description)
        user.addToResources(dr)
        topic.addToResources(dr)
        user.save()
        topic.save()
        dr.save()

     List<Users> userids=Subscription.createCriteria().list{
      projections{
       property("user.id")
      }
      eq("topic.id",topic.id)
     }
     dr.save(flush:true,failOnError: true)
     user.save(flush:true,failOnError: true)
     topic.save(flush:true,failOnError: true)

    Boolean isRead=false
     userids.each{
      Users us=Users.get(it)
      if(us.username==username){
       isRead=true}


      ReadingItem ri=new ReadingItem(isRead:isRead)

      us.addToReadings(ri)
      dr.addToReadingitem(ri)

      ri.save(flush:true,failOnError: true)
     }







    }
}
