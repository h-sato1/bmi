//
//  InputView.swift
//  MyBMIApp
//
//  Created by 佐藤秀樹 on 2020/04/13.
//  Copyright © 2020年 佐藤秀樹. All rights reserved.
//

import UIKit

protocol InputViewDelegate {
    func onClickDeleteButton()
    func onClickSaveButton(userInfo: UserInfo)
}

class InputView: UIView, UITextFieldDelegate {
    
    let TAG = "InputView"
    
    var delegate: InputViewDelegate? = nil
    var userInfo: UserInfo?
    
    @IBOutlet weak var preMessage: UILabel!
    @IBOutlet weak var postMessage: UILabel!
    @IBOutlet weak var bmiResult: UILabel!

    @IBOutlet weak var textFieldOfHeight: UITextField!
    @IBOutlet weak var textFieldOfWeight: UITextField!
    @IBOutlet weak var textFieldOfRemarks: UITextField!
    
    // nibからの読み込みが完全に終わった時に呼び出される。初期化処理を行う
    override func awakeFromNib() {
        super.awakeFromNib()
        print(TAG + " " +  #function)
        hideResult()
        initUITextField()
    }
    
    // キーボード制御
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 枠外を押したらキーボードが閉じるようにする
        textFieldOfHeight.endEditing(true)
        textFieldOfWeight.endEditing(true)
        textFieldOfRemarks.endEditing(true)
    }
    
    // キーボード制御
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // returnを押したらキーボードが閉じるようにする
        return true
    }
    
    func instantiateFromNib() -> InputView {
        print(TAG + " " +  #function)
        let nib = UINib(nibName: "InputView", bundle: Bundle(for: type(of: self)))
        return nib.instantiate(withOwner: self, options: nil).first as! InputView
    }
    
    func showResult() {
        preMessage.isHidden = false
        postMessage.isHidden = false
        bmiResult.isHidden = false
        bmiResult.text = getBmi()
    }
    
    func getBmi() -> String {
        if(textFieldOfHeight.text!.isEmpty)  {
            return "???"
        }
        if(textFieldOfWeight.text!.isEmpty) {
            return "???"
        }
        let height = Double(textFieldOfHeight.text!)! / 100
        let weight = Double(textFieldOfWeight.text!)!
        return String(weight / (height * height))
    }
    
    func hideResult() {
        preMessage.isHidden = true
        postMessage.isHidden = true
        bmiResult.isHidden = true
    }
    
    func initUITextField() {
        textFieldOfHeight.keyboardType = UIKeyboardType.decimalPad
        textFieldOfWeight.keyboardType = UIKeyboardType.decimalPad
    }
    
    func setUserInfo() {
        let height = textFieldOfHeight.text
        let weight = textFieldOfWeight.text
        let bmi = bmiResult.text
        let remarks = textFieldOfRemarks.text
        userInfo = UserInfo()
        userInfo?.set(height: height, weight: weight, bmi: bmi, remarks: remarks)
    }
    
    @IBAction func onClickBmiButton(_ sender: UIButton) {
        print(TAG + " " +  #function)
        showResult()
    }
    
    @IBAction func onClickDeleteButton(_ sender: UIButton) {
        print(TAG + " " +  #function)
        self.delegate?.onClickDeleteButton()
    }
    
    @IBAction func onClickSaveButton(_ sender: Any) {
        print(TAG + " " +  #function)
        setUserInfo()
        self.delegate?.onClickSaveButton(userInfo: userInfo!)
    }
}
