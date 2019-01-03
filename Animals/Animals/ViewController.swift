//
//  ViewController.swift
//  Animals
//
//  Created by Yutaka Okubo on 2019/01/02.
//  Copyright © 2019 Yutaka Okubo. All rights reserved.
//

import UIKit

struct AnimalInfo{
    var name: String
    var description: String
}

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let items = [
        AnimalInfo(name: "ライオン", description: "百獣の王。一般的に最も強い動物として知られている。"),
        AnimalInfo(name: "サイ", description: "頭部に硬い角を持っている。巨体に似合わず最高時速50kmで走る。"),
        AnimalInfo(name: "シマウマ", description: "白黒の縞模様を持つ動物。視覚や嗅覚、聴覚が優れている。"),
        AnimalInfo(name: "キリン", description: "最も背が高い動物。首が長いところが特徴。"),
        AnimalInfo(name: "ゾウ", description: "陸生動物では世界最大の動物。鼻が立っていても地面に届くほどに長い。")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "NameCell")
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
}
