//
//  GifCell.swift
//  GIFinder
//
//  Created by Alan Rodriguez on 16/08/21.
//

import UIKit

class GifCell: UITableViewCell {
    @IBOutlet weak var gifView: UIImageView!

    var gif: Gif? {
        didSet {
            if let gif = gif?.gifSources.original {
                if let image = gif.image {
                    DispatchQueue.main.async { [weak self] in
                        self?.gifView.image = image
                    }
                } else {
                    let gifUrl = gif.url
                    DispatchQueue.main.async { [weak self] in
                        if let gifImage = UIImage.gifImageWithURL(gifUrl) {
                            self?.gifView.image = gifImage
                        }
                    }
                }
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        gifView.image = nil
    }
}
