package rx.bootcamp

class LinkController {
    def linkService

    def save() {
        if(!session.username)
        {
            render("please login first")
        }
        else{

        linkService.saveMethod(params,session.username)
        redirect(controller:"Users" , action:"dashboard")

    }}
}
