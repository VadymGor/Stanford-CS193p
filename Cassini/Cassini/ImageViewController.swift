//
//  ImageViewController.swift
//  Cassini
//
//  Created by Vadym Horovyi on 25/04/2020.
//  Copyright © 2020 Vadym Horovyi. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    var imageURL: URL? {
        didSet {
            imageView.image = nil
            if view.window != nil {     // we're on Screen!!
                fetchImage()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }
    
}

//    var imageURL: URL? {
//        didSet {
//            image = nil
//            if view.window != nil {     // we're on Screen!!
//                fetchImage()
//            }
//        }
//    }
//
//    private var image: UIImage? {
//            get {
//                return imageView.image
//            }
//            set {
//                imageView.image = newValue
//                imageView.sizeToFit()
//                scrollView.contentSize = imageView.frame.size
//            }
//        }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        if imageView.image == nil {
//            fetchImage()
//        }
//    }
//
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//              return imageView
//          }
//
//     @IBOutlet weak var scrollView: UIScrollView! {
//            didSet {
//                scrollView.minimumZoomScale = 1/25
//                scrollView.maximumZoomScale = 1.0
//                scrollView.delegate = self
//                scrollView.addSubview(imageView)
//            }
//        }
//
//        var imageView = UIImageView()
//
//    private func fetchImage() {
//        if let url = imageURL {
//            let urlContents = try? Data(contentsOf: url)
//            if let imageData = urlContents {
//                image = UIImage(data: imageData)
//            }
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if imageURL == nil {
//            imageURL = DemoURLs.stanford
//        }
//    }
//}
