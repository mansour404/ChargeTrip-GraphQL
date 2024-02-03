//
//  Network.swift
//  ChargeTrip GraphQL
//
//  Created by Mohamed Adel on 03/02/2024.
//

import Foundation
import Apollo

final class Network {
    static let shared = Network()
    private init() {}
    private let url = URL(string: "https://api.chargetrip.io/graphql")! // root url
//    private (set) lazy var apollo = ApolloClient(url: url)
    
    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://api.chargetrip.io/graphql")!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        
        return ApolloClient(networkTransport: transport, store: store)
    }()
}
