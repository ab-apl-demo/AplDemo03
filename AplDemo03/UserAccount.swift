//
//  UserAccount.swift
//  AplDemo03
//
//  Created by Hanida Kanako on 2020/12/22.
//

import Foundation
import UIKit
 
class UserAccount: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    //@IBOutlet var label: UILabel!
        
        @IBOutlet var pickerView: UIPickerView!
        
        let dataList = [
            "男性","女性"
        ]
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Delegate設定
            pickerView.delegate = self
            pickerView.dataSource = self
            
            //label.text = "サンプル"
            
        }
        
        // UIPickerViewの列の数
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        // UIPickerViewの行数、リストの数
        func pickerView(_ pickerView: UIPickerView,
                        numberOfRowsInComponent component: Int) -> Int {
            return dataList.count
        }
        
        // UIPickerViewの最初の表示
        func pickerView(_ pickerView: UIPickerView,
                        titleForRow row: Int,
                        forComponent component: Int) -> String? {
            
            return dataList[row]
        }
        
        // UIPickerViewのRowが選択された時の挙動
        func pickerView(_ pickerView: UIPickerView,
                        didSelectRow row: Int,
                        inComponent component: Int) {
            
            //label.text = dataList[row]
            
        }
    
}
