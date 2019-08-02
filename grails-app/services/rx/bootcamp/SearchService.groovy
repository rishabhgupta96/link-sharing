package rx.bootcamp

import grails.transaction.Transactional

@Transactional
class SearchService {



    def ResourceSearch(String searchKey)
    {

        String entry = searchKey
        if (entry==null)
        {
            return Resources.list()
        }

        List<String> resourceResults = Resources.createCriteria().list{
            ilike("description","%${entry}%")
            'topic'{
                    eq('visibility' , Visibility.PUBLIC)
        }
        }

        return resourceResults
    }

    def TopicsSearch(String searchKey)
    {

        String entry = searchKey
        if (entry==null){
            return null}
        List<String> topicResults = Topic.createCriteria().list{
            ilike("name","%${entry}%")
            eq("visibility",Visibility.PUBLIC)
        }

        return topicResults

    }
}
