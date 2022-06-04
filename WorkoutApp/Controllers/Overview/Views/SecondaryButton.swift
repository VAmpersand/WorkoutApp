//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 24.05.2022.
//

import UIKit

final class SecondaryButton: UIButton {

    private let lable: UILabel = {
        let lable = UILabel()
        lable.textColor = R.Colors.active
        lable.textAlignment = .center
        lable.font = R.Fonts.helvelticaRegular(with: 15)
        return lable
    }()

    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        view.tintColor = R.Colors.active
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        constaintViews()
        configureAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTitle(_ title: String) {
        lable.text = title
    }
}

private extension SecondaryButton {

    func setupViews() {
        setupView(lable)
        setupView(iconView)
    }

    func constaintViews() {
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

    func configureAppearance() {
        backgroundColor = R.Colors.secondary
        layer.cornerRadius = 14
        makeSystem(self)
    }
}
