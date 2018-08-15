package com.sharefile

/**
 * Created by zephyr on 10/7/15.
 */
class ImageService {
    def Image saveImage(String type, byte[] img){
        def image = new Image(imageType: type,imageData: img).save(failOnError: true,flush: true);
        return image
    }
}
