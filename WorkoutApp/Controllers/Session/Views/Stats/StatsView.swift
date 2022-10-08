//
//  StatsView.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 08.10.2022.
//

import UIKit

final class StatsView: WABaseInfoView {

    private let itemView = StatsItemView()

    override func setupViews() {
        super.setupViews()

        setupView(itemView)
        itemView.cunfigure(with: StatsItemView.StatsItem(
            image: R.Images.Session.Stats.heartRate,
            value: "155 bpm",
            title: R.Strings.Session.heartRate.uppercased()
        ))

        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ])
    }

}
