// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetContinentsQuery: GraphQLQuery {
  public static let operationName: String = "GetContinents"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetContinents { continents { __typename code name } }"#
    ))

  public init() {}

  public struct Data: CountryAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { CountryAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("continents", [Continent].self),
    ] }

    public var continents: [Continent] { __data["continents"] }

    /// Continent
    ///
    /// Parent Type: `Continent`
    public struct Continent: CountryAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CountryAPI.Objects.Continent }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("code", CountryAPI.ID.self),
        .field("name", String.self),
      ] }

      public var code: CountryAPI.ID { __data["code"] }
      public var name: String { __data["name"] }
    }
  }
}
