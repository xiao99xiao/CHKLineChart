//
//  CHShapeLayer.swift
//  CHKLineChart
//
//  Created by Chance on 2017/6/23.
//  Copyright © 2017年 bitbank. All rights reserved.
//

import Foundation
import UIKit

open class CHShapeLayer: CAShapeLayer {
    
    // 关闭 CAShapeLayer 的隐式动画，避免滑动时候或者十字线出现时有残影的现象(实际上是因为 Layer 的 position 属性变化而产生的隐式动画)
    open override func action(forKey event: String) -> CAAction? {
        return nil
    }
}

open class CHTextLayer: CATextLayer {
    
    // 关闭 CAShapeLayer 的隐式动画，避免滑动时候或者十字线出现时有残影的现象(实际上是因为 Layer 的 position 属性变化而产生的隐式动画)
    open override func action(forKey event: String) -> CAAction? {
        return nil
    }

    // REF: http://lists.apple.com/archives/quartz-dev/2008/Aug/msg00016.html
    // CREDIT: David Hoerl - https://github.com/dhoerl
    // USAGE: To fix the vertical alignment issue that currently exists within the CATextLayer class. Change made to the yDiff calculation.

    override open func draw(in context: CGContext) {
        let height = self.bounds.size.height
        let fontSize = self.fontSize
        let yDiff = (height-fontSize)/2 - fontSize/10

        context.saveGState()
        context.translateBy(x: 0, y: yDiff) // Use -yDiff when in non-flipped coordinates (like macOS's default)
        super.draw(in: context)
        context.restoreGState()
    }
}
