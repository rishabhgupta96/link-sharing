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
        println "@@@@@@@@@@@"
            print usercounts
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
}
