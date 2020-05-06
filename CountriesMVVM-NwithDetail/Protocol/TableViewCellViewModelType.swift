//
//  TableViewCellViewModelType.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 01.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import Foundation

protocol TableViewCellViewModelType: class {
    
    var name: String { get }
    var capital: String { get }
    var code: String { get }
}
