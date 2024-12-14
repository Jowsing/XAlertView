//
//  XAlertView.swift
//  Pods
//
//  Created by jowsing on 2024/12/14.
//

import UIKit
import SnapKit
import XScrollView

public class XAlertView: UIView {
    
    public enum Message {
        case text(String)
        case custom(UIView)
    }
    
    
    // MARK: - Property (assign)
    
    internal var title: String?
    
    internal var message: Message?
    
    internal var actions: [XAlertAction] = []
    
    private var isShowing = false
    
    // MARK: - Property (lazy)
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 13
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
                
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var messageView: XScrollView = {
        let scrollView = XScrollView()
        scrollView.autoScrollDirection = .vertical
        scrollView.contentInset = .init(top: 15, left: 15, bottom: 20, right: 15)
        return scrollView
    }()
    
    private lazy var actionsView = UIView()

    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = UIColor(white: 0, alpha: 0.3)
        
        self.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(270)
            make.top.greaterThanOrEqualTo(self.safeAreaLayoutGuide.snp.top)
            make.bottom.lessThanOrEqualTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        
        contentView.addSubview(messageView)
        messageView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
        }
        
        contentView.addSubview(actionsView)
        actionsView.snp.makeConstraints { make in
            make.top.equalTo(messageView.snp.bottom)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
    }
    
    public func show(on view: UIView) {
        guard !self.isShowing else { return }
        self.isShowing = true
        
        self.frame = view.bounds
        view.addSubview(self)
        self.safeAreaLayoutGuide.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        
        self.setupTitle()
        self.setupMessage()
        self.setupActions()
        self.showWithAnimating()
    }
    
    private func setupTitle() {
        guard let str = self.title else { return }
        titleLabel.text = str
        messageView.addArrangedSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalTo(0)
        }
    }
    
    private func setupMessage() {
        guard let msg = self.message else {
            messageView.contentInset.bottom = 15
            return
        }
        switch msg {
        case .text(let str):
            let label = UILabel()
            label.attributedText = NSAttributedString(string: str, lineSpacing: 5)
            label.textColor = UIColor.black
            label.font = .systemFont(ofSize: 14)
            label.numberOfLines = 0
            messageView.addArrangedSubview(label)
            label.snp.makeConstraints { make in
                if title == nil {
                    make.top.equalTo(0)
                } else {
                    make.top.equalTo(titleLabel.snp.bottom).offset(12)
                }
                make.left.right.equalTo(0)
            }
        case .custom(let customView):
            messageView.addArrangedSubview(customView)
            customView.snp.makeConstraints { make in
                if title == nil {
                    make.top.equalTo(0)
                } else {
                    make.top.equalTo(titleLabel.snp.bottom).offset(12)
                }
                make.left.right.equalTo(0)
            }
        }
    }
    
    private func setupActions() {
        guard !actions.isEmpty else {
            return
        }
        let line = self.newSingleLineView()
        line.backgroundColor = .lightGray
        actionsView.addSubview(line)
        line.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        var btns = [UIButton]()
        for i in 0..<actions.count {
            let action = actions[i]
            let btn = UIButton()
            btn.setTitle(action.title, for: .normal)
            switch action.style {
            case .default:
                btn.setTitleColor(.systemBlue, for: .normal)
            case .destructive:
                btn.setTitleColor(.red, for: .normal)
            }
            btn.setBackgroundImage(UIImage.stretchImage(with: UIColor(white: 0.2, alpha: 0.1)), for: .highlighted)
            btn.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
            btn.tag = i
            btn.addTarget(self, action: #selector(actionClick(sender:)), for: .touchUpInside)
            actionsView.addSubview(btn)
            btn.snp.makeConstraints { make in
                make.height.equalTo(44)
                if actions.count == 2 {
                    make.top.equalTo(line.snp.bottom)
                    make.bottom.equalTo(0)
                    if i == 0 {
                        make.left.equalTo(0)
                    } else {
                        let lineV = self.newSingleLineView()
                        actionsView.addSubview(lineV)
                        lineV.snp.makeConstraints { make in
                            make.top.equalTo(line.snp.bottom)
                            make.bottom.equalTo(0)
                            make.width.equalTo(1)
                            make.centerX.equalToSuperview()
                            make.left.equalTo(btns[i - 1].snp.right)
                        }
                        make.left.equalTo(lineV.snp.right)
                        make.right.equalTo(0)
                    }
                } else {
                    make.left.right.equalTo(0)
                    if i == 0 {
                        make.top.equalTo(line.snp.bottom)
                    } else {
                        let lineH = self.newSingleLineView()
                        actionsView.addSubview(lineH)
                        lineH.snp.makeConstraints { make in
                            make.top.equalTo(btns[i - 1].snp.bottom)
                            make.height.equalTo(1)
                            make.left.right.equalTo(0)
                        }
                        make.top.equalTo(lineH.snp.bottom)
                    }
                    if i == actions.count - 1 {
                        make.bottom.equalTo(0)
                    }
                }
            }
            btns.append(btn)
        }
    }
    
    private func newSingleLineView() -> UIView {
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        return lineView
    }
    
    
    // MARK: - Actions
    
    @objc private func actionClick(sender: UIButton) {
        let action = self.actions[sender.tag]
        action.handler?(action)
        self.dismissWithAnimating()
    }
    
    // MARK: - Animations
    
    private func makeHiddenTransform() {
        self.alpha = 0
        let scale: CGFloat = 1.2
        if #available(iOS 13.0, *) {
            self.transform3D = CATransform3DMakeScale(scale, scale, 1.25)
        } else {
            self.transform = CGAffineTransformMakeScale(scale, scale)
        }
    }
    
    private func makeShowTransform() {
        self.alpha = 1
        if #available(iOS 13.0, *) {
            self.transform3D = CATransform3DIdentity
        } else {
            self.transform = .identity
        }
    }
    
    private func animate(_ animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.95,
                       initialSpringVelocity: 2,
                       options: .curveEaseOut,
                       animations: animations,
                       completion: completion)
    }
    
    private func showWithAnimating() {
        self.makeHiddenTransform()
        self.animate {
            self.makeShowTransform()
        }
    }
    
    private func dismissWithAnimating(_ completion: (() -> Void)? = nil) {
        self.animate {
            self.alpha = 0
        } completion: { _ in
            completion?()
            self.removeFromSuperview()
        }
    }

}
