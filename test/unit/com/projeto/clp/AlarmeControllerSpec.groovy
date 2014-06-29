package com.projeto.clp



import grails.test.mixin.*
import spock.lang.*

@TestFor(AlarmeController)
@Mock(Alarme)
class AlarmeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.alarmeInstanceList
            model.alarmeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.alarmeInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def alarme = new Alarme()
            alarme.validate()
            controller.save(alarme)

        then:"The create view is rendered again with the correct model"
            model.alarmeInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            alarme = new Alarme(params)

            controller.save(alarme)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/alarme/show/1'
            controller.flash.message != null
            Alarme.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def alarme = new Alarme(params)
            controller.show(alarme)

        then:"A model is populated containing the domain instance"
            model.alarmeInstance == alarme
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def alarme = new Alarme(params)
            controller.edit(alarme)

        then:"A model is populated containing the domain instance"
            model.alarmeInstance == alarme
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/alarme/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def alarme = new Alarme()
            alarme.validate()
            controller.update(alarme)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.alarmeInstance == alarme

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            alarme = new Alarme(params).save(flush: true)
            controller.update(alarme)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/alarme/show/$alarme.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/alarme/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def alarme = new Alarme(params).save(flush: true)

        then:"It exists"
            Alarme.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(alarme)

        then:"The instance is deleted"
            Alarme.count() == 0
            response.redirectedUrl == '/alarme/index'
            flash.message != null
    }
}
