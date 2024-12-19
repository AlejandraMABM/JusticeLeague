//
//  SuperheoreProvider.swift
//  JusticeLeague
//
//  Created by Tardes on 19/12/24.
//

import Foundation

class SuperheroeProvider {
    
    static func findSuperheroesBy(name:String) async throws -> [Superheroe]{
        let url = URL(string: "https://www.superheroapi.com/api.php/4eaf706e383ad5ea66eec65cb22f3df8/search/\(name)")!
        let(data,_) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(SuperheroeResponse.self, from: data)
        
        return result.results
    
}

    static func findSuperheroesBy(id:String) async throws -> Superheroe{
        let url = URL(string: "https://www.superheroapi.com/api.php/4eaf706e383ad5ea66eec65cb22f3df8/search/\(id)")!
        let(data,_) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(Superheroe.self, from: data)
        
        return result
    
}

}
