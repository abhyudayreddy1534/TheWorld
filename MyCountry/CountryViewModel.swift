//
//  CountryViewModel.swift
//  MyCountry
//
//  Created by Sravanthi Chinthireddy on 24/04/24.
//

import Foundation
import Apollo
import CountryAPI

class CountryViewModel: ObservableObject {
    @Published var countries: [CountryModel] = []
    
    func fetchCountriesByContinent(with code: String) {
        Network.shared.apollo.fetch(query: GetCountriesByContinentQuery(code: code)){ result in
            switch result {
            case .success(let graphQLResult):
                if let countries = graphQLResult.data?.countries {
                    DispatchQueue.main.async {
                        self.countries = countries.map(CountryModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}

struct CountryModel {
    let country: GetCountriesByContinentQuery.Data.Country
    
    var code: String {
        country.code
    }
    
    var name: String {
        country.name
    }
    
    var capital: String {
        country.capital ?? "-"
    }
    
    var flag: String {
        country.emoji
    }
    
    var currency: String {
        country.currency ?? "-"
    }
    
    var states: [State] {
        country.states.map(State.init)
    }
    
    var languages: [Language] {
        country.languages.map(Language.init)
    }
}

struct State {
    let state: GetCountriesByContinentQuery.Data.Country.State
    
    var name: String {
        state.name
    }
}

struct Language {
    let language: GetCountriesByContinentQuery.Data.Country.Language
    
    var name: String {
        language.name
    }
}
