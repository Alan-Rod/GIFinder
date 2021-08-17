//
//  Gif.swift
//  GIFinder
//
//  Created by Alan Rodriguez on 16/08/21.
//

import Foundation

class Gif: Decodable {
    var gifSources: GifImages

    enum CodingKeys: String, CodingKey {
        case gifSources = "images"
    }

    func getGifURL() -> String {
        return gifSources.original.url
    }

    func getGifHeight() -> Int {
        guard let height = Int(gifSources.original.height) else { return 0 }
        return height
    }
}
