package rx.bootcamp

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def updateSerious(params) {
        Subscription t=Subscription.get(params.id)
        t.seriousness=params.seriousness

    }
}
