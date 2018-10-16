
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

final class VideoInfoProvider {

    private(set) var isLastPageLoaded = false
    private var nextPageToken: String?

    func fetchVideos(by query: String, with success: @escaping (_ videos: [VideoInfo]) -> Void, or failure: @escaping (_ error: Error) -> Void) {
        fetchVideoData(by: query, with: { [weak self] (response) in
            guard let nextPageToken = response.nextPageToken else {
                self?.isLastPageLoaded = true
                success(response.items)
                return
            }
            self?.nextPageToken = nextPageToken
            success(response.items)
        }, or: failure)
    }

    private func fetchVideoData(by query: String, with success: @escaping (_ response: VideosResponse) -> Void, or failure: @escaping (_ error: Error) -> Void) {
        let options = [
            "part" : "id",
            "maxResults" : "10",
            "q" : query,
            "type" : "video",
            "key" : "AIzaSyC-O4GFWLZLuK69qJNTkAQmeiFErtt88jw"
        ]
        SessionManager.default.request("https://www.googleapis.com/youtube/v3/search", method: .get, parameters: options, encoding: URLEncoding.methodDependent, headers: nil).responseObject { (response: DataResponse<VideosResponse>) in
            switch response.result {
            case .success(let responseValue):
                success(responseValue)
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }

}
