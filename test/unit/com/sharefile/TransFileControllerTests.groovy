package com.sharefile



import org.junit.*
import grails.test.mixin.*

@TestFor(TransFileController)
@Mock(TransFile)
class TransFileControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/transFile/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.transFileInstanceList.size() == 0
        assert model.transFileInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.transFileInstance != null
    }

    void testSave() {
        controller.save()

        assert model.transFileInstance != null
        assert view == '/transFile/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/transFile/show/1'
        assert controller.flash.message != null
        assert TransFile.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/transFile/list'

        populateValidParams(params)
        def transFile = new TransFile(params)

        assert transFile.save() != null

        params.id = transFile.id

        def model = controller.show()

        assert model.transFileInstance == transFile
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/transFile/list'

        populateValidParams(params)
        def transFile = new TransFile(params)

        assert transFile.save() != null

        params.id = transFile.id

        def model = controller.edit()

        assert model.transFileInstance == transFile
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/transFile/list'

        response.reset()

        populateValidParams(params)
        def transFile = new TransFile(params)

        assert transFile.save() != null

        // test invalid parameters in update
        params.id = transFile.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/transFile/edit"
        assert model.transFileInstance != null

        transFile.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/transFile/show/$transFile.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        transFile.clearErrors()

        populateValidParams(params)
        params.id = transFile.id
        params.version = -1
        controller.update()

        assert view == "/transFile/edit"
        assert model.transFileInstance != null
        assert model.transFileInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/transFile/list'

        response.reset()

        populateValidParams(params)
        def transFile = new TransFile(params)

        assert transFile.save() != null
        assert TransFile.count() == 1

        params.id = transFile.id

        controller.delete()

        assert TransFile.count() == 0
        assert TransFile.get(transFile.id) == null
        assert response.redirectedUrl == '/transFile/list'
    }
}
