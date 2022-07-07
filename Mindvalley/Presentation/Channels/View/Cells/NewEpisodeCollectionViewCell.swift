//
//  NewEpisodeCollectionViewCell.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 07/07/2022.
//

import UIKit

class NewEpisodeCollectionViewCell: UICollectionViewCell, MediaCell {

    static let reuseIdentifier = String(describing: NewEpisodeCollectionViewCell.self)
    @IBOutlet weak var mediaTitle: UILabel!
    @IBOutlet weak var channelTitle: UILabel!
    @IBOutlet weak var mediaImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mediaImage.layer.cornerRadius = 10
    }
    
    func showMedia(media: MediaModel?) {
        self.mediaTitle.text = media?.title
        
        if let cover = media?.coverAsset, let url = URL(string: cover) {
            self.mediaImage.loadImage(from: url)
        }
        
        
        if let channelTitle = media?.channelTitle, !channelTitle.isEmpty {
            self.channelTitle.text = media?.channelTitle
        } else {
            self.channelTitle.isHidden = true
        }
    }
}
