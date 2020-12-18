//
//  ViewController.swift
//  ConvertTextWithHTMLTagsJul3009
//
//  Created by Zin Lin Htet Naing on 7/30/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import Atributika

class ViewController: UIViewController {

    let b = Style("b").font(.boldSystemFont(ofSize: 20)).foregroundColor(.green)
    let p = Style("p").foregroundColor(.red)
    let l = Style("l").foregroundColor(.orange)


    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "Hello<b>World</b><br><p>hdekdkdkdkkdkdkkdkdkkdkdk</p><br><l><input type = ></l>"
        textView.attributedText = str.style(tags: b, p).attributedString

    }

}

