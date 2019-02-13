//
//  CardModel.swift
//  CardIoExample
//
//  Created by Praveenkumar Somu on 12/2/2562 BE.
//  Copyright © 2562 Praveenkumar Somu. All rights reserved.
//

import Foundation

class CardModel {
    var cardNumber:String?
    var cvv:String?
    var expiryDate:String? // MM/YY
    
    init(number:String?,cvvNumber:String?,expiry:String?) {
        cardNumber = number
        cvv = cvvNumber
        expiryDate = expiry
    }
}
