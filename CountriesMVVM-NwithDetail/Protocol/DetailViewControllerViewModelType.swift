//
//  DetailViewControllerViewModelType.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 02.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import Foundation

protocol DetailViewControllerViewModelType {
    
    var name: String { get }
    var code: String { get }
    var capital: String { get }
    
    var population: String { get }
    var area: String? { get }
    
    var region: String { get }
    var coordinates: String { get }
    
    var currencies: String { get }
    var languages: String { get }
}
