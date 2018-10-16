
import UIKit

// MARK: - RootViewController class

final class RootViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var dataSource: VideosDataSource?

    // MARK: - Properties

    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
        dataSource?.fetchVideos()
    }

}

// MARK: - RootViewController private

private extension RootViewController {

    func setUpSearchController() {
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
        dataSource?.fetchVideos(using: query)
    }

}
