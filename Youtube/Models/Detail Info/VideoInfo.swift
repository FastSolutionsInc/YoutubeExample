//
//  VideoInfo.swift
//  Youtube
//
//  Created by Vlad Shchuka on 10/16/18.
//  Copyright © 2018 Vlad Shchuka. All rights reserved.
//

import Foundation
import ObjectMapper

final class VideoInfo {

    var etag: String?
    var kind: String?
    var id: VideoId?

}

extension VideoInfo: Mappable {

    convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        etag <- map["etag"]
        kind <- map["kind"]
        id <- map["id"]
    }

}
