//
//  ActivityIndicatorMaker.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import UIKit

protocol ActivityIndicatorMaker {
    func makeActivityIndicator(size: CGSize) -> UIActivityIndicatorView
}

extension ActivityIndicatorMaker {
    func makeActivityIndicator(size: CGSize) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        activityIndicator.frame = .init(origin: .zero, size: size)

        return activityIndicator
    }
}

extension UITableView: ActivityIndicatorMaker {}

extension UIViewController: ActivityIndicatorMaker {}

