//
//  CountryViewModel.swift
//  CountryListSwiftUI
//
//  Created by Dhathri Bathini on 10/15/25.
//
import Combine

@MainActor
class CountryViewModel: ObservableObject {
    
    @Published var countries: [Country]?
    var shared: NetworkManager
    
    init(shared: NetworkManager){
        self.shared = shared
    }
    
    func getData() async {
        countries = await shared.getDataFromServer(url: Server.endPoint)
    }
}
