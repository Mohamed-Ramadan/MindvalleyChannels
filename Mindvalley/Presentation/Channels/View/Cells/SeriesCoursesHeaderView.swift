//
//  SeriesCoursesHeaderView.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 07/07/2022.
//

import UIKit

class SeriesCoursesHeaderView: UICollectionReusableView {
    static let reuseIdentifier = String(describing: SeriesCoursesHeaderView.self)
    
    let lineView = UIView()
    let textLabel = UILabel()
    let iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
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
        textLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mediaCountLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        mediaCountLabel.textColor = #colorLiteral(red: 0.5843137255, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        
        lineView.backgroundColor = UIColor(red: 60/255.0, green: 67/255.0, blue: 78/255.0, alpha: 1)
        
        let textStackView = UIStackView(arrangedSubviews: [textLabel, mediaCountLabel])
        textStackView.axis = .vertical
        textStackView.alignment = .leading
        
        let headerStackView = UIStackView(arrangedSubviews:[iconImageView, textStackView])
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.spacing = 20
        
        let verticalStack = UIStackView(arrangedSubviews: [lineView, headerStackView])
        verticalStack.axis = .vertical
        verticalStack.alignment = .top
        verticalStack.spacing = 30
        
        addSubview(verticalStack)
         
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        let inset: CGFloat = 10
        NSLayoutConstraint.activate(
            [
                headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
                headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
                headerStackView.topAnchor.constraint(equalTo: topAnchor, constant: inset*2),
                headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset*2),
                lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
                lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
                lineView.heightAnchor.constraint(equalToConstant: 1),
                iconImageView.widthAnchor.constraint(equalToConstant: 50),
                iconImageView.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
        
        iconImageView.layer.cornerRadius = iconImageView.frame.size.height/2
        iconImageView.clipsToBounds = true
    }
}
