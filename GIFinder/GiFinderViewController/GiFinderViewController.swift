//
//  GiFinderViewController.swift
//  GIFinder
//
//  Created by Alan Rodriguez on 13/08/21.
//

import UIKit

class GiFinderViewController: UIViewController {
    @IBOutlet weak var gifTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var gifs = [Gif]()
    var network = GifNetwork()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        // TableView
        gifTableView.delegate = self
        gifTableView.dataSource = self

        // SearchBar
        searchBar.delegate = self
        searchBar.returnKeyType = .search
    }

    private func searchGifs(for gif: String) {
        network.fetchGifs(for: gif) { GifArray in
            self.gifs = []
            self.gifs = GifArray.gifs
            DispatchQueue.main.async { [weak self] in
                self?.gifTableView.reloadData()
            }
        }
    }
}

extension GiFinderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = CGFloat(gifs[indexPath.row].getGifHeight())
        return height
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GifCell") as? GifCell else { return .init() }
        cell.gif = gifs[indexPath.row]

        return cell
    }
}

extension GiFinderViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(reload), object: nil)
        perform(#selector(reload), with: nil, afterDelay: 2)
    }

    @objc
    func reload() {
        guard let gifName = searchBar.text else { return }
        searchGifs(for: gifName)
    }
}
