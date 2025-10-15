//
//  NetworkManager.swift
//  CountryListSwiftUI
//
//  Created by Dhathri Bathini on 10/15/25.
//
import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    func getDataFromServer(url: String) async -> [Country] {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return []
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let fetchedData = try decoder.decode([Country].self, from: data)
            return fetchedData
        }
        catch {
            print("Error decoding/fetching the data")
            return []
        }
    }
}
