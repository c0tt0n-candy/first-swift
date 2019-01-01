//
//  ViewController.swift
//  Sample
//
//  Created by Yutaka Okubo on 2019/01/01.
//  Copyright © 2019 Yutaka Okubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var label: UILabel!

    @IBAction func buttonTapped(_ sender: UIButton) {
        label.text = "Tapped!"
    }
}
