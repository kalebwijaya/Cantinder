//
//  ItemCollectionViewCell.swift
//  Cantinder
//
//  Created by Kaleb Wijaya on 21/08/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView! 

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 5
        // Initialization code
    }

}
