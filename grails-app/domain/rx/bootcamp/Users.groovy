package rx.bootcamp

class Users {

    String username
    String password
    String email
    String firstname
    String lastname
    Boolean active
    Boolean admin
    Date dateCreated
    Date lastUpdated
    String photo


    static hasMany = [subscribe: Subscription, topic: Topic, ratings: ResourceRating, resources: Resources, readings: ReadingItem]


    static constraints = {
        username nullable: false, unique: true
        email email: true , unique:true
        photo nullable : true
    }
}
