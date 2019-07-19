package rx.bootcamp

class Subscription {

    Date dateCreated
    Seriousness seriousness

    static belongsTo = [user : Users , topic : Topic]

    static constraints = {


    }
}
