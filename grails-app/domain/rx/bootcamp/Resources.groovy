package rx.bootcamp

class Resources {
    String description
    Users owner
    TopicController topic
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic: TopicController, owner: Users]
    static hasMany = [readingitem : ReadingItem , ratings : ResourceRating]


    static constraints = {
        description nullable:true
    }

}
