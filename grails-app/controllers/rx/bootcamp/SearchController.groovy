package rx.bootcamp

class SearchController {
    def searchService
    def userService
    def resourceService
    def search()
    {


        List resourcesResultSet = searchService.ResourceSearch(params.search)
        List topicsResultSet = searchService.TopicsSearch(params.search)
        List trending=userService.trendtopics()
        List topPosts=resourceService.topposts()

        //print trending
        List countForSubs=userService.subscriptioncount(trending)
        List countForPosts=userService.postscount(trending)
        ArrayList<Resources> unreadresources=resourceService.displayunread(session.username)



            render view:'search',model:[ resources :resourcesResultSet , topicsResultSet:topicsResultSet , trending:trending , topposts:topPosts , countforsubs:countForSubs , countforposts:countForPosts , key:params.search , unreadresources:unreadresources]

    }

}