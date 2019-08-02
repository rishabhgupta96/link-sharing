package rx.bootcamp

class PersonController {


       def signupService
       def mailService
       int otp

        def create()  {



            Users user=signupService.serviceMethod(params , request)

            if(!user)
            {

                flash.message1="username or email already taken"
                redirect(url : "/")
            }
            else{
                session.username = user.username
            redirect(controller : "Users" , action : "dashboard")}


        }

    def check()
    {

        Users user = signupService.checkingMethod(params)
        if(user)
        {
            if(!user.active)
            {
                flash.inactive="User is inactive"
                render("/")
            }
            else{
            session.username = user.username

            redirect(controller : "Users" , action : "dashboard")}


        }
        else
        {
            flash.message="INvalid username or passowrd"
            redirect(url:"/")
        }

    }
    def getEmail()
    {
        render(view : "getEmail")
    }

    def forgetPassword() {


        Users user=Users.findByEmail(params.email)
        if(!user)
        {
            render(view : "getEmail")
            flash.invalidemail="invalid email"
        }
        else{
        Random random=new Random()
         otp=random.nextInt(999999)

        String link=createLink(controller:'Person' ,action:'resetPassword',absolute: true)
        mailService.sendMail {
            to "${user.email}"
            subject "Hello .Change password link "
            text link  +   "  otp for password change is ${otp}"

        }}
    }
    def changepassword()
    {

         Users user=signupService.changepasswordMethod(params)

        if(user)
        {
            session.username = user.username

            redirect(controller : "Users" , action : "dashboard")


        }
        else
        {
            flash.message="either password is wrong or username is not valid"
            redirect(url:"/")
        }

    }
    def checkotp()
    {
        if (otp==Integer.parseInt(params.otp))
            render(view : "changepassword")
        else {
            flash.incorrectotp="INCORRECT OTP"
            redirect (url : "/")
        }
    }
    def resetPassword()
    {

    }



}

