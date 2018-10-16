//
//  ViewController.swift
//  Youtube
//
//  Created by Vlad Shchuka on 10/16/18.
//  Copyright © 2018 Vlad Shchuka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let videosProvider = VideoInfoProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        videosProvider.fetchVideos(by: "Some", with: {
            
        }) {
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

