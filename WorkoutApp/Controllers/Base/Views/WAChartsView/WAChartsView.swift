//
//  WAChartsView.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 07.12.2022.
//

import UIKit

extension WAChartsView {
    struct Data {
        let value: Int
        let title: String
    }
}

final class WAChartsView: WABaseView {

    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()

    private let chartView = UIView()//WAChartView()

    func configure(with data: [WAChartsView.Data]) {
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
    }
}

extension WAChartsView {
    override func setupViews() {
        super.setupViews()

        setupView(yAxisView)
        setupView(xAxisView)
        setupView(chartView)
    }

    override func constaintViews() {
        super.constaintViews()

        NSLayoutConstraint.activate([
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),

            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 12),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor),

            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 12),
            chartView.topAnchor.constraint(equalTo: topAnchor),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .clear
        chartView.backgroundColor = .cyan
    }
}

