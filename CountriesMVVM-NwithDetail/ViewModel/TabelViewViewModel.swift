//
//  TabelViewViewModel.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 01.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import Foundation

class TabelViewViewModel: NSObject, TableViewViewModelType {
    
    //MARK: - Properties
    var urlString = "https://restcountries.eu/rest/v2/all"
    var countriesArray = [ModelCountries]()
    var selectedIndexPath: IndexPath?
    
    //Properties for searching
    var filteredCountries = [ModelCountries]()
    var isSearchBarEmpty: Bool = true
    var isFilterig: Bool = false
    
    //MARK: - NetworkManager property
    @IBOutlet weak var networkDataFetcher: NetworkDataFetcherForAllCountries!
    
    //MARK: - Methods
    func fetch(completion: @escaping () -> ()) {
        networkDataFetcher.fetchAllCountries(with: urlString) { (result) in
            guard let result = result else { return }
            self.countriesArray = result
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        if isFilterig {
            return filteredCountries.count
        }
        return countriesArray.count
    }
    
    // Метод фильтрует контент по поисковой строке
    func filterContentForSearchText(_ searchText: String, completion: @escaping () -> ()) {
        filteredCountries = countriesArray.filter { (country: ModelCountries) -> Bool in
            
            return country.name.lowercased().contains(searchText.lowercased())
        }
        completion()
    }
    
    func cellViewModel(at indexPath: IndexPath) -> TableViewCellViewModelType? {
        let country: ModelCountries
        if isFilterig {
            country = filteredCountries[indexPath.row]
        } else {
            country = countriesArray[indexPath.row]
        }
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
