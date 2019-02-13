//
//  ScanCardViewController.swift
//  CardIoExample
//
//  Created by Praveenkumar Somu on 12/2/2562 BE.
//  Copyright © 2562 Praveenkumar Somu. All rights reserved.
//

import UIKit

class ScanCardViewController: UIViewController {
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var scanView: CardIOView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if !CardIOUtilities.canReadCardWithCamera() {
            // Hide your "Scan Card" button, or take other appropriate action...
            cardLabel.text = "Cannot scan card"
        }
        scanView.delegate = self
        scanView.scanExpiry = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CardIOUtilities.preloadCardIO()
    }

}

extension ScanCardViewController:CardIOViewDelegate{
    func cardIOView(_ cardIOView: CardIOView!, didScanCard cardInfo: CardIOCreditCardInfo!) {
        cardLabel.text = "Scan card successful"
        print("Received card info. Number:\(cardInfo.redactedCardNumber ?? ""), expiry: \(cardInfo.expiryMonth )/\(cardInfo.expiryYear ), cvv: \(cardInfo.cvv ?? "")")
        let cardDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cardDetailsVC") as! CardDetailsViewController
        let cardModel = CardModel(number: cardInfo.redactedCardNumber, cvvNumber: cardInfo.cvv, expiry:"\(cardInfo.expiryMonth )/\(cardInfo.expiryYear)")
        cardDetailsVC.cardModel = cardModel
        navigationController?.pushViewController(cardDetailsVC, animated: true)
    }

}
