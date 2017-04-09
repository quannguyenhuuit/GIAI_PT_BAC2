//
//  ViewController.swift
//  GIAI PT BAC
//
//  Created by quanmacos on 4/9/17.
//  Copyright © 2017 quanmacos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txta: UITextField!
    @IBOutlet weak var txtb: UITextField!
    @IBOutlet weak var txtc: UITextField!
    @IBOutlet weak var btnketqua: UIButton!
    @IBOutlet weak var lblketqua: UILabel!
    @IBOutlet weak var btnnhaplai: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblketqua.hidden = true
        self.txta.delegate = self
        self.txtb.delegate = self
        self.txtc.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

/* hàm kiểm tra dữ liệu đầu vào chỉ cho phép nhập các số từ 0 đến 9 và dấu "-" và dấu "." và kiểm tra số âm nhập vào đảm bảo chỉ chứa 1 dấu trừ trước ký tự số*/
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        
        let components = string.components(separatedBy: inverseSet)
        
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                }else{
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            }else{
                if string == "-" {
                    if (textField.text!.isEmpty == true){
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
    }
    
    @IBAction func btnketqua(sender: AnyObject) {
        lblketqua.hidden = false
        
        if (txta.text! == "" || txtb.text! == "" || txtc.text! == ""){
            lblketqua.text = "bạn vui lòng nhập đủ 3 số a, b, c"
        }
        else{
            let a: Double = Double(txta.text!)!
            let b: Double = Double(txtb.text!)!
            let c: Double = Double(txtc.text!)!
            
            if (a == 0){
                if (b == 0){
                    if (c == 0){
                        lblketqua.text = "phương trình có nghiệm bất kỳ"
                    }
                    else{
                        lblketqua.text = "phương trình vô nghiệm"
                    }
                }
                else if (c == 0){
                        lblketqua.text = "phương trình có nghiệm x = 0"
                }
                else{
                    lblketqua.text = "phương trình có nghiệm x = \(-c/b)"
                }
            }
            else{
                let delta = ((b*b)-(4*a*c))
                if (delta < 0){
                    lblketqua.text = "phương trình vô nghiệm"
                }
                else if (delta == 0){
                    let x = (-b)/(2*a)
                    lblketqua.text = "phương trình có nghiệm x = \(x)"
                }
                else{
                    let x1 = (-b + sqrt(delta))/(2*a)
                    let x2 = (-b - sqrt(delta))/(2*a)
                    lblketqua.text = "phương trình có 2 nghiệm x1 = \(x1) và x2 = \(x2)"
                }
            }
        }
    }

    @IBAction func btnnhaplai(sender: AnyObject) {
        txta.text = ""
        txtb.text = ""
        txtc.text = ""
        lblketqua.hidden = true
    }
}