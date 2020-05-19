//
//  UserInfo.swift
//  MyBMIApp
//
//  Created by 佐藤秀樹 on 2020/05/02.
//  Copyright © 2020年 佐藤秀樹. All rights reserved.
//

import UIKit
import RealmSwift
import RealmSwift

class UserInfo : Object {
    
    @objc dynamic var id:Int = 0
    @objc dynamic var height:String?
    @objc dynamic var weight:String?
    @objc dynamic var bmi:String?
    @objc dynamic var remarks: String?
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func set(height: String?, weight:String?, bmi:String?, remarks:String?) {
        id = newID()
        self.height = height
        self.weight = weight
        self.bmi = bmi
        self.remarks = remarks
    }
    
    func newID() -> Int {
        let realm = try! Realm()
        if let userInfo = realm.objects(UserInfo.self).sorted(byKeyPath: "id").last {
               return userInfo.id + 1
           } else {
               return 0
           }
       }
}
