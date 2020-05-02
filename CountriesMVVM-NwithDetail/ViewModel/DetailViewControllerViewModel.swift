//
//  DetailViewControllerViewModel.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 02.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import Foundation

class DetailViewControllerViewModel: DetailViewControllerViewModelType {

    private var country: ModelCountries
    
    var name: String {
        return country.name
    }
    var code: String {
        return String(country.alpha3Code)
    }
    
    var capital: String {
        return country.capital
    }
    
    var population: String {
        return String(country.population)
    }
    
    var area: String? {
        guard let countryArea = country.area else { return nil }
        return String(countryArea)
    }
    
    var region: String {
        return "\(country.region)"
    }
    
    var coordinates: String {
        return String(country.latlng[0]) + "   " + String(country.latlng[1])
    }
    
    
    var currencies: String {
        return (country.currencies[0].name ?? "no data about currency") + (country.currencies[0].symbol ?? "")
    }
    
    var languages: String {
        return country.languages[0].name ?? "no language"
    }
    
    init(country: ModelCountries) {
        self.country = country
    }
}
