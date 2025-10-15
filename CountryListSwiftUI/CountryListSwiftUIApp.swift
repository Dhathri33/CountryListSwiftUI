//
//  CountryListSwiftUIApp.swift
//  CountryListSwiftUI
//
//  Created by Dhathri Bathini on 10/15/25.
//

import SwiftUI

@main
struct CountryListSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(countryViewModel: CountryViewModel(shared: NetworkManager.shared))
        }
    }
}
