//
//  ViewController.swift
//  JusticeLeague
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var list : [Superheroe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        findSuperheroeBy(name: "a")
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SuperheroeViewCell
        let superheroe = list[indexPath.item]
        cell.render(superheroe: superheroe)
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            findSuperheroeBy(name: query)
            
        } else {
            findSuperheroeBy(name: "a")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexpath = tableView.indexPathForSelectedRow!
        let superheroe = list[indexpath.row]
        detailViewController.superheroe = superheroe
        tableView.deselectRow(at: indexpath, animated: true)
    }

    func findSuperheroeBy(name:String) {
        Task {
            do {
                
                list = try await SuperheroeProvider.findSuperheroesBy(name: name)
                DispatchQueue.main.async {
                    self.tableView.reloadData() }
            } catch {
                print(error)
                
            }
        }
    }
}
    
