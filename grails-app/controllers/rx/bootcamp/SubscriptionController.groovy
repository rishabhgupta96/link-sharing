package rx.bootcamp

class SubscriptionController {
    def subscriptionService
    def updateSerious() {
        topicService.updateSerious(params)
        redirect(controller:"users",action:"dashboard")
    }
}
