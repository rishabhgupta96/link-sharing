package rx.bootcamp

class Topic {
    String name
    Date dateCreated
    Date lastUpdated

   Visibility visibility

    static belongsTo = [owner : Users ]
    static hasMany = [subscription : Subscription , resources : Resources]
    static constraints = {
        name unique:true
    }
}
