//
//  WeekdayView.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 28.05.2022.
//

import UIKit

extension WeekView {
    final class WeekdayView: BaseView {

        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()

        func configure(with index: Int, and name: String) {
            let startOfWeek = Date().startOfWeek
            let currenrDay = startOfWeek.agoForward(to: index)
            let day = Calendar.current.component(.day, from: currenrDay)

            let isToday = currenrDay.stripTime() == Date().stripTime()

            backgroundColor = isToday ? Resources.Colors.active : Resources.Colors.background

            nameLabel.text = name.uppercased()
            nameLabel.textColor = isToday ? .white : Resources.Colors.inactive

            dateLabel.text = "\(day)"
            dateLabel.textColor = isToday ? .white : Resources.Colors.inactive
        }
    }
}


extension WeekView.WeekdayView {
    override func addViews() {
        super.addViews()

        addView(stackView)

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }

    override func layoutViews() {
        super.layoutViews()

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    override func configureView() {
        super.configureView()

        layer.cornerRadius = 5
        layer.masksToBounds = true

        nameLabel.font = Resources.Fonts.helvelticaRegular(with: 9)
        nameLabel.textAlignment = .center

        dateLabel.font = Resources.Fonts.helvelticaRegular(with: 15)
        dateLabel.textAlignment = .center

        stackView.spacing = 3
        stackView.axis = .vertical
    }
}

