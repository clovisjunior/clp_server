package com.projeto.clp



import grails.test.mixin.*
import spock.lang.*

@TestFor(OcorrenciaAlarmeController)
@Mock(OcorrenciaAlarme)
class OcorrenciaAlarmeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.ocorrenciaAlarmeInstanceList
            model.ocorrenciaAlarmeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.ocorrenciaAlarmeInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def ocorrenciaAlarme = new OcorrenciaAlarme()
            ocorrenciaAlarme.validate()
            controller.save(ocorrenciaAlarme)

        then:"The create view is rendered again with the correct model"
            model.ocorrenciaAlarmeInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            ocorrenciaAlarme = new OcorrenciaAlarme(params)

            controller.save(ocorrenciaAlarme)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/ocorrenciaAlarme/show/1'
            controller.flash.message != null
            OcorrenciaAlarme.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def ocorrenciaAlarme = new OcorrenciaAlarme(params)
            controller.show(ocorrenciaAlarme)

        then:"A model is populated containing the domain instance"
            model.ocorrenciaAlarmeInstance == ocorrenciaAlarme
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def ocorrenciaAlarme = new OcorrenciaAlarme(params)
            controller.edit(ocorrenciaAlarme)

        then:"A model is populated containing the domain instance"
            model.ocorrenciaAlarmeInstance == ocorrenciaAlarme
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/ocorrenciaAlarme/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def ocorrenciaAlarme = new OcorrenciaAlarme()
            ocorrenciaAlarme.validate()
            controller.update(ocorrenciaAlarme)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.ocorrenciaAlarmeInstance == ocorrenciaAlarme

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            ocorrenciaAlarme = new OcorrenciaAlarme(params).save(flush: true)
            controller.update(ocorrenciaAlarme)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/ocorrenciaAlarme/show/$ocorrenciaAlarme.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/ocorrenciaAlarme/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def ocorrenciaAlarme = new OcorrenciaAlarme(params).save(flush: true)

        then:"It exists"
            OcorrenciaAlarme.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(ocorrenciaAlarme)

        then:"The instance is deleted"
            OcorrenciaAlarme.count() == 0
            response.redirectedUrl == '/ocorrenciaAlarme/index'
            flash.message != null
    }
}
