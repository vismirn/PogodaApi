//
//  SearchViewController.swift
//  PogodaApi
//
//  Created by Viktor Smirnov on 13.05.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)
    let label = UILabel()
    let timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupElements()
        setupConstraints()
        
        
    }
    
}
//MARK: - Setup View
extension SearchViewController {
    func setupElements() {


        title = "Search"
        view.backgroundColor = .green
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        
    }
}
//MARK: - Setup Constraints

extension SearchViewController {
    func setupConstraints() {
        
    }
}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "MYcell", for: indexPath)
    cell.textLabel?.text = "indexPath \(indexPath)"
    return cell
}



}

extension SearchViewController: UISearchBarDelegate  {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchText)&limit=10"
// 34e26d07a2a76c87d21f357aa6268a1f
//         http://api.weatherstack.com/current
        timer?.invalidate()
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                    guard let url = URL(string: urlString) else { return }
                    URLSession.shared.dataTask(with: url) { (data, respons, error) in
                        if let error = error {
                            print(error.localizedDescription)
                        }
        //                print(data)
                        guard let data = data else { return }
                        do {
                            let tracks = try JSONDecoder().decode(SearchResponse.self, from: data)
                            tracks.results.forEach { (track) in
                                print(track.trackName)
                            }
                        } catch let jsonError {
                            print(jsonError.localizedDescription)
                        }
                    }.resume()
                })

        
    }
}
