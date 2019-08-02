package rx.bootcamp

class SubscriptionController {
    def subscriptionService
    def updateSerious() {
        if(!session.username)
        {
            render("please login first")
        }
        else{
        subscriptionService.updateSerious(params)
        redirect(controller:"users",action:"dashboard")
    }}
    def delete()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{
        subscriptionService.deleteMethod(params)
        redirect(controller : "users" , action : "dashboard")
    }}
    def save()
    {
        if(Integer.parseInt(params.flag)==1)
        {
            subscriptionService.subscribe(params,session.username)
        }
        else
        {
            subscriptionService.unsubscribe(params,session.username)
        }
        redirect(controller : "users" , action : "dashboard")
    }

}
