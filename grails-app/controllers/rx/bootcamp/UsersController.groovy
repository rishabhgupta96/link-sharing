
package rx.bootcamp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsersController {

     def userService
    def dashboard()
    {
        List subscriptionLt=userService.subscriptions(session.username)
        print "###########"
        //print subscriptionLt
        //print subscriptionLt*.topic







        List<Topic>topics = subscriptionLt*.topic
        List<Long>topicids=topics.collect{it.id}

        List counts=userService.subscriptioncount(topicids)
        List resourcecount=userService.postscount(topicids)

        List trending=userService.trendtopics()
        Users user =Users.findByUsername(session.username)
        int count_topic= user.topic.size()

        int count_subscribe=user.subscribe.size()



















        render(view: "create" ,model : [user : user , count_topic : count_topic , count_subscribe  : count_subscribe , subscriptions : subscriptionLt ,subscount:counts,resourcecount:resourcecount , trending : trending])
    }
}
