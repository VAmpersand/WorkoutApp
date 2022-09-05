//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 18.06.2022.
//

import UIKit

enum TimerState {
    case isRuning
    case isPaused
    case isStopped
}

final class TimerView: WABaseInfoView {

    private let elapsedTimeLable: UILabel = {
        let lable = UILabel()
        lable.text = R.Strings.Session.elapsedTime
        lable.font = R.Fonts.helvelticaRegular(with: 14)
        lable.textColor = R.Colors.inactive
        lable.textAlignment = .center
        return lable
    }()

    private let elapsedTimeValueLable: UILabel = {
        let lable = UILabel()
        lable.text = "02:15"
        lable.font = R.Fonts.helvelticaRegular(with: 46)
        lable.textColor = R.Colors.titleGray
        lable.textAlignment = .center
        return lable
    }()

    private let remainingTimeLable: UILabel = {
        let lable = UILabel()
        lable.text = R.Strings.Session.remainingTime
        lable.font = R.Fonts.helvelticaRegular(with: 13)
        lable.textColor = R.Colors.inactive
        lable.textAlignment = .center
        return lable
    }()

    private let remainingTimeValueLable: UILabel = {
        let lable = UILabel()
        lable.text = "12:45"
        lable.font = R.Fonts.helvelticaRegular(with: 13)
        lable.textColor = R.Colors.titleGray
        lable.textAlignment = .center
        return lable
    }()

    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()

    private let progressView = ProgressView()

    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0

    var state: TimerState = .isStopped
    var callBack: (() -> Void)?

    func configure(with duration: Double, progress: Double) {
        timerDuration = duration

        let tempCurrentValue = progress > duration ? duration : progress

        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider

        progressView.drawProgress(with: CGFloat(percent))
    }

    func startTimer() {
        timer.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01

            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
            }

            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }

    func pauseTimer() {
        timer.invalidate()
    }

    func stopTimer() {
        guard self.timerProgress > 0 else { return }
        timer.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= 0.1

            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }

            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
}

extension TimerView {
    override func setupViews() {
        super.setupViews()

        setupView(progressView)
        setupView(timeStackView)

        [
            elapsedTimeLable,
            elapsedTimeValueLable,
            remainingTimeLable,
            remainingTimeValueLable
        ].forEach {
            timeStackView.addArrangedSubview($0)
        }
    }

    override func constaintViews() {
        super.constaintViews()

        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),

            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()
    }
}
