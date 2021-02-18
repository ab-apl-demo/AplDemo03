//
//  MainManuiewController.swift
//  AplDemo03
//
//  Created by Hanida Kanako on 2020/10/19.
//

import Foundation
import UIKit
 
class MainMenuViewController: UIViewController{
    
    @IBOutlet var slideMenuView: UITableView!
    var isExpanded: Bool = false
    @IBAction func touchedButton(_ sender: UIBarItem) {
            isExpanded = !isExpanded
            showMenu(shouldExpand: isExpanded)
        }
    
    // ↓追加 <セクション表示データ>
    let sectionData = ["メインメニュー", "ショップ・イベント情報", "履歴", "設定・その他"]
    // ↓追加　<テーブル表示データ>
    let tableData = [["マイページ", "お知らせ", "メッセージ"],["ショップ情報", "イベント情報"],["購入履歴", "ポイント獲得履歴", "クーポン獲得履歴"],["設定(会員情報変更・退会など)", "よくあるご質問", "お問い合わせ"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slideMenuView.dataSource = self
        slideMenuView.delegate = self
        slideMenuView.tableFooterView = UIView(frame: .zero)
    }
    
    func showMenu(shouldExpand: Bool) {
            if shouldExpand {
                // show menu
                UITableView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    self.slideMenuView.frame.origin.x = 0
                }, completion: nil)
            } else {
                // hide menu
                UITableView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    self.slideMenuView.frame.origin.x = -326
                }, completion: nil)
            }
        }
}

// セクションやセル値を管理する
extension MainMenuViewController: UITableViewDataSource {

    // セクション毎の行数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData[section].count
    }
    
    // ↓追加 セクション数を返す
        func numberOfSections(in tableView: UITableView) -> Int {
            return sectionData.count
        }
    
    // ↓追加 セクションヘッダの高さ
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }

    // 各行に表示するセルを返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuListCell", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.section][indexPath.row]
        // cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
}

// テーブルのイベントを管理する
extension MainMenuViewController: UITableViewDelegate {
    // ↓追加 セクションヘッダを返す
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return sectionData[section]
        }
}
