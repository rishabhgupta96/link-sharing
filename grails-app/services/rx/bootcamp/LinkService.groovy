package rx.bootcamp

import grails.transaction.Transactional

@Transactional
class LinkService {

    def saveMethod(params,String username) {
        String url=params.url
        String description=params.description
        String topicname=params.topic
        Topic topic=Topic.findByName(topicname)
        Users user=Users.findByUsername(username)
        LinkResource lr=new LinkResource(link_path: url , description:description )
        user.addToResources(lr)
        topic.addToResources(lr)


        List<Users> userids=Subscription.createCriteria().list{
            projections{
                property("user.id")
            }
            eq("topic.id",topic.id)
        }
        lr.save(flush:true,failOnError: true)
        user.save(flush:true,failOnError: true)
        topic.save(flush:true,failOnError: true)



         Boolean isRead=false

        userids.each{
            isRead=false
            Users us=Users.get(it)
            if(us.username==username){
                isRead=true}


            ReadingItem ri=new ReadingItem(isRead:isRead)

            us.addToReadings(ri)
            lr.addToReadingitem(ri)
            ri.save(flush:true,failOnError: true)
        }






    }
}
