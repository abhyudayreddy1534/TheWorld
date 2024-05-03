// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCountriesByContinentQuery: GraphQLQuery {
  public static let operationName: String = "GetCountriesByContinent"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCountriesByContinent($code: String!) { countries(filter: { continent: { eq: $code } }) { __typename code name capital emoji currency languages { __typename name } states { __typename name } } }"#
    ))

  public var code: String

  public init(code: String) {
    self.code = code
  }

  public var __variables: Variables? { ["code": code] }

  public struct Data: CountryAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { CountryAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("countries", [Country].self, arguments: ["filter": ["continent": ["eq": .variable("code")]]]),
    ] }

    public var countries: [Country] { __data["countries"] }

    /// Country
    ///
    /// Parent Type: `Country`
    public struct Country: CountryAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CountryAPI.Objects.Country }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("code", CountryAPI.ID.self),
        .field("name", String.self),
        .field("capital", String?.self),
        .field("emoji", String.self),
        .field("currency", String?.self),
        .field("languages", [Language].self),
        .field("states", [State].self),
      ] }

      public var code: CountryAPI.ID { __data["code"] }
      public var name: String { __data["name"] }
      public var capital: String? { __data["capital"] }
      public var emoji: String { __data["emoji"] }
      public var currency: String? { __data["currency"] }
      public var languages: [Language] { __data["languages"] }
      public var states: [State] { __data["states"] }

      /// Country.Language
      ///
      /// Parent Type: `Language`
      public struct Language: CountryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { CountryAPI.Objects.Language }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
        ] }

        public var name: String { __data["name"] }
      }

      /// Country.State
      ///
      /// Parent Type: `State`
      public struct State: CountryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { CountryAPI.Objects.State }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
        ] }

        public var name: String { __data["name"] }
      }
    }
  }
}
