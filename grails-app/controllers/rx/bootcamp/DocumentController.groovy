package rx.bootcamp

class DocumentController {
    def documentService

    def download()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{

            Long id=Long.parseLong(params.id)
            DocumentResource dr = (DocumentResource) Resources.get(id)
            Users user = session.user
            def file=new File("/home/rishabh/Downloads/user.txt")

                def temp = new File("/home/rishabh/rx-bootcamp/grails-app/assets/documents/"+dr.doc_path)
                if (temp.exists()) {
                    file = temp
                } else {
                    file = null
                }
                response.setHeader("Content-disposition", "attachment;filename=\"${dr.doc_path}\"")
                response.outputStream << file.bytes
                redirect(controller:"Topic" , params:[id:tid])
    }}
    def save()
    {
        if(!session.username)
        {
            render("please login first")
        }
        else{
        documentService.saveMethod(params,session.username,request)
        redirect(controller:"Users" , action:"dashboard")


    }}
}

