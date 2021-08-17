//
//  GifArray.swift
//  GIFinder
//
//  Created by Alan Rodriguez on 17/08/21.
//

import Foundation

class GifArray: Decodable {
    var gifs: [Gif]

    enum CodingKeys: String, CodingKey {
        case gifs = "data"
    }
}
