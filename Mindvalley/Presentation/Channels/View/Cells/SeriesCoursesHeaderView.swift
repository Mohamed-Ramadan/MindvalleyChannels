//
//  SeriesCoursesHeaderView.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 07/07/2022.
//

import UIKit

class SeriesCoursesHeaderView: UICollectionReusableView {
    static let reuseIdentifier = String(describing: SeriesCoursesHeaderView.self)
    
    let textLabel = UILabel()
    let iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
    let mediaCountLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        textLabel.textColor = #colorLiteral(red: 0.5843137255, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let textStackView = UIStackView(arrangedSubviews: [textLabel, mediaCountLabel])
        textStackView.axis = .vertical
        textStackView.alignment = .leading
        
        let headerStackView = UIStackView(arrangedSubviews:[iconImageView, textStackView])
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.spacing = 10
        
        addSubview(headerStackView)
         
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let inset: CGFloat = 10
        NSLayoutConstraint.activate(
            [
                headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
                headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
                headerStackView.topAnchor.constraint(equalTo: topAnchor, constant: inset),
                headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
                iconImageView.widthAnchor.constraint(equalToConstant: 70.0),
                iconImageView.heightAnchor.constraint(equalToConstant: 70.0)
            ]
        )
        
        iconImageView.layer.cornerRadius = iconImageView.frame.size.height/2
        iconImageView.clipsToBounds = true
    }
}
