//
//  OverviewController.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 23.05.2022.
//

import UIKit

class OverviewController: WABaseController {

    private let navBar = OverviewNavBar()

    private let header = SectionHeaderView()
}

extension OverviewController {
    override func setupViews() {
        super.setupViews()

        view.setupView(navBar)
        view.setupView(header)
    }

    override func constraintViews() {
        super.constraintViews()

        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),


            header.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            header.heightAnchor.constraint(equalToConstant: 32)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()
        
        navigationController?.navigationBar.isHidden = true

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd"

        header.configure(with: dateFormatter.string(from: Date()))
    }
}
