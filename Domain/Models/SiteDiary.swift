//
//  SiteDiary.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation

public struct SiteDiary: Decodable, Encodable {
    public let photos: [SitePhoto]
    public let comments: String
    public let date: String
    public let area: String
    public let category: String
    public let tag: String
    public let event: String
}
