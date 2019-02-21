//
//  ViewController.swift
//  JYTest0
//
//  Created by JYanshao on 02/21/2019.
//  Copyright (c) 2019 JYanshao. All rights reserved.
//

import UIKit
import JYTest0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /// 示例
        let textField = JYTextField(frame: CGRect(x: 30, y: 150, width: 300, height: 30))
        textField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(textField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

