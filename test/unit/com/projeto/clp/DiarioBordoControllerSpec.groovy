package com.projeto.clp



import grails.test.mixin.*
import spock.lang.*

@TestFor(DiarioBordoController)
@Mock(DiarioBordo)
class DiarioBordoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.diarioBordoInstanceList
            model.diarioBordoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.diarioBordoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def diarioBordo = new DiarioBordo()
            diarioBordo.validate()
            controller.save(diarioBordo)

        then:"The create view is rendered again with the correct model"
            model.diarioBordoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            diarioBordo = new DiarioBordo(params)

            controller.save(diarioBordo)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/diarioBordo/show/1'
            controller.flash.message != null
            DiarioBordo.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def diarioBordo = new DiarioBordo(params)
            controller.show(diarioBordo)

        then:"A model is populated containing the domain instance"
            model.diarioBordoInstance == diarioBordo
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def diarioBordo = new DiarioBordo(params)
            controller.edit(diarioBordo)

        then:"A model is populated containing the domain instance"
            model.diarioBordoInstance == diarioBordo
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/diarioBordo/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def diarioBordo = new DiarioBordo()
            diarioBordo.validate()
            controller.update(diarioBordo)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.diarioBordoInstance == diarioBordo

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            diarioBordo = new DiarioBordo(params).save(flush: true)
            controller.update(diarioBordo)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/diarioBordo/show/$diarioBordo.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/diarioBordo/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def diarioBordo = new DiarioBordo(params).save(flush: true)

        then:"It exists"
            DiarioBordo.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(diarioBordo)

        then:"The instance is deleted"
            DiarioBordo.count() == 0
            response.redirectedUrl == '/diarioBordo/index'
            flash.message != null
    }
}
