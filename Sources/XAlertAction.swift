//
//  XAlertAction.swift
//  Pods
//
//  Created by jowsing on 2024/12/14.
//

import Foundation

public class XAlertAction {
    
    public enum Style {

        case `default`

        case destructive
        
        case custom(color: UIColor, weight: UIFont.Weight = .medium)
    }
    
    let style: Style
    
    let title: String
    
    let handler: ((XAlertAction) -> Void)?
    
    public init(title: String, style: Style = .default, handler: ((XAlertAction) -> Void)? = nil) {
        self.title = title
        self.style = style
        self.handler = handler
    }
}
