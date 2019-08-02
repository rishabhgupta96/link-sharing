package rx.bootcamp

import grails.transaction.Transactional

@Transactional
class ResourceRatingService {

    def saveMethod(params) {
        int rating=Integer.parseInt(params.value)
        Users user=Users.findByUsername(params.username)
        Long resourceId= Long.parseLong(params.resourceId)
        Resources res=Resources.get(resourceId)
        ResourceRating resRate=ResourceRating.createCriteria().get{
            eq('owner.id',user.id)
            eq('resource.id',res.id)
        }
        if(resRate)
        {
           resRate.rating=rating
            resRate.save()
        }
        else{
        ResourceRating resourceRate = new ResourceRating(rating:rating)
        user.addToRatings(resourceRate)
        res.addToRatings(resourceRate)
        user.save(failOnError: true)
        res.save(failOnError: true)
        resourceRate.save(failOnError: true)}



    }

    def readMethod(username , Resources res)
    {
        Users user=Users.findByUsername(username)
        ResourceRating resRate=ResourceRating.createCriteria().get{
            eq('owner.id',user.id)
            eq('resource.id',res.id)
        }
        if(resRate)
        {
            return resRate.rating
        }
        else
            return 0

    }
}
