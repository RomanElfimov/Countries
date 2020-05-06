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
        if country.capital != "" {
            return country.capital
        } else {
            return "no capital"
        }
    }
    
    var population: String {
        return String(country.population)
    }
    
    var area: String? {
        guard let countryArea = country.area else { return "no data about area" }
        return String(countryArea) + " sqkm"
    }
    
    var region: String {
        return "\(country.region)"
    }
    
    // TODO: - error index out of range
    var coordinates: String {
        if country.latlng != [] {
            return String(country.latlng[0]) + "   " + String(country.latlng[1])
        } else {
            return "no coordinates"
        }
    }
    
    
    var currencies: String {
        return (country.currencies[0].name ?? "no data about currency") + "  Symbol:  " + (country.currencies[0].symbol ?? "")
    }
    
    var languages: String {
        return country.languages[0].name ?? "no language"
    }
    
    init(country: ModelCountries) {
        self.country = country
    }
}
