package com.projeto.clp



import grails.test.mixin.*
import spock.lang.*

@TestFor(EntidadeController)
@Mock(Entidade)
class EntidadeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.entidadeInstanceList
            model.entidadeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.entidadeInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def entidade = new Entidade()
            entidade.validate()
            controller.save(entidade)

        then:"The create view is rendered again with the correct model"
            model.entidadeInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            entidade = new Entidade(params)

            controller.save(entidade)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/entidade/show/1'
            controller.flash.message != null
            Entidade.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def entidade = new Entidade(params)
            controller.show(entidade)

        then:"A model is populated containing the domain instance"
            model.entidadeInstance == entidade
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def entidade = new Entidade(params)
            controller.edit(entidade)

        then:"A model is populated containing the domain instance"
            model.entidadeInstance == entidade
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/entidade/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def entidade = new Entidade()
            entidade.validate()
            controller.update(entidade)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.entidadeInstance == entidade

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            entidade = new Entidade(params).save(flush: true)
            controller.update(entidade)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/entidade/show/$entidade.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/entidade/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def entidade = new Entidade(params).save(flush: true)

        then:"It exists"
            Entidade.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(entidade)

        then:"The instance is deleted"
            Entidade.count() == 0
            response.redirectedUrl == '/entidade/index'
            flash.message != null
    }
}
