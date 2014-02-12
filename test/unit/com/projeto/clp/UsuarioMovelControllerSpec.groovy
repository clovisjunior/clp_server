package com.projeto.clp



import grails.test.mixin.*
import spock.lang.*

@TestFor(UsuarioMovelController)
@Mock(UsuarioMovel)
class UsuarioMovelControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.usuarioMovelInstanceList
            model.usuarioMovelInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.usuarioMovelInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def usuarioMovel = new UsuarioMovel()
            usuarioMovel.validate()
            controller.save(usuarioMovel)

        then:"The create view is rendered again with the correct model"
            model.usuarioMovelInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            usuarioMovel = new UsuarioMovel(params)

            controller.save(usuarioMovel)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/usuarioMovel/show/1'
            controller.flash.message != null
            UsuarioMovel.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def usuarioMovel = new UsuarioMovel(params)
            controller.show(usuarioMovel)

        then:"A model is populated containing the domain instance"
            model.usuarioMovelInstance == usuarioMovel
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def usuarioMovel = new UsuarioMovel(params)
            controller.edit(usuarioMovel)

        then:"A model is populated containing the domain instance"
            model.usuarioMovelInstance == usuarioMovel
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/usuarioMovel/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def usuarioMovel = new UsuarioMovel()
            usuarioMovel.validate()
            controller.update(usuarioMovel)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.usuarioMovelInstance == usuarioMovel

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            usuarioMovel = new UsuarioMovel(params).save(flush: true)
            controller.update(usuarioMovel)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/usuarioMovel/show/$usuarioMovel.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/usuarioMovel/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def usuarioMovel = new UsuarioMovel(params).save(flush: true)

        then:"It exists"
            UsuarioMovel.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(usuarioMovel)

        then:"The instance is deleted"
            UsuarioMovel.count() == 0
            response.redirectedUrl == '/usuarioMovel/index'
            flash.message != null
    }
}
