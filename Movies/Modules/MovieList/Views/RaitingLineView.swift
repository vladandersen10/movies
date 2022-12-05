//
//  RaitingLineView.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import UIKit

final class RatingLineView: UIView {
    
    private let trackView = UIView()
    private var trackWidthConstraint = NSLayoutConstraint()

    // 0...1
    var rating: Double = 0 {
        didSet {
            trackWidthConstraint.constant = bounds.width * rating
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
        trackView.layer.cornerRadius = bounds.height / 2
    }
}

private extension RatingLineView {
    func setupUI() {
        backgroundColor = UIColor.Theme.background3

        trackView.backgroundColor = UIColor.Theme.action
        addSubview(trackView)
        trackView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
        }
        trackWidthConstraint = trackView.widthAnchor.constraint(equalToConstant: 0)
        trackWidthConstraint.isActive = true
    }
}
