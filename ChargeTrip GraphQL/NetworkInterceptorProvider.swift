//
//  NetworkInterceptorProvider.swift
//  ChargeTrip GraphQL
//
//  Created by Mohamed Adel on 03/02/2024.
//

import Foundation
import Apollo
import ApolloAPI

class NetworkInterceptorProvider: DefaultInterceptorProvider {
    
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interactor = super.interceptors(for: operation)
        interactor.insert(AuthorizationInterceptor(), at: 0)
        return interactor
    }
}
