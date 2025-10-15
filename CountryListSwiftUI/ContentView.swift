//
//  ContentView.swift
//  CountryListSwiftUI
//
//  Created by Dhathri Bathini on 10/15/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var countryViewModel: CountryViewModel
    
    init(countryViewModel: CountryViewModel) {
        self.countryViewModel = countryViewModel
    }
    
    var body: some View {
        Text("Country")
            .font(.headline)
            .foregroundStyle(.blue)
        NavigationStack {
            List(countryViewModel.countries ?? [], id: \.self) { country in
                NavigationLink(value: country) {
                    RowView(country: country)
                }
            }
            .task {
                await countryViewModel.getData()
            }
            .navigationDestination(for: Country.self) { country in
                DetailsView(country: country)
            }
        }
    }
}

struct RowView: View {
    var country: Country
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("\(country.name), \(country.code)")
                Spacer()
                Text(country.region)
                    .font(.subheadline)
                    .foregroundStyle(.blue)
            }
            Text(country.capital)
                .foregroundStyle(.gray)
        }
    }
}

struct DetailsView: View {
    var country: Country
    var body: some View {
        VStack(alignment: .center,spacing: 20) {
            Text("Country Details:")
                .foregroundStyle(.black)
                .bold()
                .font(.title)
            Text("Country Name: \(country.name)")
            Text("Country code: \(country.code)")
            Text("Capital: \(country.capital)")
            Text("Region: \(country.region)")
        }
        Spacer()
    }
}

#Preview {
    ContentView(countryViewModel: CountryViewModel(shared: NetworkManager.shared))
}
