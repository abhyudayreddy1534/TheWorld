//
//  CountryView.swift
//  MyCountry
//
//  Created by Sravanthi Chinthireddy on 24/04/24.
//

import SwiftUI
import CountryAPI

struct CountryView: View {
    @StateObject var viewModel = CountryViewModel()
    let continent: ContinentModel
    
    var body: some View {
        List(viewModel.countries, id: \.code) { country in
            VStack(alignment: .leading) {
                HStack {
                    Text(country.flag)
                        .font(.largeTitle)
                        .padding(.trailing, 10)
                    Text(country.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                if !country.languages.isEmpty {
                    HStack(alignment: .top) {
                        Text(country.languages.count == 1 ? "Language" : country.languages.count > 1 ? "Languages" : "")
                            .fontWeight(.medium)
                        Text(country.languages.map({$0.name}).joined(separator: ", "))
                    }
                }
                if !country.states.isEmpty {
                    HStack(alignment: .top, content: {
                        Text(country.states.count == 1 ? "State" : country.states.count > 1 ? "States" : "")
                            .fontWeight(.bold)
                        
                        VStack (alignment: .trailing) {
                            ForEach(country.states, id: \.name) { state in
                                Text(state.name)
                            }
                        }
                    })
                }
            }
        }
        .onAppear(perform: {
            viewModel.fetchCountriesByContinent(with: continent.code)
        })
        .navigationTitle(continent.name)
    }
}

//#Preview {
//    CountryView()
//}
