package rx.bootcamp

class ReadingItem {

    Resources resource
    Users user
    Boolean isRead


    static belongsTo = [resource  : Resources , user : Users ]

    static constraints = {
    }
}
