//
//  ViewController.swift
//  git hub test
//
//  Created by Пользователь on 02.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        model.getVideos()

    }


}

