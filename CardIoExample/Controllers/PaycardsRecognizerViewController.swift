//
//  PaycardsRecognizerViewController.swift
//  CardIoExample
//
//  Created by Praveenkumar Somu on 12/2/2562 BE.
//  Copyright © 2562 Praveenkumar Somu. All rights reserved.
//

import UIKit
import PayCardsRecognizer

class PaycardsRecognizerViewController: UIViewController,PayCardsRecognizerPlatformDelegate {
    var recognizer: PayCardsRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        recognizer = PayCardsRecognizer(delegate: self, resultMode: .async, container: view, frameColor: .green)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recognizer.startCamera()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        recognizer.stopCamera()
    }
    
    func payCardsRecognizer(_ payCardsRecognizer: PayCardsRecognizer, didRecognize result: PayCardsRecognizerResult) {
        print(result)
        print(result.dictionary as NSDictionary)
        if result.isCompleted {
            let cardDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cardDetailsVC") as! CardDetailsViewController
            let cardModel = CardModel(number: result.recognizedNumber, cvvNumber: "", expiry:"\(result.recognizedExpireDateMonth ?? "00")/\(result.recognizedExpireDateYear ?? "00")")
            cardDetailsVC.cardModel = cardModel
            navigationController?.pushViewController(cardDetailsVC, animated: true)
        }
    }

}
