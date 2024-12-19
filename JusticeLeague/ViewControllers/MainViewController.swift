//
//  ViewController.swift
//  JusticeLeague
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var list : [Superheroe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        Task {
            do {
                
                list = try await SuperheroeProvider.findSuperheroesBy(name: "Super")
                tableView.reloadData()
            } catch {
                print(error)
                
            }
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexpath = tableView.indexPathForSelectedRow!
        let superheroe = list[indexpath.row]
        detailViewController.superheroe = superheroe
        tableView.deselectRow(at: indexpath, animated: true)
    }

}
    
