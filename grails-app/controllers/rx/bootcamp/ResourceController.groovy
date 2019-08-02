package rx.bootcamp
import grails.converters.JSON
import grails.gsp.PageRenderer


class ResourceController {
    def userService
    def resourceService
    def resourceRatingService
    def index() {
        if(!session.username)
        {
            render("please login first")
        }
        else{
        Resources res=Resources.get(params.id)
        List trending=userService.trendtopics()
            ArrayList <Topic>trendingTopics=new ArrayList()
            trending.each{
                trendingTopics.add(Topic.get(it))
            }
            List subscriptionList=userService.subscriptionswithdate(session.username)

            List<Topic>topics = subscriptionList*.topic

            List countForSubs=userService.subscriptioncount(trending)
            List countForPosts=userService.postscount(trending)
            int rating = resourceRatingService.readMethod(session.username , res)
            Users user=Users.findByUsername(session.username)


        render(view : "index" , model:[rating : rating , resource:res , trending:trendingTopics, countforsubs:countForSubs , countforposts:countForPosts , topics : topics , user:user])


    }}
    def editread()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{

        resourceService.editreadMethod(params,session.username)

        redirect(controller : "users" ,action : "dashboard")
    }}
    def delete()
    {
        resourceService.deleteMethod(params)
        redirect(controller : "users" , action : "dashboard")
    }
    def search()
    {


        List<Resources> resources=resourceService.searchMethod(params,session.username)
        String template= g.render( template:"showUnreadResources", model:[resources : resources , unreadresources:resources,value:params.value])
        render (["resources" : template ] as JSON)
    }
    def updatedescription()
    {
        Resources res=Resources.get(Long.parseLong(params.id))
        res.description=params.description
        res.save(flush:true)
        redirect(action:"index" , params:[id:Long.parseLong(params.id)])
    }

}
