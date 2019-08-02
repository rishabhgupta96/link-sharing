package rx.bootcamp

import grails.transaction.Transactional

@Transactional
class UserService {


    def subscriptionswithdate(String username) {
        Users user = Users.findByUsername(username)
        if(user){

        List<Long> subscriptionList = Subscription.createCriteria().list {
            eq("user.id", user.id)
        }
            subscriptionList.sort { b, a -> a.topic.lastUpdated <=> b.topic.lastUpdated }

        return subscriptionList}
        return null

    }

    def subscriptioncount(List topicids) {
        if(topicids){

        def topiccounts = Subscription.createCriteria().list()
                {
                    projections {
                        count('topic.id')
                        groupProperty('topic.id')
                        // countDistinct('topic.id')
                    }
                    'topic' {
                        inList('id', topicids)
                    }
                }

        List<Integer> counts = topicids.collect { x ->
            topiccounts.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
            }

        }.collect { it.getAt(0) }
        return counts
    }
        return null
    }

    def postscount(List topicids) {
        if(topicids){
        def rescounts = Resources.createCriteria().list()
                {
                    projections {
                        count('topic.id')
                        groupProperty('topic.id')
                        // countDistinct('topic.id')
                    }
                    'topic' {
                        inList('id', topicids)
                    }
                }

        List<Integer> resourcecount = topicids.collect { x ->
            rescounts.find {

                if (it.getAt(1) == x)
                    return it.getAt(0)
            }

        }.collect {
            if (!it)
                return 0
            else
                it.getAt(0)
        }



        return resourcecount}
        return null

    }

    def trendtopics() {
        List<Long> topicsid = Topic.createCriteria().list{
            eq('visibility' , Visibility.PUBLIC )
        }.collect {
            it.id
        }

        List trendingtopics = Resources.createCriteria().list()
                {
                    projections {
                        count('topic.id')
                        groupProperty('topic.id')

                    }


                }

        trendingtopics.sort { b, a -> a.getAt(0) <=> b.getAt(0) }


        List<Integer> trending = trendingtopics.collect {
            if (!it)
                return 0
            else
                it.getAt(1)
        }
        trending=trending+(topicsid-trending)

        ArrayList answer=new ArrayList()
        int i=0;
        while(i<5 && trending.size()>i)
        {
            answer.add(trending.get(i))
            i++
        }


        return answer
    }

    def subscription(String username) {
        Users user = Users.findByUsername(username)

        List<Long> subscriptionList = Subscription.createCriteria().list {
            eq("user.id", user.id)
        }

        return subscriptionList

    }
    def updateMethod(params,request,String username)
    {
        Users user=Users.findByUsername(username)
        if(params.firstname)
        user.firstname=params.firstname
        if(params.lastname)
        user.lastname=params.lastname
        if(params.username)
        user.username=params.username
       def f = request.getFile('photo')
        String filename= f.getOriginalFilename()

        if(filename){
            String image
            String loc='/home/rishabh/rx-bootcamp/grails-app/assets/images/' + username + filename
            File des = new File(loc)
            image=username+filename
            f.transferTo(des)
            user.photo=image
        }
        user.save(flush:true,failOnError: true)




    }
    def updatepassMethod(params,String username)
    {
        String pword = params.password
        String confpassword = params.confpassword

        if(confpassword.compareTo(pword)!=0)
        {
            return 0
        }
        else
        {
            Users user=Users.findByUsername(username)
            user.password=pword
            user.save()
            return 1
        }

    }
    def showListMethod()
    {
        List<Users> userList = Users.list()
        return userList
    }
}
