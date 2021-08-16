//
//  Gif.swift
//  GIFinder
//
//  Created by Alan Rodriguez on 16/08/21.
//

import Foundation

struct GifArray: Decodable {
    var gifs: [Gif]

    enum CodingKeys: String, CodingKey {
        case gifs = "data"
    }
}

struct original: Decodable {
    var url: String
    var height: String
}

struct GifImages: Decodable {
    var original: original

    enum CodingKeys: String, CodingKey {
        case original = "original"
    }
}

struct Gif: Decodable {
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
