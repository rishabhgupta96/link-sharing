
package rx.bootcamp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsersController {

     def userService
    def resourceService
    def mailService
    def dashboard()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{
        List subscription=userService.subscriptionswithdate(session.username)
        ArrayList subscriptionLt=new  ArrayList()
            int i=0;
            while(i<5 && subscription.size()>i)
            {
                subscriptionLt.add(subscription.get(i))
                i++
            }


        List<Topic>topics = subscription*.topic
        List<Long>topicids=topics.collect{it.id}

        List counts=userService.subscriptioncount(topicids)
        List resourcecount=userService.postscount(topicids)

            List trending=userService.trendtopics()
            ArrayList <Topic>trendingtopics=new ArrayList()
            trending.each{
                trendingtopics.add(Topic.get(it))
            }

            List countforsubs=userService.subscriptioncount(trending)
            List countforposts=userService.postscount(trending)

            Users user =Users.findByUsername(session.username)
            int count_topic= user.topic.size()

        int count_subscribe=user.subscribe.size()
        ArrayList<Resources> resources=resourceService.displayunread(session.username)

            render(view: "create" ,model : [user : user , count_topic : count_topic , count_subscribe  : count_subscribe , subscriptions : subscriptionLt ,subscount:counts,resourcecount:resourcecount , trending : trendingtopics , resources:resources , countforsubs:countforsubs , countforposts:countforposts,topics:topics , unreadresources : resources])
    }}
    def editprofile()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{

        Users user=Users.findByUsername(session.username)
        int count_topic= user.topic.size()
        int count_subscribe=user.subscribe.size()
        render(view: "editprofile" , model:[user:user , count_topic : count_topic , count_subscribe : count_subscribe])

    }}
    def profile()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{
        Users user=Users.findByUsername(params.username)
        List subscriptionLt=userService.subscription(params.username)


        List<Topic>topics = subscriptionLt*.topic
        List<Long>topicids=topics.collect{it.id}

        List counts=userService.subscriptioncount(topicids)
        List resourcecount=userService.postscount(topicids)


        int count_subscribe=user.subscribe.size()
        int count_topic= user.topic.size()
        List<Resources>resources=Resources.createCriteria().list{
            eq("owner.id",user.id)
        }
            ArrayList<Resources> unreadresources=resourceService.displayunread(session.username)
        render(view: "profile" ,model : [user : user , count_topic : count_topic , count_subscribe  : count_subscribe , subscriptions : subscriptionLt ,subscount:counts,resourcecount:resourcecount ,  resources:resources , unreadresources:unreadresources])


    }}
    def delete()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{
        session.invalidate()
        render(view: "/index")
    }}
    def update()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{
        String username=session.username
        userService.updateMethod(params,request,username)
        redirect(action : "editprofile")
    }}
    def updatepass()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{
        String username=session.username
       int i= userService.updatepassMethod(params,username)
        if(!i)
        {
            flash.message="Password and confirm password does not match"
        }
        redirect(action:"editprofile")

    }}
    def UsersList()
    {


            List<Users> userList = userService.showListMethod()
            render (view:'userList', model:[userlist:userList])

    }
    def admin()
    {
            Users us=Users.findByUsername(params.username)
             Boolean status=us.admin
             us.admin=!status
        us.save(flush:true)
             redirect(action:'UsersList')
    }
    def active()
    {
             Users us=Users.findByUsername(params.username)
             us.active=!us.active
        us.save(flush:true)
        redirect(action:'UsersList')
    }

}
