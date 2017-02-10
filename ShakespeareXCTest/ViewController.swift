//
//  ViewController.swift
//  ShakespeareXCTest
//
//  Created by Ayuna NYC on 2/9/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // MARK: - Properties
    
    var playData = PlayData()
    
    
    // MARK: - View 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
    
    }

    
    // MARK: - Table View 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playData.filteredWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let word = playData.filteredWords[indexPath.row]
        cell.textLabel?.text = word
        cell.detailTextLabel?.text = "\(playData.wordCounts.count(for: word))"
        
        return cell
    }
    
    
    
    // MARK: - Filter 
    
    func searchTapped() {
        let ac = UIAlertController(title: "Filter", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Search", style: .default, handler: { [unowned self] _ in
            let userInput = ac.textFields?[0].text ?? "0"
            self.playData.applyUserFilter(userInput)
            self.tableView.reloadData()
        }))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
    
    
    
    
}

