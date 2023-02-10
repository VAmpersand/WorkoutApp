//
//  Resouces.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 23.05.2022.
//

import UIKit

enum R {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")

        static let background = UIColor(hexString: "#F8F9F9")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let secondary = UIColor(hexString: "#F0F3FF")

        static let titleGray = UIColor(hexString: "#545C77")
    }

    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }

        enum NavBar {
            static let overview = "Today"
            static let session = "High Intensity Cardio"
            static let progress = "Workout Progress"
            static let settings = "Settings"
        }

        enum Overview {
            static let allWorcoutsButton = "All Workouts"
        }

        enum Session {
            static let navBarStart = "Start"
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"

            static let elapsedTime = "Elapsed Time"
            static let remainingTime = "Remaining Time"
            static let completed = "Completed"
            static let remaining = "Remaining"

            static let workoutStats = "Workout stats"
            static let averagePace = "Average pace"
            static let heartRate = "Heart rate"
            static let totalDistance = "Total distance"
            static let totalSteps = "Total steps"

            static let stepsCounter = "Steps Counter"
        }

        enum Progress {
            static let navBarLeft = "Export"
            static let navBarRight = "Details"

            static let dailyPerformance = "Daily performance"
            static let last7Days = "Last 7 days"
            static let monthlyPerformance = "Monthly performance"
            static let last10Months = "Last 10 months"
        }

        enum Settings {}
    }

    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: return UIImage(named: "overview_tab")
                case .session: return UIImage(named: "session_tab")
                case .progress: return UIImage(named: "progress_tab")
                case .settings: return UIImage(named: "settings_tab")
                }
            }
        }

        enum Common {
            static let downArrow = UIImage(named: "down_arrow")
            static let add = UIImage(named: "add_button")
        }

        enum Overview {
            static let checkmarkNotDone = UIImage(named: "checkmark_not_done")
            static let checkmarkDone = UIImage(named: "checkmark_done")
            static let rightArrow = UIImage(named: "right_arrow")
        }

        enum Session {
            enum Stats {
                static let averagePace = UIImage(named: "stats_averagePace")
                static let heartRate = UIImage(named: "stats_heartRate")
                static let totalDistance = UIImage(named: "stats_totalDistance")
                static let totalSteps = UIImage(named: "stats_totalSteps")
            }
        }
    }

    enum Fonts {
        static func helvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
