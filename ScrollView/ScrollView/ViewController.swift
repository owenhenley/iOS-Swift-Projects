//
//  ViewController.swift
//  ScrollView
//
//  Created by Owen Henley on 6/21/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images = [UIImageView]()
    var contentWidth: CGFloat = 0.0
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 0...2 {
            let image = UIImage(named:"icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = view.frame.midX + view.frame.size.width * CGFloat(x)
            
            contentWidth += newX
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 100, y: (view.frame.size.height / 2) - 100, width: 200, height: 200)
            scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
            }
        
        }


}

