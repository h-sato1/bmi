//
//  InputViewController.swift
//  MyBMIApp
//
//  Created by 佐藤秀樹 on 2020/04/12.
//  Copyright © 2020年 佐藤秀樹. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class EditViewController: UIViewController, InputViewDelegate {
    
    let TAG = "EditViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(TAG + " " +  #function)
        
        self.navigationItem.title = "入力"
        self.view.backgroundColor = UIColor.white
        let inputView = InputView().instantiateFromNib()
        inputView.delegate = self
//        inputView.center = self.view.center
        inputView.frame = self.view.frame
        self.view.addSubview(inputView)
    }
    
    func onClickDeleteButton() {
        print(TAG + " " +  #function)
        let dialog = UIAlertController(title: "本当に削除しますか?", message: nil, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        dialog.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(dialog, animated: true, completion: nil)
    }

    
    func onClickSaveButton(userInfo: UserInfo) {
        print(TAG + " " +  #function)
        let dialog = UIAlertController(title: "本当に保存しますか?", message: nil, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            self.saveUserInfo(userInfo: userInfo)
            self.showHistory()
        }))
        dialog.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(dialog, animated: true, completion: nil)
    }
    
    func saveUserInfo(userInfo: UserInfo) {
        // Realmで保存
        let realm = try! Realm()
        try! realm.write {
            realm.add(userInfo)
        }
    }
    
    // 一覧画面を表示する
    func showHistory() {
        print(TAG + " " +  #function)
        let historyViewController = tabBarController?.viewControllers?[1] as? UINavigationController;
        tabBarController?.selectedViewController = historyViewController;
    }
    
    func serialize(_ obj: NSObject) -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: obj)
    }

}
