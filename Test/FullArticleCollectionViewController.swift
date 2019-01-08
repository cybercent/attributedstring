//
//  FullArticleCollectionViewController.swift
//  Test
//
//  Created by Daniel Podaru on 07/01/2019.
//  Copyright © 2019 Daniel Podaru. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FullArticleCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(FullArticleHeadlineCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: view.bounds.size.width, height: 300)
            layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 60)
        }

        collectionView.backgroundColor = .white
        view.backgroundColor = .white
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        if let cell = cell as? FullArticleHeadlineCollectionViewCell {
           cell.update(with: URL(string: "https://via.placeholder.com/375x290")!,
                       title: "<p>Best photo ever. 😊 #oscars https://pic.twitter.com/C9U5NOtGap<br>Check this <a href=\"https://github.com/psharanda/Atributika\">link</a></p>",
                       headline: "headline")
        }
    
        return cell
    }

}
