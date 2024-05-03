//
//  ContinentViewModel.swift
//  MyCountry
//
//  Created by Sravanthi Chinthireddy on 24/04/24.
//

import Foundation
import Apollo
import CountryAPI

 class ContinentViewModel: ObservableObject {
     @Published var continents: [ContinentModel] = []
    func fetchAllContinents() {
        Network.shared.apollo.fetch(query: GetContinentsQuery()) { result in
            switch result {
            case .success(let graphQLResult):
//                print("Success! Result: \(graphQLResult)")
                if let continents = graphQLResult.data?.continents {
                    DispatchQueue.main.async {
                        self.continents = continents.map(ContinentModel.init)
                    }
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}

struct ContinentModel {
    let continent: GetContinentsQuery.Data.Continent
    
    var code: String {
        continent.code
    }
    
    var name: String {
        continent.name
    }
}
