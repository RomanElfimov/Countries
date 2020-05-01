//
//  ModelCountries.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 01.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import Foundation

struct ModelCountries: Decodable {
    var name: String
    var alpha3Code: String
    var capital: String
    var region: Region
    
    var population: Int
    var latlng: [Double]
    var area: Double?
    
    var currencies: [Currency]
    var languages: [Language]
}

struct Currency: Codable {
    var name: String?
    var symbol: String?
}

struct Language: Codable {
    var name: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case asia = "Asia"
    case empty = ""
    case europe = "Europe"
    case oceania = "Oceania"
    case polar = "Polar"
}
