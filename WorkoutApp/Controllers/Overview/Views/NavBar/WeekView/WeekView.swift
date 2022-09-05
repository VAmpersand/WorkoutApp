//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 28.05.2022.
//

import UIKit

final class WeekView: WABaseView {

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        return stackView
    }()
}

extension WeekView {
    override func setupViews() {
        super.setupViews()

        setupView(stackView)
    }

    override func constaintViews() {
        super.constaintViews()

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()

        var weekdays = Date.calendar.shortStandaloneWeekdaySymbols

        if Date.calendar.firstWeekday == 2 {
            let sun = weekdays.remove(at: 0)
            weekdays.append(sun)
        }

        weekdays.enumerated().forEach { index, name in
            let view = WeekdayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
        }
    }
}
