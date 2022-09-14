//
//  ImageSaver.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
    func saveToGallery(uiImage: UIImage) {
        UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
    }
}
