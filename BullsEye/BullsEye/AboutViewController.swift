//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Owen Henley on 5/12/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL (fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
        
    }
}
