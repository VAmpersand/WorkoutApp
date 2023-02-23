//
//  TrainingCellView.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 10.02.2023.
//

import UIKit

enum CellRoundedType {
    case top, bottom, all, notRounded
}

final class TrainingCellView: UICollectionViewCell {
    static let id = "TrainingCellView"

    private let checkmarkView = UIImageView(image: R.Images.Overview.checkmarkNotDone)

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()

    private let title: UILabel = {
        let lable = UILabel()
        lable.font = R.Fonts.helvelticaRegular(with: 17)
        lable.textColor = R.Colors.titleGray
        return lable
    }()

    private let subtitle: UILabel = {
        let lable = UILabel()
        lable.font = R.Fonts.helvelticaRegular(with: 13)
        lable.textColor = R.Colors.inactive
        return lable
    }()

    private let rightArrowView = UIImageView(image: R.Images.Overview.rightArrow)

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        constaintViews()
        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)

        setupViews()
        constaintViews()
        configureAppearance()
    }

    func configure(with title: String, subtitle: String, isDone: Bool, roundedType: CellRoundedType) {
        self.title.text = title
        self.subtitle.text = subtitle

        checkmarkView.image = isDone ? R.Images.Overview.checkmarkDone : R.Images.Overview.checkmarkNotDone

        switch roundedType {
        case .all: self.roundCorners([.allCorners], radius: 5)
        case .bottom: self.roundCorners([.bottomLeft, .bottomRight], radius: 5)
        case .top: self.roundCorners([.topLeft, .topRight], radius: 5)
        case .notRounded: self.roundCorners([.allCorners], radius: 0)
        }
    }
}

private extension TrainingCellView {
    func setupViews() {
        setupView(checkmarkView)
        setupView(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        setupView(rightArrowView)
    }

    func constaintViews() {
        NSLayoutConstraint.activate([
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.heightAnchor.constraint(equalToConstant: 28),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),

            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15),

            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7),
        ])
    }

    func configureAppearance() {
        backgroundColor = .white
    }
}

