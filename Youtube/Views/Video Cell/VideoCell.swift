
import UIKit

//MARK: - VideoCell class

final class VideoCell: UICollectionViewCell {

    //MARK: - IBOutlets

    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var videoNameLabel: UILabel!
    @IBOutlet private weak var duration: UILabel!

    //MARK: - Interface

    func setUp(_ info: VideoInfo) {
        
    }

}
