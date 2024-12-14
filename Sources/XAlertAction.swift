//
//  XAlertAction.swift
//  Pods
//
//  Created by jowsing on 2024/12/14.
//

import Foundation

public class XAlertAction {
    
    public enum Style : Int {

        case `default` = 0

        case destructive = 2
    }
    
    let style: Style
    
    let title: String
    
    let handler: ((XAlertAction) -> Void)?
    
    public init(style: Style = .default, title: String, handler: ((XAlertAction) -> Void)? = nil) {
        self.style = style
        self.title = title
        self.handler = handler
    }
}
