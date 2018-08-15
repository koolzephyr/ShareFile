package com.sharefile


class HomeController {

    def index() { }

    def view(){
        def files = File.findAllByCategoryAndSemester(params.category,params.semester)
        return [files: files]
    }
}
