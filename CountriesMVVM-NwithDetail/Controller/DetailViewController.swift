//
//  DetailViewController.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 02.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var viewModel: DetailViewControllerViewModelType?
   
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var coordinatesLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let viewModel = viewModel else { return }
        
        self.countryNameLabel.text = viewModel.name
        self.codeLabel.text = viewModel.code
        self.capitalLabel.text = "Capital: \(viewModel.capital)"

        self.populationLabel.text = "Population: \(viewModel.population) people"
        self.areaLabel.text = "Area: \(viewModel.area ?? "")"
        
        self.regionLabel.text = "Region: \(viewModel.region)"
        self.coordinatesLabel.text = "Coordinates: \(viewModel.coordinates)"
        
        self.currencyLabel.text = "Currency: \(viewModel.currencies)"
        self.languageLabel.text = "Languahe: \(viewModel.languages)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else { return }
        title = viewModel.name
    }
    


}
