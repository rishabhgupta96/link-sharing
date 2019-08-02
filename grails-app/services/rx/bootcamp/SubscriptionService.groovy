package rx.bootcamp

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def updateSerious(params) {
        Subscription t=Subscription.get(params.id)
        t.seriousness=params.seriousness

    }
    def deleteMethod(params)
    {
        Subscription sub=Subscription.get(params.id)
        sub.delete()
    }
    def subscribe(params,String username)
    {
          Long id=Long.parseLong(params.id)
        Users user=Users.findByUsername(username)
          Topic topic=Topic.get(id)
          Subscription sub=new Subscription(seriousness: Seriousness.VERY_SERIOUS)
        topic.addToSubscription(sub)
        user.addToSubscribe(sub)
        topic.save()
        user.save()
        sub.save()
    }
    def unsubscribe(params,String username)
    {
        Long id=Long.parseLong(params.id)
        Users user=Users.findByUsername(username)
        Subscription sub=Subscription.createCriteria().get{
            eq("topic.id",id)
            eq("user.id",user.id)
        }
        sub.delete()
    }

}
