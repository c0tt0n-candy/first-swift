//
//  DetailViewController.swift
//  Animals
//
//  Created by Yutaka Okubo on 2019/01/03.
//  Copyright © 2019 Yutaka Okubo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var info: AnimalInfo!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = info.name
        label.text = info.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
