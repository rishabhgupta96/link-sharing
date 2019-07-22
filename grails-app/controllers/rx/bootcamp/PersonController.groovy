package rx.bootcamp

class PersonController {


       def signupService

        def create()  {

            println "inside"
            request.getFile('file')
            Users user=signupService.serviceMethod(params , request)
            print user.username
            if(!user)
            {
                render(view : "../index")
            }
            else
                print "abcdef"
                render(view: "create" ,model : [user : user])


        }

    def check()
    {
        println "inside"
        Users user = signupService.checkingMethod(params)
        if(user)
        {
            session.user = user

            render(view: "create" ,model : [user : user])
        }
        else
        {
            render("fail")
        }

    }
    def dashboard()
    {


    }

    }

