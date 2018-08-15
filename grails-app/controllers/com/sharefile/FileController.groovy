package com.sharefile

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.text.DecimalFormat


class FileController {
    def transFileService

    def upload = {
        return [ file: new File()]
    }

    def save = {
        if(request instanceof MultipartHttpServletRequest) {
            MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
            CommonsMultipartFile f = (CommonsMultipartFile) mpr.getFile('file');
            CommonsMultipartFile i = (CommonsMultipartFile) mpr.getFile('img');
            def file = new File()
            if(!f.empty&&!i.empty){
                file.fileLocation=params.category+"/"+params.semester
                file.extension = f.getOriginalFilename().tokenize('.').last()
                file.fileSize= new DecimalFormat("##.##").format(f.getSize() / 1024)
                Image image = new Image(imageType: i.getContentType(),imageData: i.getBytes(),file: file).save(failOnError: true,flush: true)
                flash.message = 'success'

                file.image=Image.findById(image.id)
                file.fileName=params.fileName
                file.category=params.category
                file.semester=params.semester
                User user = new User()

                file.user=User.findById(session.user.id as long)
                session.userName=file.user.username
                file.save(flush: true);
                def path=transFileService.uploadFile(f,file)
            }
            else {
                flash.message = 'file cannot be empty'
            }
            if(file) {
                flash.userMessage = "File [${file.fileName}] has been uploaded."
                redirect(controller: 'file', action: 'upload')
            } else {
                render(view: 'upload', model: [file: file])
            }
        }
    }
    def download () {
        def file = File.get(params.id)
        def servletContext = ServletContextHolder.servletContext
        def storagePath = servletContext.getRealPath( file.fileLocation+"/"+file.fileName+"."+file.extension )
        println "hello"
        println storagePath


        def file_down = new java.io.File(storagePath)


        if (file_down.exists()) {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "filename=${file.fileName}")
            response.outputStream << file_down.bytes
            return
        }
    }

    def imageData(){
        def imageData = Image.get(params.id)
        response.setHeader("Content-disposition", "attachment; filename=logo")
        response.contentType = imageData.imageType
        response.outputStream << imageData.imageData
        response.outputStream.flush()
        return;
    }
}
