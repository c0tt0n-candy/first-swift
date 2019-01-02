//
//  ViewController.swift
//  Timer
//
//  Created by Yutaka Okubo on 2019/01/02.
//  Copyright © 2019 Yutaka Okubo. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var timer: Timer?
    var currentSeconds = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var label: UILabel!

    @IBAction func tenSecButtonTapped(_ sender: UIButton) {
        start(seconds: 10)
    }

    @IBAction func threeMinButtonTapped(_ sender: UIButton) {
        start(seconds: 180)
    }

    @IBAction func fiveMinButtonTapped(_ sender: UIButton) {
        start(seconds: 300)
    }

    private func start(seconds: Int) {
        currentSeconds = seconds
        label.text = "残り\(currentSeconds)秒"
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(ViewController.update),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func update() {
        currentSeconds -= 1
        label.text = "残り\(currentSeconds)秒"
        if (currentSeconds == 0) {
            timer?.invalidate()
            let soundId: SystemSoundID = 1005
            AudioServicesPlayAlertSound(soundId)
        }
    }
}
