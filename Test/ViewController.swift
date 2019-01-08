//
//  ViewController.swift
//  Test
//
//  Created by Daniel Podaru on 07/01/2019.
//  Copyright © 2019 Daniel Podaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        let vc = FullArticleCollectionViewController.init(collectionViewLayout: UICollectionViewFlowLayout())
        present(vc, animated: true, completion: nil)
    }

}

