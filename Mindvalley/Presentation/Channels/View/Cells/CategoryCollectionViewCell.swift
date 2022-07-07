//
//  CategoryCollectionViewCell.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 07/07/2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell, MediaCell {

    static let reuseIdentifier = String(describing: CategoryCollectionViewCell.self)
    @IBOutlet weak var mediaTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.backgroundColor = #colorLiteral(red: 0.5843137255, green: 0.5960784314, blue: 0.6156862745, alpha: 0.2)
        contentView.layer.cornerRadius = contentView.frame.size.height/2
        contentView.clipsToBounds = true
    }

    func showMedia(media: MediaModel?) {
        self.mediaTitle.text = media?.title
    }
}
