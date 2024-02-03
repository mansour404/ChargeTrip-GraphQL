//
//  AuthorizationInterceptor.swift
//  ChargeTrip GraphQL
//
//  Created by Mohamed Adel on 03/02/2024.
//

import Foundation
import Apollo
import ApolloAPI

class AuthorizationInterceptor: ApolloInterceptor {
    var id: String = UUID().uuidString
    
    func interceptAsync<Operation>(chain: Apollo.RequestChain, request: Apollo.HTTPRequest<Operation>, response: Apollo.HTTPResponse<Operation>?, completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {
        
        // To get your keys you need to register at the https://account.chargetrip.com/sign-up and then create a new project.
        // To get Project id & Application id
        // And repleace them in the keys property
        let ProjectID =  "Project id / x-client-id"
        let ApplicationID = "Application id / x-app-id"
        let keys = AuthorizationKeys(ProjectID: ProjectID, ApplicationID: ApplicationID)
        request.addHeader(name: keys.ApplicationID.name, value: keys.ApplicationID.value)
        request.addHeader(name: keys.ProjectID.name, value: keys.ProjectID.value)
        
        chain.proceedAsync(request: request, response: response, interceptor: self, completion: completion)
    }
    
    
}
