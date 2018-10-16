//
//  VideoId.swift
//  Youtube
//
//  Created by Vlad Shchuka on 10/16/18.
//  Copyright © 2018 Vlad Shchuka. All rights reserved.
//

import Foundation
import ObjectMapper

final class VideoId {

    var videoId: String?
    var kind: String?

}

extension VideoId: Mappable {

    convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        videoId <- map["videoId"]
        kind <- map["kind"]
    }

}
