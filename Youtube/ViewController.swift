
import UIKit

class ViewController: UIViewController {

    let videosProvider = VideoInfoProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        videosProvider.fetchVideos(by: "Some", with: {
            
        }) {
            
        }
    }


}

