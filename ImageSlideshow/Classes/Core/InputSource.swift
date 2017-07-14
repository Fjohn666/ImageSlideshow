//
//  InputSource.swift
//  ImageSlideshow
//
//  Created by Petr Zvoníček on 14.01.16.
//
//

import UIKit

/// A protocol that can be adapted by different Input Source providers
@objc public protocol InputSource {
    
    var imageTitle:String? {get set}
    var imageDescription:String? {get set}
    /**
     Load image from the source to image view.
     - parameter imageView: The image view to load the image into.
     - parameter callback: Callback called after the image was set to the image view.
     - parameter image: Image that was set to the image view.
     */
    func load(to imageView: UIImageView, with callback: @escaping (_ image: UIImage?) -> Void)
}

/// Input Source to load plain UIImage
open class ImageSource: NSObject, InputSource {
    var image: UIImage!

    /// title that will be displayed at bottom of the slider and above the description if exists
    public var imageTitle:String?
    
    /// description that will be displayed at bottom of the slider and below title if exists
    public var imageDescription: String?
    
    /// Initializes a new Image Source with UIImage
    /// - parameter image: Image to be loaded
    public init(image: UIImage,title:String? = nil,description:String? = nil) {
        self.image = image
        self.imageDescription = description
        self.imageTitle = title
    }

    /// Initializes a new Image Source with an image name from the main bundle
    /// - parameter imageString: name of the file in the application's main bundle
    public init?(imageString: String) {
        if let image = UIImage(named: imageString) {
            self.image = image
            super.init()
        } else {
            return nil
        }
    }

    public func load(to imageView: UIImageView, with callback: @escaping (UIImage?) -> Void) {
        imageView.image = image
        callback(image)
    }
}
