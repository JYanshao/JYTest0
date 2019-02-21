//
//  JYTextField.swift
//  iosmmj
//
//  Created by anan on 2018/9/3.
//  Copyright © 2018年 artron. All rights reserved.
//

/**
 *  问题解决：https://www.jianshu.com/p/93bc0360fd2e
 **/

import UIKit

open class JYTextField: UITextField {

    var defaultYOffset: CGFloat = 0.0 // 标记UIFieldEditorContentView初始y方向偏移量
    
    /*
     *  MARK: - 为解决输入框输入时文本向下偏移或输入的内容不知道跑哪去了看不到输入的文本内容问题
     */
    override open func layoutSubviews() {
        super.layoutSubviews()
        // 遍历UITextField控件下的子视图
        for subview in self.subviews {
            // 如果这个子视图是否为UIScrollView或者UIScrollView的子类的对象（判断该对象是否为指定类或者指定类的子类的对象）
            if subview.isKind(of: UIScrollView.classForCoder()) {
                // 将子视图转换为UIScrollView
                let fieldEditor: UIScrollView = subview as! UIScrollView
                // 标记UIFieldEditorContentView当前y方向偏移量
                var currentYOffset: CGFloat = 0.0
                // 遍历UIFieldEditor下的子视图，并标记UIFieldEditorContentView的y方向偏移量
                for fieldEditorContentView in fieldEditor.subviews {
                    currentYOffset = fieldEditorContentView.frame.origin.y
                    if defaultYOffset == 0.0 && currentYOffset != 0.0 {
                        defaultYOffset = currentYOffset
                    }
                }
                
                // 改变UIFieldEditor的y方向偏移量
                var offset: CGPoint = fieldEditor.contentOffset
                if currentYOffset == 0.0 && defaultYOffset != 0.0 {
                    offset.y = -defaultYOffset
                } else {
                    offset.y = 0.0
                }
                
                // 文本为空重置 defaultYOffset
                if (self.text! as NSString).length == 0 && self.attributedText?.length == 0 {
                    offset.y = 0.0
                    defaultYOffset = 0.0
                }
                
                fieldEditor.contentOffset = offset
                
                break
            }
        }
    }
    
    /*
     *  MARK: - 重写
     */
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        super.textRect(forBounds: bounds)
//        return bounds.insetBy(dx: 2, dy: 1)
//    }
//
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        super.editingRect(forBounds: bounds)
//        return bounds.insetBy(dx: 2, dy: 1)
//    }

}
