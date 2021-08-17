//
//  GifNetwork.swift
//  GIFinder
//
//  Created by Alan Rodriguez on 16/08/21.
//

import UIKit

class GifNetwork {
    func fetchGifs(for gifName: String, completion: @escaping (_ response: GifArray) -> Void) {
        let url = urlBuilder(gifName: gifName)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let err = error {
                print("Error fetching GIFs: \(err.localizedDescription)")
            }

            do {
                DispatchQueue.main.async {
                    let object = try! JSONDecoder().decode(GifArray.self, from: data!)
                    completion(object)
                }
            }
        }.resume()
    }

    private func urlBuilder(gifName: String) -> URL {
        let apiKey = "QpJGEgI2zz4RciDZYs4On21V8zvk9KXD"
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.giphy.com"
        components.path = "/v1/gifs/search"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "q", value: gifName),
            URLQueryItem(name: "limit", value: "3")
        ]

        return components.url!
    }
}
