//
//  CountriesTableViewController.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 01.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    
    //MARK: - Properties
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - viewModel property
    @IBOutlet var viewModel: TabelViewViewModel!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSeatchController()
        setupFiltering()
        viewModel.fetch {
            print(self.viewModel.countriesArray[0].name)
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Private methods
    // Настройка search controller'а
    private func setupSeatchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search countries"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
    
    //Инициализация свойств отвечающих за фильтрацию
    private func setupFiltering() {
        viewModel.isSearchBarEmpty = searchController.searchBar.text?.isEmpty ?? true
        viewModel.isFilterig = searchController.isActive && !(viewModel.isSearchBarEmpty)
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CountriesCell
        
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        
        let viewModelCell = viewModel.cellViewModel(at: indexPath)
        
        tableViewCell.viewModel = viewModelCell        
        
        return tableViewCell
    }
    
    
    //NAVIGATION
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(at: indexPath)
        
        performSegue(withIdentifier: "DetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier, let viewModel = viewModel else { return }
        
        if identifier == "DetailSegue" {
            if let destinationVC = segue.destination as? DetailViewController {
                
                destinationVC.viewModel = viewModel.viewModelForSelectedRow()
            }
        }
    }
}


//MARK: - Extension - UISearchResultsUpdating
extension CountriesTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        viewModel.filterContentForSearchText(searchBar.text!) {
            self.tableView.reloadData()
            self.setupFiltering()
        }
    }
}
