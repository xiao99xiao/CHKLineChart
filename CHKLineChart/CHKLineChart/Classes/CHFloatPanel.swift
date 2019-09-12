//
//  CHFloatPanel.swift
//  CHKLineChartKit
//
//  Created by Xiao Xiao on 2019/09/11.
//  Copyright © 2019 bitbank. All rights reserved.
//

import UIKit

open class CHFloatPanel: UIView {
    private var stackView: UIStackView = UIStackView()
    private var timeTitle: UILabel = UILabel()
    private var openTitle: UILabel = UILabel()
    private var highTitle: UILabel = UILabel()
    private var lowTitle: UILabel = UILabel()
    private var closeTitle: UILabel = UILabel()
    private var changeTitle: UILabel = UILabel()
    private var changePercentTitle: UILabel = UILabel()
    private var volTitle: UILabel = UILabel()

    private var timeLabel: UILabel = UILabel()
    private var openLabel: UILabel = UILabel()
    private var highLabel: UILabel = UILabel()
    private var lowLabel: UILabel = UILabel()
    private var closeLabel: UILabel = UILabel()
    private var changeLabel: UILabel = UILabel()
    private var changePercentLabel: UILabel = UILabel()
    private var volLabel: UILabel = UILabel()

    var upColor: UIColor = UIColor.green     //升的颜色
    var downColor: UIColor = UIColor.red     //跌的颜色

    private var labels = [[UILabel]]()

    public var font: UIFont = UIFont.systemFont(ofSize: 10) {
        didSet {
            labels.forEach({$0.forEach({$0.font = font})})
        }
    }

    public var textColor: UIColor = UIColor.white {
        didSet {
            labels.forEach({$0.forEach({$0.textColor = textColor})})
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        labels = [[timeTitle, timeLabel], [openTitle, openLabel], [highTitle, highLabel], [lowTitle, lowLabel], [closeTitle, closeLabel], [changeTitle, changeLabel], [changePercentTitle, changePercentLabel], [volTitle, volLabel]]
        labels.forEach { (labels) in
            labels[1].textAlignment = .right
            labels.forEach({$0.numberOfLines = 1})
        }
        setTitle(time: "Time", open: "Open", high: "High", low: "Low", close: "Close", change: "Change", changePercent: "Change %", vol: "Vol")
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        let stacks = labels.map { (labels) -> UIStackView in
            let view = UIStackView.init(arrangedSubviews: labels)
            view.axis = .horizontal
            view.alignment = .fill
            view.distribution = .fill
            view.spacing = 6
            return view
        }
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6).isActive = true
        stackView.widthAnchor.constraint(greaterThanOrEqualToConstant: 125).isActive = true
        stacks.forEach({stackView.addArrangedSubview($0)})
        translatesAutoresizingMaskIntoConstraints = false
    }

    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTitle(time: String, open: String, high: String, low: String, close: String, change: String, changePercent: String, vol: String) {
        timeTitle.text = time
        openTitle.text = open
        highTitle.text = high
        lowTitle.text = low
        closeTitle.text = close
        changeTitle.text = change
        changePercentTitle.text = changePercent
        volTitle.text = vol
        sizeToFit()
    }

    func showChartItem(time: String, open: String, high: String, low: String, close: String, change: String, changePercent: String, vol: String) {
        timeLabel.text = time
        openLabel.text = open
        highLabel.text = high
        lowLabel.text = low
        closeLabel.text = close
        changeLabel.text = change
        changePercentLabel.text = changePercent
        volLabel.text = vol
        let changeColor = change.starts(with: "-") ? downColor : upColor
        [changeLabel, changePercentLabel].forEach({$0.textColor = changeColor})
    }

}
