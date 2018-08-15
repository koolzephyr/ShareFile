package com.sharefile

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.text.DecimalFormat

class TransFileService {
    boolean transactional = true

    def authentication = SecurityContextHolder.getContext().getAuthentication();

    def TransFile saveFile(GrailsParameterMap params, Image image, CommonsMultipartFile f){
        def file = new TransFile()

        file.fileLocation=params.category+"/"+params.semester
        file.extension = f.getOriginalFilename().tokenize('.').last()
        file.fileSize= new DecimalFormat("##.##").format(f.getSize() / 1024)
        file.image=Image.findById(image.id)
        file.fileName=params.fileName
        file.category=params.category
        file.semester=params.semester
        file.user = User.findByUsername(authentication.getName())

        return file
    }

    def String uploadFile(CommonsMultipartFile file,File fileInfo) {

        def servletContext = ServletContextHolder.servletContext
        def storagePath = servletContext.getRealPath( fileInfo.fileLocation )
        def name = fileInfo.fileName+"."+fileInfo.extension

        def storagePathDirectory = new java.io.File(storagePath)
        if (!storagePathDirectory.exists()) {
            storagePathDirectory.mkdirs()
        }

        // Store file

        file.transferTo(new java.io.File("${storagePath}/${name}"))
        return "${storagePath}/${name}"


    }

    def serviceMethod() {

    }
}
