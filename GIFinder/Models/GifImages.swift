//
//  GifImages.swift
//  GIFinder
//
//  Created by Alan Rodriguez on 17/08/21.
//

import Foundation

class GifImages: Decodable {
    var original: Original

    enum CodingKeys: String, CodingKey {
        case original = "original"
    }
}
