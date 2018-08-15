package com.sharefile

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.text.DecimalFormat

class TransFileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]



    @Secured(['ROLE_AUTHORIZED_USER'])
    def upload() {
        println 'Hello user'
        [file: new TransFile()]
    }

    def save() {

        if(request instanceof MultipartHttpServletRequest) {
            MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
            CommonsMultipartFile f = (CommonsMultipartFile) mpr.getFile('file');
            CommonsMultipartFile i = (CommonsMultipartFile) mpr.getFile('img');

            def image = new ImageService().saveImage(i.getContentType(),i.getBytes())
            def file = new TransFileService().saveFile(params,image,f)

            if(file.save(flush: true)) {
                def path=new TransFileService().uploadFile(f,file)
                flash.message = "File [${file.fileName}] has been uploaded to "+path
                redirect(controller: 'transFile', action: 'upload')
            } else {
                flash.message = 'file was not uploaded'
                render(view: 'upload', model: [transfile: file])
            }
        }
    }

    def download () {
        def file = File.get(params.id)
        def servletContext = ServletContextHolder.servletContext
        def storagePath = servletContext.getRealPath( file.fileLocation+"/"+file.fileName+"."+file.extension )


        def file_down = new java.io.File(storagePath)


        if (file_down.exists()) {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "filename=${file.fileName}")
            response.outputStream << file_down.bytes
        }
    }

    def imageData(){
        def imageData = Image.get(params.id)
        response.setHeader("Content-disposition", "attachment; filename=logo")
        response.contentType = imageData.imageType
        response.outputStream << imageData.imageData
        response.outputStream.flush()
    }
}
