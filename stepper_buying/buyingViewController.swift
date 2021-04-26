//
//  buyingViewController.swift
//  stepper_buying
//
//  Created by yousun on 2021/4/24.
//

import UIKit

// 設定所有數值
var swordofFire = 0
var sword = 0
var spear = 0
var bow = 0
var shield = 0
var potion = 0

var sum = 0
var myMoney = 99999

class buyingViewController: UIViewController {

    
    @IBOutlet weak var swordofFireStepper: UIStepper!
    @IBOutlet weak var swordStepper: UIStepper!
    @IBOutlet weak var spearStepper: UIStepper!
    @IBOutlet weak var bowStepper: UIStepper!
    @IBOutlet weak var shieldStepper: UIStepper!
    @IBOutlet weak var potionStepper: UIStepper!
    
    
    @IBOutlet weak var swordofFireLabel: UILabel!
    @IBOutlet weak var swordLabel: UILabel!
    @IBOutlet weak var spearLabel: UILabel!
    @IBOutlet weak var bowLabel: UILabel!
    @IBOutlet weak var shieldLabel: UILabel!
    @IBOutlet weak var potionLabel: UILabel!
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var myMoneyLabel: UILabel!
    
    
    // function 計算總價並回傳
    func total() -> Int {
        
        let sum = (swordofFire * 500) + (sword * 300) + (spear * 400) + (bow * 200) + (shield * 600) + (potion * 100)
        
        // 把數字變成金錢格式
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        formatter.numberStyle = .currency
        totalLabel.text = formatter.string(from: NSNumber(value: sum))
        
        return sum
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // 把所有的 stepper 拉在同一個 IBAction
    @IBAction func changeStepper(_ sender: UIStepper) {
        
        swordofFire = Int(swordofFireStepper.value)
        swordofFireLabel.text = "\(swordofFire)"
    
        sword = Int(swordStepper.value)
        swordLabel.text = "\(sword)"
        
        spear = Int(spearStepper.value)
        spearLabel.text = "\(spear)"
        
        bow = Int(bowStepper.value)
        bowLabel.text = "\(bow)"
        
        shield = Int(shieldStepper.value)
        shieldLabel.text = "\(shield)"
        
        potion = Int(potionStepper.value)
        potionLabel.text = "\(potion)"
        
        // 計算完的總價設定給 sum
        sum = total()
    }

    
    // 買，自己的錢要扣掉商品總價
    @IBAction func buyButton(_ sender: Any) {
        
        myMoney -= sum
        
        // 把數字變成金錢格式
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        formatter.numberStyle = .currency
        myMoneyLabel.text = formatter.string(from: NSNumber(value: myMoney))
    }
    
    
    // 不買，要清空所有數值，包含 sum
    @IBAction func notBuyButton(_ sender: Any) {
        
        swordofFireStepper.value = 0
        swordStepper.value = 0
        spearStepper.value = 0
        bowStepper.value = 0
        shieldStepper.value = 0
        potionStepper.value = 0
        
        swordofFireLabel.text = "0"
        swordLabel.text = "0"
        spearLabel.text = "0"
        bowLabel.text = "0"
        shieldLabel.text = "0"
        potionLabel.text = "0"
        
        totalLabel.text = "0"
        
        sum = 0
    }
}
