//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 24.05.2022.
//

import UIKit

final class SecondaryButton: UIButton {

    private let lable = UILabel()
    private let iconView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        layoutViews()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTitle(_ title: String) {
        lable.text = title
    }
}

private extension SecondaryButton {

    func addViews() {
        addView(lable)
        addView(iconView)
    }

    func layoutViews() {
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),

            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.trailingAnchor.constraint(equalTo: iconView.leadingAnchor),
            lable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }

    func configure() {
        backgroundColor = Resources.Colors.secondary
        layer.cornerRadius = 14
        makeSystem(self)

        lable.textColor = Resources.Colors.active
        lable.textAlignment = .center
        lable.font = Resources.Fonts.helvelticaRegular(with: 15)

        iconView.image = Resources.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = Resources.Colors.active
    }
}
