package rx.bootcamp

import grails.transaction.Transactional

@Transactional
class SignupService {

    def serviceMethod(params) {

        //println "out"

        String pword = params.password
        String confpassword = params.confpassword

        if(confpassword.compareTo(pword)!=0)
        {
              return 0
        }
        else
        {
            String uname = params.username
            String fname = params.firstname
            String lname = params.lastname
            Boolean adm = 0
            Boolean act = 1
            String email = params.email

            Users user = new Users(username : uname , firstname : fname , lastname : lname , password : pword , admin : adm , active : act , email : email )
            user.save(failOnError : true , validate : true , flush : true)
            println "outside"
            return 1
        }

    }


    def checkingMethod(params)
    {
        String pword = params.password
        String uname = params.username
        if(!Users.findByUsername(uname))
        {
            return 0
        }
        else
        {
            if(Users.findByUsername(uname).password.compareTo(pword)!=0)
            {
                return 0
            }
            else
                return 1
        }
    }


}
