//
//  HistoryViewController.swift
//  MyBMIApp
//
//  Created by 佐藤秀樹 on 2020/04/12.
//  Copyright © 2020年 佐藤秀樹. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let TAG = "HistoryViewController"

    var tableView: UITableView!

    private var array : [UserInfo] = []

    override func viewDidLoad() {
        print(TAG + " " +  #function)
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HistoryItem", bundle: nil), forCellReuseIdentifier: "HistoryItem")
        self.navigationItem.title = "履歴"
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(TAG + " " +  #function)
        let realm = try! Realm()
        array.removeAll()
        for user in realm.objects(UserInfo.self) {
            array.append(user)
        }
        tableView.reloadData()
    }
    
//    // テーブル内のセクション数を決めるメソッド
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }

    // セクション内のセル数を決めるメソッド・・・★必須
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    // セルのインスタンスを生成するメソッド・・・★必須
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryItem") as? HistoryItem {
            let userInfo = array[indexPath.row]
            cell.contentsLabel.text =  "身長：\(userInfo.height ?? "??") 体重：\(userInfo.weight  ?? "??") BMI：\(userInfo.bmi ?? "??")"
             return cell
         }
         return UITableViewCell()
    }

    // セルの高さを決めるメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }

    // セクションのタイトルを設定するメソッド
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "第\(section)セクション"
    }

    // セクションの高さを設定するメソッド
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
}
