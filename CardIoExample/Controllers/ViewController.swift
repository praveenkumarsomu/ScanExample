//
//  ViewController.swift
//  CardIoExample
//
//  Created by Praveenkumar Somu on 12/2/2562 BE.
//  Copyright © 2562 Praveenkumar Somu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CardIOUtilities.preloadCardIO()
    }
    
    @IBAction func scanCard(_ sender: UIButton) {
        let scanVC = CardIOPaymentViewController(paymentDelegate: self)!
        scanVC.scanExpiry = true
        scanVC.collectCVV = true
        present(scanVC, animated: true, completion: nil)
    }
}

extension ViewController:CardIOPaymentViewControllerDelegate{
    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
        print("Received card info. Number:\(cardInfo.redactedCardNumber ?? ""), expiry: \(cardInfo.expiryMonth )/\(cardInfo.expiryYear ), cvv: \(cardInfo.cvv ?? "")")
        paymentViewController.dismiss(animated: true, completion: nil)
        let cardDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cardDetailsVC") as! CardDetailsViewController
        let cardModel = CardModel(number: cardInfo.redactedCardNumber, cvvNumber: cardInfo.cvv, expiry:"\(cardInfo.expiryMonth )/\(cardInfo.expiryYear)")
        cardDetailsVC.cardModel = cardModel
        navigationController?.pushViewController(cardDetailsVC, animated: true)
    }
    
    
}

