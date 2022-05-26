//
//  BaseController.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 23.05.2022.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        layoutViews()
        configure()
    }
}

@objc extension BaseController {

    func addViews() {}

    func layoutViews() {}

    func configure() {
        view.backgroundColor = Resources.Colors.background
    }

    func navBarLeftButtonHandler() {
        print("NavBar left button tapped")
    }

    func navBarRightButtonHandler() {
        print("NavBar right button tapped")
    }
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Colors.active, for: .normal)
        button.setTitleColor(Resources.Colors.inactive, for: .disabled)
        button.titleLabel?.font = Resources.Fonts.helvelticaRegular(with: 17)

        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
