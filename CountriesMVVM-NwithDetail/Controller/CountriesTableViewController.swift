//
//  CountriesTableViewController.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 01.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {

    @IBOutlet var viewModel: TabelViewViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetch {
            print(self.viewModel.countriesArray[0].name)
            self.tableView.reloadData()
        }
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
