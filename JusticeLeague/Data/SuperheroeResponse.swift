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
    let biography: Biography
}

struct Image: Codable {
    let url:String
}

struct Biography: Codable {
    let realName:String
    let publisher:String
    let alignment:String
    let placeOfBirth:String
    
    
    private enum CodingKeys : String, CodingKey {
        case alignment,publisher
        case realName = "full-name"
        case placeOfBirth = "place-of-birth"
    }
    
}
