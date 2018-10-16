//
//  VideoInfoProvider.swift
//  Youtube
//
//  Created by Vlad Shchuka on 10/16/18.
//  Copyright © 2018 Vlad Shchuka. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

struct VideoInfoProvider {

    func fetchVideos(by query: String, with success: () -> Void, or failure: () -> Void) {
        let options = [
            "part" : "id",
            "maxResults" : "10",
            "q" : query,
            "type" : "video",
            "key" : "AIzaSyC-O4GFWLZLuK69qJNTkAQmeiFErtt88jw"
        ]
        SessionManager.default.request("https://www.googleapis.com/youtube/v3/search", method: .get, parameters: options, encoding: URLEncoding.methodDependent, headers: nil).responseObject { (response: DataResponse<VideosResponse>) in
            switch response.result {
            case .success(let data):
                print(data.toJSON())
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }

}
