//
//  ViewController.swift
//  PhotoViewer
//
//  Created by Yutaka Okubo on 2019/01/03.
//  Copyright © 2019 Yutaka Okubo. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var photos: [PHAsset] = []
    let manager = PHImageManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        PHPhotoLibrary.requestAuthorization { status in
            if (status == .authorized) {
                self.loadPhotos()
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        let asset = photos[indexPath.item]
        let width = collectionView.bounds.size.width / 3
        manager.requestImage(
            for: asset,
            targetSize: CGSize(width: width, height: width),
            contentMode: .aspectFill,
            options: nil,
            resultHandler: { result, info in
                if let image = result {
                    let imageView =  cell.viewWithTag(1) as! UIImageView
                    imageView.image = image
                }
        })
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width / 3
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func loadPhotos() {
        let result = PHAsset.fetchAssets(with: .image, options: nil)
        let indexSet = IndexSet(integersIn: 0...result.count - 1)
        photos = result.objects(at: indexSet)
        DispatchQueue.main.sync {
            collectionView.reloadData()
        }
    }
}
