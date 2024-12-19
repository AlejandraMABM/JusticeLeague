//
//  SuperheroeResponse.swift
//  JusticeLeague
//
//  Created by Tardes on 18/12/24.
//

import Foundation

struct SuperheroeResponse: Codable {
    
    let results: [Superheroe]
    
}

struct Superheroe: Codable {
    let id:String
    let name:String
    let image:Image
}

struct Image: Codable {
    let url:String
}
