package rx.bootcamp

import grails.transaction.Transactional
import grails.util.Holders

@Transactional
class SignupService {

    def serviceMethod(params , request) {



        String pword = params.password
        String confpassword = params.confpassword


        if(confpassword.compareTo(pword)!=0)
        {
              return null
        }
        else
        {
            String uname=params.username
            String image="image.jpeg"

            def f = request.getFile('file')
            String filename= f.getOriginalFilename()
            if(filename){

            String loc='/home/rishabh/rx-bootcamp/grails-app/assets/images/' + uname + filename
            File des = new File(loc)
            image=uname+filename
            f.transferTo(des)
            }

            String fname = params.firstname
            String lname = params.lastname
            Boolean adm = 0
            Boolean act = 1
            String email = params.email



            Users user = new Users(username : uname , firstname : fname , lastname : lname , password : pword , admin : adm , active : act , email : email ,photo : image)
            if(user.validate())
            {
                user.save()
            }
            else
            {
                return null
            }

            return user
        }

    }


    def checkingMethod(params)
    {
        String pword = params.password
        String uname = params.username
        if(!Users.findByUsername(uname))
        {
            return null
        }
        else
        {
            if(Users.findByUsername(uname).password.compareTo(pword)!=0)
            {
                return null
            }
            else
                return Users.findByUsername(uname)
        }
    }
    def changepasswordMethod(params)
    {
        Users user=Users.findByUsername(params.username)
        String pword = params.password
        String confpassword = params.confpassword

        if(confpassword.compareTo(pword)!=0)
        {
            return null
        }
        else
        {
            if(user)
            {
                user.password=pword
                user.save()
                return user
            }
        }
    }


}
