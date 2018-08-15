package com.sharefile



class File {

    String fileName
    String semester
    String category
    String fileLocation
    String fileSize
    String extension

    static constraints = {
        fileName( nullable: false, blank: false, maxSize: 30 )
        semester( nullable: false, blank: false  )
        category( nullable: false, blank: false  )
        fileLocation( nullable: false )
        extension( nullable: false )

    }
}
