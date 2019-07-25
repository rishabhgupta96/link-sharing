package rx.bootcamp

class TopicController {
    def topicService
    def userService

    def create() {
        print "hey"
        Users createdBy = Users.findByUsername(session.username)

        print "hh"

        Topic topic = new Topic(name: params.topicName, visibility: params.visibility)
        createdBy.addToTopic(topic)

        createdBy.save(flush:true , failOnError : true)
        print "hello"

        topic.save(flush:true , failOnError : true)
        print "hello"
      //  redirect(controller : "users" , action : "create")






    }
    def updateVisibility()
    {
           topicService.updateVisibility(params)
           redirect(controller:"users",action:"dashboard")
    }
    def index()
    {
        println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>."
       println params.id
        Long id=Long.parseLong(params.id)
        Subscription  sub=Subscription.get(id)
        Topic t=sub.topic
        Long tid=t.id

        print id
        println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>."
        Long subscount=Subscription.createCriteria().count{
            eq("topic.id",tid)
        }
        int postcount=Resources.createCriteria().count{
            eq('topic.id',tid)
        }

        List<Subscription>subscription=Subscription.createCriteria().list{
            eq("topic.id" , tid)
        }
        List<Users> users=subscription*.user
        List <Long>userslist=users.collect{it.id}
        println "*************"

        List subscriptioncount =topicService.subscriptioncount(userslist)
        List postscount=topicService.topiccount(userslist)
        List <Resources> resource=Resources.createCriteria().list{
            eq("topic.id",tid)
        }


        render(view:"index" ,model : [subs:sub , subscount:subscount , postcount : postcount , subscription:subscription,subscriptioncount:subscriptioncount , postscount:postscount,resources:resource])
    }
}
