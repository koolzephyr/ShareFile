package com.sharefile


import org.junit.*
import grails.test.mixin.*

@TestFor(TransferFileController)
@Mock(TransferFile)
class TransferFileControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/transferFile/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.transferFileInstanceList.size() == 0
        assert model.transferFileInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.transferFileInstance != null
    }

    void testSave() {
        controller.save()

        assert model.transferFileInstance != null
        assert view == '/transferFile/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/transferFile/show/1'
        assert controller.flash.message != null
        assert TransferFile.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/transferFile/list'

        populateValidParams(params)
        def transferFile = new TransferFile(params)

        assert transferFile.save() != null

        params.id = transferFile.id

        def model = controller.show()

        assert model.transferFileInstance == transferFile
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/transferFile/list'

        populateValidParams(params)
        def transferFile = new TransferFile(params)

        assert transferFile.save() != null

        params.id = transferFile.id

        def model = controller.edit()

        assert model.transferFileInstance == transferFile
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/transferFile/list'

        response.reset()

        populateValidParams(params)
        def transferFile = new TransferFile(params)

        assert transferFile.save() != null

        // test invalid parameters in update
        params.id = transferFile.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/transferFile/edit"
        assert model.transferFileInstance != null

        transferFile.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/transferFile/show/$transferFile.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        transferFile.clearErrors()

        populateValidParams(params)
        params.id = transferFile.id
        params.version = -1
        controller.update()

        assert view == "/transferFile/edit"
        assert model.transferFileInstance != null
        assert model.transferFileInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/transferFile/list'

        response.reset()

        populateValidParams(params)
        def transferFile = new TransferFile(params)

        assert transferFile.save() != null
        assert TransferFile.count() == 1

        params.id = transferFile.id

        controller.delete()

        assert TransferFile.count() == 0
        assert TransferFile.get(transferFile.id) == null
        assert response.redirectedUrl == '/transferFile/list'
    }
}
