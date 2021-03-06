//
//  UtxoInfoViewController.swift
//  FullyNoded2
//
//  Created by Peter on 13/02/20.
//  Copyright © 2020 Blockchain Commons, LLC. All rights reserved.
//

import UIKit

class UtxoInfoViewController: UIViewController {
    
    var utxo = [String:Any]()
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isEditable = false
        var text = ""
        for (key, value) in utxo {
            if key != "id" {
                if key == "amount" {
                    text += "\(key): \((value as! Double).avoidNotation)\n\n"
                } else {
                    text += "\(key): \(value)\n\n"
                }
                
            }
        }
        textView.text = text
    }
    
    @IBAction func close(_ sender: Any) {
        
        DispatchQueue.main.async {
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
