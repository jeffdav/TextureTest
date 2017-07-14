//
//  ViewController.swift
//  TextureTest
//
//  Created by Jeffrey Davis on 7/14/17.
//  Copyright © 2017 Mombo Labs. All rights reserved.
//

import AsyncDisplayKit
import UIKit

class ViewController: ASViewController<ASCollectionNode>, ASCollectionDataSource {
  init() {
    let layout = UICollectionViewFlowLayout()
    let collectionNode = ASCollectionNode(collectionViewLayout: layout)

    super.init(node: collectionNode)

    collectionNode.dataSource = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
    return 32
  }

  func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
    return {
      return Cell(indexPath: indexPath)
    }
  }
}
