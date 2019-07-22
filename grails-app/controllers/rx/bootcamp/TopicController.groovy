package rx.bootcamp

class TopicController {


    def create()
    {


            String createdBy = session.user

            Topic topic = new Topic(topicName: params.topicName, visibility: params.visibility, createdBy: createdBy)

            topic.save(flush:true)

            if(topic.hasErrors()) {
                flash.error = "Error Occured\n" + topic.errors.allErrors.join(", ")
            } else {
                render "success"
            }

        }

    }



