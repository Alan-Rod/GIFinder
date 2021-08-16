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
            if let gif = gif {
                let gifUrl = gif.getGifURL()
                let gifImage = UIImage.gifImageWithURL(gifUrl)
                DispatchQueue.main.async { [weak self] in
                    self?.gifView.image = gifImage
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
