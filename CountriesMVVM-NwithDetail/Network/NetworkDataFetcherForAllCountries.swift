//
//  NetworkDataFetcher.swift
//  CountriesMVVM-NwithDetail
//
//  Created by Рома on 01.05.2020.
//  Copyright © 2020 Рома. All rights reserved.
//

import Foundation

class NetworkDataFetcherForAllCountries: NSObject {
    
    let networkService = NetworkService()
    
    func fetchAllCountries(with urlString: String, response: @escaping ([ModelCountries]?) -> Void) {
        networkService.request(with: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let serverResponse = try JSONDecoder().decode([ModelCountries].self, from: data)
                    response(serverResponse)
                } catch let jsonError {
                    response(nil)
                    print("Failed to decode JSON \(jsonError)")
                }
            case .failure(let error):
                print("Error received requesting data\(error)")
                response(nil)
            }
        }
    }
}
