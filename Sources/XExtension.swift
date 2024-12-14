//
//  XExtension.swift
//  Pods
//
//  Created by jowsing on 2024/12/14.
//

import UIKit

extension UIImage {
    
    static func stretchImage(with color: UIColor, cornerRadius: CGFloat = 0) -> UIImage {
        let minSize = cornerRadius * 2 + 1
        let size = CGSize(width: minSize, height: minSize)
        let render = UIGraphicsImageRenderer(size: size)
        let image = render.image { _ in
            let rect = CGRect(origin: .zero, size: size)
            let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
            color.setFill()
            path.addClip()
            UIRectFill(rect)
        }
        return image.resizableImage(withCapInsets: .init(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius), resizingMode: .stretch)
    }
}

extension NSAttributedString {
    
    convenience init(string: String, lineSpacing: CGFloat, alignment: NSTextAlignment = .left, lineBreakMode: NSLineBreakMode = .byWordWrapping) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.alignment = alignment
        paragraphStyle.lineSpacing = lineSpacing
        self.init(string: string, attributes: [.paragraphStyle: paragraphStyle])
    }
}
