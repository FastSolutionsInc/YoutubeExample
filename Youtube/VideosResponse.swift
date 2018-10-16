//
//  VideosResponse.swift
//  Youtube
//
//  Created by Vlad Shchuka on 10/16/18.
//  Copyright © 2018 Vlad Shchuka. All rights reserved.
//

import Foundation
import ObjectMapper

final class VideosResponse {
    
}

extension VideosResponse: Mappable {

    convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        print(map.JSON)
    }

}
