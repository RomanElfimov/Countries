//
//  TableViewCellViewModel.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 01.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
   
    //MARK: - Properties
    var country: ModelCountries
    
    var name: String {
        return country.name
    }
    
    var capital: String {
        return country.capital
    }
    
    var code: String {
        return country.alpha3Code
    }
    
    init(country: ModelCountries) {
        self.country = country
    }
    
}
