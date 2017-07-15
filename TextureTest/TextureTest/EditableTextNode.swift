//
//  EditableTextNode.swift
//  TextureTest
//
//  Created by Jeffrey Davis on 7/14/17.
//  Copyright © 2017 Mombo Labs. All rights reserved.
//

import AsyncDisplayKit

// Set this to `true` to work around the bug.
let ENABLE_WORKAROUND = false

class EditableTextNode: ASEditableTextNode {
  var indexPath: IndexPath = IndexPath(item: -1, section: -1)

  public override func calculateSizeThatFits(_ constrainedSize: CGSize) -> CGSize {

    if ENABLE_WORKAROUND {
      if Thread.isMainThread && isNodeLoaded {
        let size = CGSize(width: constrainedSize.width, height: 80)
        NSLog("indexPath: \(indexPath.item), isMainThread: \(Thread.isMainThread ? "yes" : "no"), size: \(size)")
        return size
      }
    } else {
      if Thread.isMainThread {
        let size = CGSize(width: constrainedSize.width, height: 80)
        NSLog("indexPath: \(indexPath.item), isMainThread: \(Thread.isMainThread ? "yes" : "no"), size: \(size)")
        return size
      }
    }

    let size = CGSize(width: constrainedSize.width, height: 30)
    NSLog("indexPath: \(indexPath.item), isMainThread: \(Thread.isMainThread ? "yes" : "no"), size: \(size)")
    return size
  }

  public override func didLoad() {
    super.didLoad()
    setNeedsLayout()
  }
}

class Cell: ASCellNode {
  let textNode: EditableTextNode

  let text = "I had a job in the great north woods / Working as a cook for a spell / But I never did like it all that much / And one day the axe just fell"

  init(indexPath: IndexPath) {
    self.textNode = EditableTextNode()

    super.init()

    backgroundColor = .orange

    textNode.attributedText = NSAttributedString(string: text, attributes: [
      NSFontAttributeName: UIFont.systemFont(ofSize: 20),
      NSForegroundColorAttributeName: UIColor.white
    ])
    textNode.indexPath = indexPath

    automaticallyManagesSubnodes = true
  }

  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASStaticLayoutSpec(sizing: .sizeToFit, children: [textNode])
  }
}
