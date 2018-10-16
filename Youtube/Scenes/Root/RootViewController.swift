
import UIKit

// MARK: - RootViewController class

final class RootViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var dataSource: VideosDataSource?
    @IBOutlet private weak var collectionView: UICollectionView?
    
    // MARK: - Properties

    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
        dataSource?.fetchVideos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let playerViewController = segue.destination as? PlayerViewController,
            let cell = sender as? UICollectionViewCell,
            let videoId = dataSource?.videoId(by: cell) else { return }
        playerViewController.videoId = videoId
    }

}

// MARK: - RootViewController private

private extension RootViewController {

    func setUpSearchController() {
        searchController.searchBar.tintColor = .white
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search video"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

}

// MARK: - UISearchResultsUpdating Delegate

extension RootViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        searchController.isActive = false
        dataSource?.fetchVideos(using: query)
    }

}
