//
//  CardDetailsViewController.swift
//  CardIoExample
//
//  Created by Praveenkumar Somu on 12/2/2562 BE.
//  Copyright © 2562 Praveenkumar Somu. All rights reserved.
//

import UIKit

class CardDetailsViewController: UIViewController {
    
    @IBOutlet weak var cardnumberField: UITextField!
    @IBOutlet weak var expirydateField: UITextField!
    @IBOutlet weak var cvvField: UITextField!
    
    var cardModel:CardModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    func fillData(){
        cardnumberField.text = cardModel?.cardNumber
        cvvField.text = cardModel?.cvv
        expirydateField.text = cardModel?.expiryDate
    }

}

extension CardDetailsViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
