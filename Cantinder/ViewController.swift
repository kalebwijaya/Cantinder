//
//  ViewController.swift
//  Cantinder
//
//  Created by Kaleb Wijaya on 21/08/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

struct item {
    var imageName : String
}

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items:[item] = [item(imageName: "1"),item(imageName: "2"),item(imageName: "3"),item(imageName: "4")]
    
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    let cellIdentifier = "ItemCollectionViewCell"
    let imageViewSegueIdentifier = "viewImageSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColletionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize() 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! item
        
        if segue.identifier == imageViewSegueIdentifier {
            if let vc = segue.destination as? ImageViewerViewController {
                vc.imageName = item.imageName
            }
        }
    }
    
    private func setupColletionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let numberOfItemRow:CGFloat = 2
            let lineSpacing:CGFloat = 20
            let interItemSpacing:CGFloat = 20
            
            let width = (collectionView.frame.width - (numberOfItemRow - 1) * interItemSpacing) / numberOfItemRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath ) as! ItemCollectionViewCell
        
        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        performSegue(withIdentifier: imageViewSegueIdentifier, sender: item)
    }
}
