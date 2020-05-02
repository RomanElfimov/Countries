//
//  TableViewViewModelType.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 01.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import Foundation

protocol TableViewViewModelType {
    
    var urlString: String { get }
    var countriesArray: [ModelCountries] { get }
    
    func numberOfRows() -> Int
    func fetch(completion: @escaping() -> ())
    func cellViewModel(at indexPath: IndexPath) -> TableViewCellViewModelType?
    
    // Подготовка к переходу на DetailViewController
    func viewModelForSelectedRow() -> DetailViewControllerViewModelType?
    func selectRow(at indexPath: IndexPath)
}
