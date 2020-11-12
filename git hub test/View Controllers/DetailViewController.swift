//
//  DetailViewController.swift
//  git hub test
//
//  Created by Пользователь on 11.11.2020.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextField!
    
    var video: Video?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // check if there is a video
        guard video != nil else {
            return
        }
        
        // Create the embed url
        let EmbedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        // Load it into the webView
        let url = URL(string: EmbedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Set the title
        titleLabel.text = video!.title
        
        // Set the data
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d , yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        // Set the descreption
        textView.text = video!.description
    }
}
