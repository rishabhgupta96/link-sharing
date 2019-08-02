package rx.bootcamp

class ResourceRating {

    Resources resource
    Users owner
    int rating


    static belongsTo = [owner : Users , resource : Resources]

    static constraints = {
        rating range:1..5 , nullable : true
    }
}
