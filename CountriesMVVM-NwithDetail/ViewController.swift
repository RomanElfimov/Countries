//
//  ViewController.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 01.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let urlString = "https://restcountries.eu/rest/v2/all"
    var countriesArray = [ModelCountries]()
    let networkManager = NetworkDataFetcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetch(with: urlString) { (result) in
            guard let result = result else { return }
            self.countriesArray = result
            print(self.countriesArray[0].name)
        }
    }


}

