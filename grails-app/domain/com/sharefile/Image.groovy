package com.sharefile

class Image {
    private static final int TEN_MEG_IN_BYTES = 1024*1024*10

    byte[] imageData
    String imageType
    static constraints = {
        imageData( nullable: false, blank: false, minSize: 1, maxSize: TEN_MEG_IN_BYTES)
    }
    static mapping = {
        imageData sqlType: "longblob";
    }
}
