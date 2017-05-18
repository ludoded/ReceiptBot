//
//  ZoomScrollViewController.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 5/18/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit
import Kingfisher

final class ZoomScrollViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = url else { return }
        let resource = ImageResource(downloadURL: url)
        imageView.kf.setImage(with: resource)
    }
}

extension ZoomScrollViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
