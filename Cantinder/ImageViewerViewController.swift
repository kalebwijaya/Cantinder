//
//  ImageViewerViewController.swift
//  Cantinder
//
//  Created by Kaleb Wijaya on 21/08/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    
    var imageName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        // Do any additional setup after loading the view.
    }
    
    private func setupImageView(){
        guard let name = imageName else {return}
        
        if let image = UIImage(named: name){
            profileImage.image = image
            profileImage.layer.cornerRadius = 10
        }
    }
    

}
