//
//  StationListView.swift
//  ChargeTrip GraphQL
//
//  Created by Mohamed Adel on 03/02/2024.
//

import SwiftUI

struct StationListView: View {
    // ViewModel instance
    @StateObject var viewModel = StationListViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            List(viewModel.stationList, id: \.self){ station in
                Section {
                    Text("Owner name: " + viewModel.ownerName(of: station))
                        .fontWeight(.bold)
                    
                    Text("Address: " + viewModel.address(of: station))
                        .fontWeight(.light)
                }
            }
        }
        .task {
            viewModel.loadStations()
        }
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView()
    }
}
