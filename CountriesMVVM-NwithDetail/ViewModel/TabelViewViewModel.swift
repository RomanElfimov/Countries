//
//  TabelViewViewModel.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 01.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import Foundation

class TabelViewViewModel: NSObject, TableViewViewModelType {
    
    var urlString = "https://restcountries.eu/rest/v2/all"
    
    var countriesArray = [ModelCountries]()
    
    var selectedIndexPath: IndexPath?
    
    @IBOutlet weak var networkDataFetcher: NetworkDataFetcherForAllCountries!
    
    func fetch(completion: @escaping () -> ()) {
        networkDataFetcher.fetchAllCountries(with: urlString) { (result) in
            guard let result = result else { return }
            self.countriesArray = result
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        return countriesArray.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> TableViewCellViewModelType? {
        let country = countriesArray[indexPath.row]
        return TableViewCellViewModel(country: country)
    }
    
    
    func viewModelForSelectedRow() -> DetailViewControllerViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewControllerViewModel(country: countriesArray[selectedIndexPath.row])
    }
    
    func selectRow(at indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    
}
