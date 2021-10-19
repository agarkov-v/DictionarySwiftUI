//
//  SwiftUICollectionViewCell.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.10.2021.
//

import SwiftUI

/// Subclass for embedding a SwiftUI View inside of UICollectionViewCell
/// Usage: `class MySwiftUICell: SwiftUICollectionViewCell<Card> { ... }`
open class SwiftUICollectionViewCell<Content>: UICollectionViewCell where Content: View {
    
    /// Controller to host the SwiftUI View
    private(set) var host: UIHostingController<Content>?
    
    /// Add host controller to the heirarchy
    func embed(in parent: UIViewController, withView content: Content) {
        if let host = self.host {
            host.rootView = content
            host.view.invalidateIntrinsicContentSize()
            host.view.layoutIfNeeded()
        } else {
            let host = UIHostingController(rootView: content)
            
            parent.addChild(host)
            host.didMove(toParent: parent)
            contentView.addSubview(host.view)
            self.host = host
        }
    }
    
    // MARK: Controller + view clean up
    
    deinit {
        host?.willMove(toParent: nil)
        host?.view.removeFromSuperview()
        host?.removeFromParent()
        host = nil
    }
}
