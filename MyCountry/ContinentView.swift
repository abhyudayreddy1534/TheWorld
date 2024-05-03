//
//  ContinentView.swift
//  MyCountry
//
//  Created by Sravanthi Chinthireddy on 22/04/24.
//

import SwiftUI

struct ContinentView: View {
    @StateObject var viewModel = ContinentViewModel()
    var body: some View {
        NavigationView(content: {
            List(viewModel.continents, id: \.code) { continent in
                NavigationLink(destination: CountryView(continent: continent)) { Text(continent.name) }
            }
            .onAppear(perform: {
                viewModel.fetchAllContinents()
            })
            .navigationTitle("Continents")
            
        })
    }
}

#Preview {
    ContinentView()
}
