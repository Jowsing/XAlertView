//
//  XAlertActionsView.swift
//  Pods
//
//  Created by jowsing on 2024/12/20.
//

import UIKit

class XAlertActionsView: UIView {
    
    // MARK: - Property (retain)
        
    private var buttons = [UIButton]()
    
    internal var actionHandler: ((Int) -> Void)?
    
    
    // MARK: - Property (lazy)
    
    private lazy var topLineView = self.singleLineView()
    
    
    // MARK: - Life Cycle
    
    func addActions(_ actions: [XAlertAction]) {
        guard !actions.isEmpty else {
            return
        }
        self.addSubview(self.topLineView)
        self.topLineView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        var btns = [UIButton]()
        for i in 0..<actions.count {
            let action = actions[i]
            let btn = self.actionButton(for: action, at: i)
            btns.append(btn)
            self.addSubview(btn)
            if actions.count == 2 {
                self.layoutHStyle(btn, at: i)
            } else {
                self.layoutVStyle(btn, at: i, count: actions.count)
            }
        }
    }
    
    private func singleLineView() -> UIView {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.lineColor
        return lineView
    }
    
    private func actionButton(for action: XAlertAction, at index: Int) -> UIButton {
        let btn = UIButton()
        self.buttons.append(btn)
        btn.setTitle(action.title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        switch action.style {
        case .default:
            btn.setTitleColor(.systemBlue, for: .normal)
        case .destructive:
            btn.setTitleColor(.red, for: .normal)
        case .custom(let color, let weight):
            btn.setTitleColor(color, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: weight)
        }
        btn.setBackgroundImage(UIImage.stretchImage(with: UIColor.lineColor), for: .highlighted)
        btn.tag = index
        btn.addTarget(self, action: #selector(actionClick(sender:)), for: .touchUpInside)
        return btn
    }
    
    // MARK: - Actions
    
    @objc private func actionClick(sender: UIButton) {
        self.actionHandler?(sender.tag)
    }
    
    // MARK: - Layout
    
    private func layoutHStyle(_ btn: UIButton, at index: Int) {
        btn.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.top.equalTo(topLineView.snp.bottom)
            make.bottom.equalTo(0)
            if index == 0 {
                make.left.equalTo(0)
            } else {
                let lineV = self.singleLineView()
                self.addSubview(lineV)
                lineV.snp.makeConstraints { make in
                    make.top.equalTo(topLineView.snp.bottom)
                    make.bottom.equalTo(0)
                    make.width.equalTo(1)
                    make.centerX.equalToSuperview()
                    make.left.equalTo(buttons[index - 1].snp.right)
                }
                make.left.equalTo(lineV.snp.right)
                make.right.equalTo(0)
            }
        }
    }
    
    private func layoutVStyle(_ btn: UIButton, at index: Int, count: Int) {
        btn.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.left.right.equalTo(0)
            if index == 0 {
                make.top.equalTo(topLineView.snp.bottom)
            } else {
                let lineH = self.singleLineView()
                self.addSubview(lineH)
                lineH.snp.makeConstraints { make in
                    make.top.equalTo(buttons[index - 1].snp.bottom)
                    make.height.equalTo(1)
                    make.left.right.equalTo(0)
                }
                make.top.equalTo(lineH.snp.bottom)
            }
            if index == count - 1 {
                make.bottom.equalTo(0)
            }
        }
    }
}
