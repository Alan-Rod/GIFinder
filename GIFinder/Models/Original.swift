//
//  Original.swift
//  GIFinder
//
//  Created by Alan Rodriguez on 17/08/21.
//

import UIKit

class Original: Decodable {
    var url: String
    var height: String
    var image: UIImage?

    enum CodingKeys: String, CodingKey {
        case url
        case height
    }
}
