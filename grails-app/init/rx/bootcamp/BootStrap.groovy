package rx.bootcamp

class BootStrap {

    def init = { servletContext ->

      /* Users u1=new Users(username : 'nitin' , firstname :'nitin'  , lastname : 'nepalia' , password : 'nitin' , admin : false , active : true , email : 'nitin@gmail.com' )

        Users u2=new Users(username : 'saurabh' , firstname :'saurabh'  , lastname : 'kumar' , password : 'saurabh' , admin : false , active : true , email : 'saurabh@gmail.com')

        Users u3=new Users(username : 'aman' , firstname :'aman'  , lastname : 'aggarwal' , password : 'aman' , admin : false , active : true , email : 'aman@gmail.com')

        Users u4=new Users(username : 'rishabh' , firstname :'rishabh'  , lastname : 'gupta' , password : 'rishabh' , admin : true , active : true , email : 'rishabh@gmail.com')

/*        Topic t1=new Topic()
        Topic t2=new Topic()
        Topic t3=new Topic()
        Resources r1=new Resources()
        Resources r2=new Resources()
        Resources r3=new Resources()*/

       // print"cssssssssssssssssssssssssssssssssssssd"
        /*u1.save(flush:true,failOnError:true)

        Topic topic1 = new Topic(name:"html",visibility: "PUBLIC")
        Topic topic2 = new Topic(name:"css",visibility: "PUBLIC")
        Topic topic3 = new Topic(name:"javascript",visibility: "PUBLIC")
        Topic topic11 = new Topic(name:"groovy",visibility: "PRIVATE")
        Topic topic12 = new Topic(name:"grails",visibility: "PRIVATE")
        u4.addToTopic(topic1)
        u4.addToTopic(topic2)
        u4.save(flush:true,failOnError: true)


        topic1.save(flush:true,failOnError: true)
        topic2.save(flush:true,failOnError: true)

        u3.addToTopic(topic3)
        u3.addToTopic(topic11)
        u3.save(flush:true,failOnError: true)
        topic3.save(flush:true,failOnError: true)
        topic11.save(flush:true,failOnError: true)
        u2.addToTopic(topic12)
        u2.save(flush:true,failOnError: true)
        topic12.save(flush:true,failOnError: true)
        //u4.save()

        Resources resource1 = new Resources(description:"This is first Post",topic:topic1)
        Resources resource2 = new Resources(description:"This is second Post",topic:topic1)
        Resources resource3 = new Resources(description:"This is third Post",topic:topic2)
        Resources resource4 = new Resources(description:"This is fourth Post",topic:topic3)


        u4.addToResources(resource1)
        //user1.save(flush:true,failOnError: true)
        u4.addToResources(resource2)
        //user1.save(flush:true,failOnError: true)
        u4.addToResources(resource3)
        u4.save(flush:true,failOnError: true)
        //user2.save(flush:true,failOnError: true)
        u3.addToResources(resource4)
        u3.save(flush:true,failOnError: true)
        //user2.save(flush:true,failOnError: true)
        topic1.addToResources(resource1)
        //topic1.save(flush:true,failOnError:true)
        topic1.addToResources(resource2)
        topic1.save(flush:true,failOnError: true)
        //topic1.save(flush:true,failOnError:true)
        topic2.addToResources(resource3)
        topic2.save(flush:true,failOnError: true)
        //topic2.save(flush:true,failOnError:true)
        topic3.addToResources(resource4)
        topic3.save(flush:true,failOnError: true)


        resource1.save(flush:true,failOnError:true)
        resource2.save(flush:true,failOnError:true)
        resource3.save(flush:true,failOnError:true)
        resource4.save(flush:true,failOnError:true)


        Subscription s1=new Subscription(seriousness: "CASUAL" ,topic :topic1)
        Subscription s2=new Subscription(seriousness: "CASUAL" , topic : topic2)
        Subscription s3=new Subscription(seriousness: "CASUAL" , topic : topic3)
        Subscription s4=new Subscription(seriousness: "CASUAL" , topic : topic11)
        Subscription s5=new Subscription(seriousness: "CASUAL" , topic: topic12)

        Subscription subs=new Subscription(seriousness: "CASUAL" ,topic:topic11)
        Subscription sub=new Subscription(seriousness: "CASUAL" , topic :topic1)
        Subscription su=new Subscription(seriousness: "CASUAL" , topic :topic2)

        u4.addToSubscribe(s1)
        u4.addToSubscribe(s2)
        u4.addToSubscribe(subs)
        u3.addToSubscribe(s3)
        u3.addToSubscribe(s4)
        u2.addToSubscribe(s5)
        u1.addToSubscribe(sub)
        u1.addToSubscribe(su)

        topic1.addToSubscription(s1)
        topic1.addToSubscription(sub)
        topic2.addToSubscription(su)
        topic2.addToSubscription(s2)
        topic3.addToSubscription(s3)
        topic11.addToSubscription(s4)
        topic11.addToSubscription(subs)
        topic12.addToSubscription(s5)






        s1.save(flush:true,failOnError:true)
        s2.save(flush:true,failOnError:true)
        s3.save(flush:true,failOnError:true)
        s4.save(flush:true,failOnError:true)
        s5.save(flush:true,failOnError:true)
        subs.save(flush:true,failOnError:true)
        sub.save(flush:true,failOnError:true)
        su.save(flush:true,failOnError:true)











        /* Subscription s=new Subscription()
         Subscription sb=new Subscription()
         Subscription suu=new Subscription()
         Subscription ss=new Subscription()
         print "inside boot"
         Users u11=Users.get(2)
                 u11.addToSubscribe(sub)
         Users u12=Users.get(2)
         u12.addToSubscribe(su)
         Users u13=Users.get(26)
         u13.addToSubscribe(suu)
         Users u14=Users.get(4)
         u14.addToSubscribe(ss)
         Users u15=Users.get(4)
         u15.addToSubscribe(subs)
         Users u16=Users.get(29)
                 u16.addToSubscribe(s)
         Users u17=Users.get(26)
                 u17.addToSubscribe(sb)

         print "inside boot"
         Topic tt=Topic.get(5)
         print "inside boot"
                 tt.addToSubscription(ss).save()
         print "inside boot"
         Topic.get(6).addToSubscription(subs).save()
         print "inside boot"
         Topic.get(21).addToSubscription(sub).save()
         Topic.get(22).addToSubscription(su).save()
         Topic.get(30).addToSubscription(s).save()
         Topic.get(27).addToSubscription(sb).save()
         Topic.get(28).addToSubscription(suu).save()
         print "inside boot"
         u11.save()
         u12.save()
         u13.save()
         u14.save()
         u15.save()
         u16.save()
         u17.save()
         subs.save()
         sub.save()
         su.save()
         s.save()
         sb.save()
         suu.save()
         ss.save()
         print "outside boot"*/
     /*   Users user1 = new Users(firstname:"Nitin",lastname: "Nepalia",email: "nitin.nepalia@gmail.com",username: "nitin_1997",password: "N",admin:false,active:true)
        Users user2 = new Users(firstname:"Ajey",lastname: "PS",email: "ajey.ps@rx.com",username: "ajey.psingh",password: "A",admin:false,active:true)
        Topic topic1 = new Topic(name:"Grails",visibility: "PUBLIC")
        Topic topic2 = new Topic(name:"Groovy",visibility: "PUBLIC")
        Topic topic3 = new Topic(name:"HTML",visibility: "PUBLIC")
        user1.addToTopic(topic1)
        user1.save(flush:true,failOnError: true)
        topic1.save(flush:true,failOnError: true)
        user1.addToTopic(topic2)
        user1.save(flush:true,failOnError: true)
        topic2.save(flush:true,failOnError: true)
        user2.addToTopic(topic3)
        user2.save(flush:true,failOnError: true)
        topic3.save(flush:true,failOnError: true)

        Resources resource1 = new Resources(description:"This is first Post",topic:topic1)
        Resources resource2 = new Resources(description:"This is second Post",topic:topic1)
        Resources resource3 = new Resources(description:"This is third Post",topic:topic2)
        Resources resource4 = new Resources(description:"This is fourth Post",topic:topic3)
        user1.addToResources(resource1)
        user1.save(flush:true,failOnError: true)
        user1.addToResources(resource2)
        user1.save(flush:true,failOnError: true)
        user2.addToResources(resource3)
        user2.save(flush:true,failOnError: true)
        user2.addToResources(resource4)
        user2.save(flush:true,failOnError: true)
        topic1.addToResources(resource1)
        topic1.save(flush:true,failOnError:true)
        topic1.addToResources(resource2)
        topic1.save(flush:true,failOnError:true)
        topic2.addToResources(resource3)
        topic2.save(flush:true,failOnError:true)
        topic3.addToResources(resource4)
        topic3.save(flush:true,failOnError:true)

        resource1.save(flush:true,failOnError:true)
        resource2.save(flush:true,failOnError:true)
        resource3.save(flush:true,failOnError:true)
        resource4.save(flush:true,failOnError:true)
        Subscription subs1 = new Subscription(topic:topic1,seriousness: "CASUAL")
        Subscription subs2 = new Subscription(topic:topic1,seriousness: "CASUAL")
        Subscription subs3 = new Subscription(topic:topic2,seriousness: "CASUAL")
        user1.addToSubscribe(subs1)
        user1.addToSubscribe(subs2)
        user2.addToSubscribe(subs3)
        // user1.save(flush:true,failOnError: true)
        subs1.save(flush:true,failOnError: true)
        subs2.save(flush:true,failOnError: true)
        subs3.save(flush:true,failOnError: true)*/


    }









    def destroy = {
    }

}
