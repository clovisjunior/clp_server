package com.projeto.clp



import grails.test.mixin.*
import spock.lang.*

@TestFor(MaquinaPortaController)
@Mock(MaquinaPorta)
class MaquinaPortaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.maquinaPortaInstanceList
            model.maquinaPortaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.maquinaPortaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def maquinaPorta = new MaquinaPorta()
            maquinaPorta.validate()
            controller.save(maquinaPorta)

        then:"The create view is rendered again with the correct model"
            model.maquinaPortaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            maquinaPorta = new MaquinaPorta(params)

            controller.save(maquinaPorta)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/maquinaPorta/show/1'
            controller.flash.message != null
            MaquinaPorta.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def maquinaPorta = new MaquinaPorta(params)
            controller.show(maquinaPorta)

        then:"A model is populated containing the domain instance"
            model.maquinaPortaInstance == maquinaPorta
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def maquinaPorta = new MaquinaPorta(params)
            controller.edit(maquinaPorta)

        then:"A model is populated containing the domain instance"
            model.maquinaPortaInstance == maquinaPorta
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/maquinaPorta/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def maquinaPorta = new MaquinaPorta()
            maquinaPorta.validate()
            controller.update(maquinaPorta)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.maquinaPortaInstance == maquinaPorta

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            maquinaPorta = new MaquinaPorta(params).save(flush: true)
            controller.update(maquinaPorta)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/maquinaPorta/show/$maquinaPorta.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/maquinaPorta/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def maquinaPorta = new MaquinaPorta(params).save(flush: true)

        then:"It exists"
            MaquinaPorta.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(maquinaPorta)

        then:"The instance is deleted"
            MaquinaPorta.count() == 0
            response.redirectedUrl == '/maquinaPorta/index'
            flash.message != null
    }
}
