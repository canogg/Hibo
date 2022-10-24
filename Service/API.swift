//
//  API.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 11/10/22.
//

import Foundation
import UIKit

class API {
static func getImage (name: String) async -> Data {
    var urlRequest = URLRequest(url: URL(string: "https://avatars.dicebear.com/api/pixel-art/\(name).png")!)
    urlRequest.httpMethod = "GET"
    do {
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        return data
    } catch {
        print(error)
    }
    return Data()
}    
}
