//
//  ViewController.swift
//  JusticeLeague
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            do {
                
            try await findSuperheroesBy(name: "Super")
            } catch {
                
            }
        }
    }

    func findSuperheroesBy(name:String) async throws{
        let url = URL(string: "https://www.superheroapi.com/api.php/4eaf706e383ad5ea66eec65cb22f3df8/search/\(name)")!
        let(data,response) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(SuperheroeResponse.self, from: data)
        
        print(result)
    }
    

}

