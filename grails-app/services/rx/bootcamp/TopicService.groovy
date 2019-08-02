package rx.bootcamp

import grails.transaction.Transactional

@Transactional
class TopicService {

    def updateVisibility(params) {
        Topic t=Topic.get(params.id)
        t.visibility=params.visibility


    }

    def subscriptioncount(List userslist)
    {
        def usercounts=Subscription.createCriteria().list()
                {
                    projections{
                        count('user.id')
                        groupProperty('user.id')
                        // countDistinct('topic.id')
                    }
                    'user'{
                        inList('id',userslist)
                    }
                }

        List <Integer> counts=userslist.collect{ x ->
            usercounts.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
            }

        }.collect{it.getAt(0)}
        return counts
    }

    def topiccount(List userslist)
    {
        def topcounts=Topic.createCriteria().list()
                {
                    projections{
                        count('owner.id')
                        groupProperty('owner.id')
                        // countDistinct('topic.id')
                    }
                    'owner'{
                        inList('id',userslist)
                    }
                }

        List <Integer> topiccount=userslist.collect{ x ->
            topcounts.find{

                if (it.getAt(1)==x)
                    return it.getAt(0)
            }

        }.collect{if(!it)
            return 0
        else
            it.getAt(0)}

        return topiccount

    }
        def showListMethod()
        {
            List<Topic> topicList = Topic.createCriteria().list{
                eq('visibility' , Visibility.PUBLIC)
                order("name" , "asc")
            }
            return topicList
        }
    def createMethod(params,String username)
    {

        Users createdBy = Users.findByUsername(username)
        List <String> topicNames=Topic.createCriteria().list{
            eq("owner.id",createdBy.id)
        }.collect{it.name}
        if(topicNames.contains(params.topicName))
            return 0

        Topic topic = new Topic(name: params.topicName, visibility: params.visibility)
        createdBy.addToTopic(topic)
        topic.save(flush:true , failOnError : true)

        Subscription sub=new Subscription("seriousness" : Seriousness.VERY_SERIOUS)


        //createdBy.save(flush:true , failOnError : true)

        createdBy.addToSubscribe(sub)
        topic.addToSubscription(sub)

        createdBy.save(flush:true , failOnError : true)
        return 1
    }
    def updateMethod(params)
    {
        Topic topic=Topic.get(Long.parseLong(params.id))

        topic.name=params.name
        topic.save()
    }


}
