
import Foundation
import Alamofire
import AlamofireObjectMapper

final class VideoInfoProvider {

    private(set) var isLastPageLoaded = false
    private var nextPageToken: String?

    func fetchVideos(by query: String, with success: @escaping (_ videos: [VideoInfo]) -> Void, or failure: @escaping (_ error: Error) -> Void) {
        fetchVideoData(by: query, with: { [weak self] (response) in
            guard let `self` = self else { return }
            guard let nextPageToken = response.nextPageToken else {
                self.isLastPageLoaded = true
                self.nextPageToken = nil
                success(response.items)
                return
            }
            self.nextPageToken = nextPageToken
            success(response.items)
        }, or: failure)
    }

    private func fetchVideoData(by query: String, with success: @escaping (_ response: VideosResponse) -> Void, or failure: @escaping (_ error: Error) -> Void) {
        let options = Options(nextPageToken: nextPageToken)
        SessionManager.default.request("https://www.googleapis.com/youtube/v3/search", method: .get, parameters: options.toJSON(), encoding: URLEncoding.methodDependent, headers: nil).responseObject { (response: DataResponse<VideosResponse>) in
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
