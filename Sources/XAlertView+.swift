//
//  XAlertView+.swift
//  Pods
//
//  Created by jowsing on 2024/12/14.
//

import Foundation

public extension XAlertView {
    
    convenience init(title: String, actions: [XAlertAction] = []) {
        self.init(title: title, message: nil, actions: actions)
    }
    
    convenience init(title: String? = nil, msg: String, actions: [XAlertAction] = []) {
        self.init(title: title, message: .text(msg), actions: actions)
    }
    
    convenience init(title: String? = nil, view: UIView, actions: [XAlertAction] = []) {
        self.init(title: title, message: .custom(view), actions: actions)
    }
    
    convenience init(title: String? = nil, message: Message?, actions: [XAlertAction] = []) {
        self.init(frame: .zero)
        self.title = title
        self.message = message
        self.actions = actions
    }
    
    func addAction(_ action: XAlertAction) {
        self.actions.append(action)
    }
}
