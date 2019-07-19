package rx.bootcamp

class PersonController {


       def signupService

        def create()  {

            println "inside"
            int flag=signupService.serviceMethod(params)
            if(!flag)
            {
                render(view : "../index")
            }

        }

    def check()
    {
        println "inside"
        int flag = signupService.checkingMethod(params)
        if(flag)
        {
            render("success")
        }
        else
        {
            render("fail")
        }

    }

    }

