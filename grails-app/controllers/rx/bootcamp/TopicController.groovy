package rx.bootcamp

class TopicController {
    def topicService
    def userService
    def resourceService

    def create() {
        if(!session.username)
        {
            render("please login first")
        }
        else{
        int flag=topicService.createMethod(params,session.username)
            if(!flag)
                flash.topicError="topic of particular name already created by you"
            redirect(controller : "users" , action : "dashboard")







    }}
    def updateVisibility()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{
           topicService.updateVisibility(params)
           redirect(controller:"users",action:"dashboard")
    }}
    def index()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{

        Long id=Long.parseLong(params.id)

        Topic t=Topic.get(id)
        Long tid=t.id

        Long subscount=Subscription.createCriteria().count{
            eq("topic.id",tid)
        }
        int postcount=Resources.createCriteria().count{
            eq('topic.id',tid)
        }

        List<Subscription>subscription=Subscription.createCriteria().list{
            eq("topic.id" , tid)
        }
            Users us=Users.findByUsername(session.username)
            Subscription sub=null
        List<Users> users=subscription*.user

            if(users.contains(us)){
                sub=Subscription.createCriteria().get{
                    eq('topic.id',tid)
                    eq('user.id',us.id)

                }

            }


        List <Long>userslist=users.collect{it.id}


        List subscriptioncount =topicService.subscriptioncount(userslist)
        List postscount=topicService.topiccount(userslist)
        List <Resources> resource=Resources.createCriteria().list{
            eq("topic.id",tid)
        }

            ArrayList<Resources> unreadresources=resourceService.displayunread(session.username)




        render(view:"index" ,model : [sub:sub,t:t , subscount:subscount , postcount : postcount , subscription:subscription,subscriptioncount:subscriptioncount , postscount:postscount,resources:resource , unreadresources : unreadresources])
    }}
    def topicList()
    {
        List<Topic> topicList = topicService.showListMethod()
        render (view:'topicList', model:[topicList:topicList])
    }
    def update()
    {

        topicService.updateMethod(params)
        redirect(controller : "users" , action:"dashboard")


    }
    def delete()
    {
        Topic topic=Topic.get(Long.parseLong(params.id))

        topic.delete(flush:true)
        redirect(controller : "users" , action:"dashboard")
    }
}

