package rx.bootcamp

import grails.transaction.Transactional

@Transactional
class ResourceService {
    def displayunread(String username) {
        Long id = Users.findByUsername(username).id
        List<Long> Verys = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.VERY_SERIOUS)
        }.collect{it.id}


        List<Long> Ser = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.SERIOUS)
        }.collect{it.id}


        List<Long> Cas = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.CASUAL)
        }.collect{it.id}
        List<Resources> Verysr
        List<Resources> Serr
        List<Resources> Casr
        if(Verys){
        Verysr=ReadingItem.createCriteria().list{
            projections{
                property("resource")
            }
            'resource' {
                inList("topic.id" , Verys)
            }
            eq("user.id", id)
            eq("isRead",false)
        }}
       if(Ser){
           Serr= ReadingItem.createCriteria().list{
            projections{
                property("resource")
            }
               eq("user.id", id)
            'resource' {
                inList("topic.id" , Ser)
            }

            eq("isRead",false)
        }}
    if(Cas){
    Casr=ReadingItem.createCriteria().list {
        projections {
            property("resource")
        }
        'resource' {
            inList("topic.id", Cas)
        }
        eq("user.id", id)
        eq("isRead", false)
    }}


ArrayList<Resources> resources=new ArrayList()
Verysr.each{
    resources.add(it)
}
Serr.each{
    resources.add(it)
}
Casr.each{
    resources.add(it)
}


return resources

}



    def editreadMethod(params,String username)
    {

        Users user=Users.findByUsername(username)
        Long id=Long.parseLong(params.id)

        ReadingItem ri=ReadingItem.createCriteria().get{
            eq('resource.id',id)
            eq('user.id',user.id)
        }

        ri.isRead=true

        ri.save()


    }
    def deleteMethod(params)
    {
        Resources res= Resources.get(Long.parseLong(params.id))
        res.delete()
    }
    def searchMethod(params , String username)

    {

        String key=params.value
        List<Resources> resources=displayunread(username).collect{it.id}
        List<Resources> resourceResults = Resources.createCriteria().list{
            ilike("description","%${key}%")
            inList("id" , resources)
        }

        return resourceResults
    }

    def topposts()
    {
        List resources=ResourceRating.createCriteria().list {
            projections {
                avg("rating")
                groupProperty("resource.id")
            }

        }
        resources.sort { b, a -> a.getAt(0) <=> b.getAt(0) }
        List res=resources.collect{it.getAt(1)}
        int i=0;
        ArrayList answer=new ArrayList()
        while(i<5 && res.size()>i)
        {
            answer.add(res.get(i))
            i++
        }

        return answer
    }




}
