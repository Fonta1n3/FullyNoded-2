//
//  IsFN2SecureViewController.swift
//  FullyNoded2
//
//  Created by Peter on 25/03/20.
//  Copyright © 2020 Blockchain Commons, LLC. All rights reserved.
//

import UIKit

class IsFN2SecureViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate {

    @IBOutlet var textView: UITextView!
    @IBOutlet var nextOutlet: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    let torLink = "https://www.torproject.org"
    let hiddenServiceLink = "https://blog.torproject.org/tors-fall-harvest-next-generation-onion-services"
    let authLink = "https://matt.traudt.xyz/p/FgbdRTFr.html"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.delegate = self
        setTitleView()
        nextOutlet.layer.cornerRadius = 8
        titleLabel.adjustsFontSizeToFitWidth = true
        textView.delegate = self
        
        textView.text = TextBlurbs.isFN2SecureText()
        
        textView.addHyperLinksToText(originalText: textView.text, hyperLinks: ["Tor": torLink, "V3 hidden service": hiddenServiceLink, "Tor V3 authentication": authLink])
        
    }
    
    private func setTitleView() {
        
        let imageView = UIImageView(image: UIImage(named: "1024.jpg"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.frame = titleView.bounds
        imageView.isUserInteractionEnabled = true
        titleView.addSubview(imageView)
        self.navigationItem.titleView = titleView
        
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if (URL.absoluteString == torLink) || (URL.absoluteString == hiddenServiceLink) || (URL.absoluteString == authLink) {
            UIApplication.shared.open(URL) { (Bool) in

            }
        }
        return false
    }
    
    @IBAction func nextAction(_ sender: Any) {
        
        DispatchQueue.main.async {
            
            self.performSegue(withIdentifier: "next5", sender: self)
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
