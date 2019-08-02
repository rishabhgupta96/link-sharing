package rx.bootcamp

import grails.converters.JSON

class ResourceRatingController {
    def resourceRatingService

    def save() {
        resourceRatingService.saveMethod(params)
        render ([success:true] as JSON)
    }
}
