//
//  ViewController.swift
//  testApp
//
//  Created by Haruka Ono on 2015/04/20.
//  Copyright (c) 2015年 maximum80. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let divineButton: UIButton = UIButton()
    
    let resultLabel: UILabel = UILabel()
    
    let LuckyLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
    
    let charmLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))

    let status: [(weight:Int, fortune:String, color:UIColor)] =
        [(0,"大吉", UIColor.redColor()), (3,"中吉", UIColor.yellowColor()),
         (9,"小吉", UIColor.greenColor()), (14,"吉", UIColor.orangeColor()),
         (17,"凶", UIColor.grayColor()), (18,"大凶", UIColor.blueColor())
        ]
    // weightは重みをつけるための値
    
    let LuckyCharm : [String] = ["ピンクの小物","テニスラケット","ぬいぐるみ","青の財布","赤い靴","黒い傘","緑の髪留め","指輪","トライアングル","リップクリーム","黄色いメモ帳","漫画","ゲーム機","パワーストーン","招き猫","ミサンガ","四葉のクローバー","天使"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        titleLabel.backgroundColor = UIColor.blueColor() //変更
        titleLabel.text = "あなたの運勢は．．．"
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.layer.position = CGPoint(x: self.view.bounds.width / 2, y: 200)
        self.view.addSubview(titleLabel)
        
        resultLabel.frame = CGRectMake(0,0,200,80)
        resultLabel.layer.borderColor = UIColor.blackColor().CGColor
        resultLabel.layer.borderWidth = 2.0
        resultLabel.layer.cornerRadius = 30
        
        resultLabel.text = "????"
        resultLabel.textAlignment = NSTextAlignment.Center
        resultLabel.font = UIFont.boldSystemFontOfSize(64)
        resultLabel.layer.position = CGPoint(x: self.view.bounds.width / 2, y: 300)
        self.view.addSubview(resultLabel)
        
        divineButton.frame = CGRectMake(0,0,200,40)
        divineButton.backgroundColor = UIColor.redColor()
        divineButton.layer.masksToBounds = true
        
        LuckyLabel.text = "ラッキーアイテム"
        LuckyLabel.textAlignment = NSTextAlignment.Center
        LuckyLabel.layer.position = CGPoint(x: self.view.bounds.width / 2, y: 380)
        self.view.addSubview(LuckyLabel)


        charmLabel.text = "????"
        charmLabel.textAlignment = NSTextAlignment.Center
        charmLabel.layer.position = CGPoint(x: self.view.bounds.width / 2, y: 400)
        self.view.addSubview(charmLabel)
        
        
        divineButton.setTitle("運勢を占う", forState: UIControlState.Normal)
        divineButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        
        divineButton.layer.cornerRadius = 10.0
        divineButton.layer.position = CGPoint(x: self.view.frame.width / 2,y : 450)
        divineButton.tag = 1
        divineButton.addTarget(self, action: "onClickDivineButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(divineButton)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onClickDivineButton(sender: UIButton) {
        let random = Int(arc4random_uniform(UInt32(status[status.count-1].weight + 1)))
        
        var i = 0
        while i<status.count && random-status[i].weight>0 {
            i++
        }
        resultLabel.textColor = status[i].color
        resultLabel.text = status[i].fortune + String(random)
        charmLabel.text = LuckyCharm[i]
    }
}



