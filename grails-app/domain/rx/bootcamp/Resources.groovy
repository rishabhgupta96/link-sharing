package rx.bootcamp

class Resources {
    String description
    Users owner
    Topic topic
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic: Topic, owner: Users]
    static hasMany = [readingitem : ReadingItem , ratings : ResourceRating]


    static constraints = {
        description nullable:true
    }

}
