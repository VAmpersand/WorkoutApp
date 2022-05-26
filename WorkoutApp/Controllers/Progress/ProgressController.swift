//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 23.05.2022.
//

import UIKit

class ProgressController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Resources.Strings.NavBar.progress
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.progress

        addNavBarButton(at: .left, with: Resources.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.Progress.navBarRight)
    }
}
