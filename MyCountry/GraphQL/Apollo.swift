//
//  Apollo.swift
//  MyCountry
//
//  Created by Sravanthi Chinthireddy on 22/04/24.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private init() {}

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com")!)
}
