//
//  ViewController.swift
//  jisuanji
//
//  Created by 陈德爵 on 2017/6/14.
//  Copyright © 2017年 jisuanji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lb = UILabel()
    var bt = UIButton()
    var numA = 0.00
    var numB = 0.00
    var numC = 0.00
    var ysf = ""
    
    
    @IBAction func BtnAc(_ sender: UIButton) {
  
        
        var input = ""

        
        if (lb.text?.isEmpty)! || lb.text == "计算结果" {
            lb.text = "0"
        }

        
        
        switch sender.tag {
        case 10:
            //如果是0,则直接显示0,否则就连接在lb后面
            
            input = "0"
            
            break
        case 11:
            //这是小数点
            if !(lb.text?.contains("."))! {
                input = "."
            }
            break
        case 12:
            //清空输入的
            lb.text = "计算结果"
            break
        case 13:
            //取反
            input = "-"
            break
        case 14:
            input = lb.text!
            break
        case 15:
            //除法,做运算的时候,先保存一个变量
            numA = Double(lb.text!)!
            ysf = "/"
            lb.text = "0"
            break
        case 16:
            numA = Double(lb.text!)!
            ysf = "x"
            lb.text = "0"
            break
        case 17:
            numA = Double(lb.text!)!
            ysf = "-"
            lb.text = "0"
            break
        case 18:
            numA = Double(lb.text!)!
            ysf = "+"
            lb.text = "0"
            break
        case 19:
            numB = Double(lb.text!)!
            ys()
            break
        default:
            input = (sender.titleLabel?.text)!
            break
        }
        
        
        if sender.tag < 15 {
 
        if lb.text != "0" {
            if sender.tag == 13  {
                lb.text = input + lb.text!
            }else if(sender.tag == 14){
                let inputDouble = Double(input)! / 100.00
                
                lb.text = String(inputDouble)
                
            }else{
                lb.text = lb.text! + input

            }
            
            
        }else{
            if sender.tag == 11 {
                lb.text = "0" + input
            }else{
                lb.text = input

            }
            
            
        }
            
        }
        
        
    }
    
    
    //做除法运算
    
    func ys(){
        
        switch self.ysf {
        case "+":
            self.numC = self.numA  + self.numB
            break
        case "-":
            self.numC = self.numA  - self.numB
            break
        case "x":
            self.numC = self.numA  * self.numB
            break
        case "/":
            self.numC = self.numA  / self.numB
            break
        default:
            self.lb.text = "计算结果"
            break
        }
        if !((self.ysf).isEmpty) {
            var result = String(self.numC)
            //看看小数点最后的两位数是不是0如果是,则去掉
            result = DelZore(r: result)
            self.lb.text = result
        }
        
        
    }
    
    
    //去掉字符串的00
    func DelZore(r:String)-> String{
        
        var r = r
        
        let lastStr = r[r.index(r.endIndex, offsetBy: -1)] //获取最后一个字符
        
    
        if lastStr == "0"{
            
            r.remove(at: r.index(r.endIndex, offsetBy: -1))
            
           return DelZore(r: r)
        }else if lastStr == "." {
            r.remove(at: r.index(r.endIndex, offsetBy: -1))
            
        }

        
        
        return r
        
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lb = view.viewWithTag(100) as! UILabel
        
        
        
    
        
       // bt = super.view.viewWithTag(10) as! UIButton
      //  lb = view.viewWithTag(100) as! UILabel
        
        
        
        
        
        bt.addTarget(self,
                     
                     action: #selector(BtPress), for: UIControlEvents.touchUpInside)
        
       // if bt1.isTouchInside {
          //  print(0)
       // }
        
    //    BtnOBT.layer.borderWidth = 1.0
      //  BtnOBT.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    func BtPress()  {

        lb.text = bt.titleLabel?.text
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

