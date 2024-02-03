//
//  AuthorizationKeys.swift
//  ChargeTrip GraphQL
//
//  Created by Mohamed Adel on 03/02/2024.
//

import Foundation

struct AuthorizationKeys {
    let ProjectID: XClientID
    let ApplicationID: XAppID
    
    init(ProjectID: String, ApplicationID: String) {
        self.ProjectID = .init(value: ProjectID)
        self.ApplicationID = .init(value: ApplicationID)
    }
    
    struct XClientID {
        let name: String = "x-client-id"
        let value: String
    }
    
    struct XAppID {
        let name: String = "x-app-id"
        let value: String
    }
}
