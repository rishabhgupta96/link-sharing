package rx.bootcamp

class DocumentResource extends Resources{
    String doc_path
    static constraints = {
          doc_path nullable:true
    }
}
