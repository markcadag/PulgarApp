//
//  String+Extension.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import UIKit

extension UIImage {
    func toBase64() -> String {
        self.jpegData(compressionQuality: 0.1)?.base64EncodedString() ?? ""
    }
}

