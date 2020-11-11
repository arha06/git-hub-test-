//
//  ViewController.swift
//  git hub test
//
//  Created by Пользователь on 02.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    @IBOutlet weak var tabelView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set itself as the data source and the delegate
        tabelView.dataSource = self
        tabelView.delegate = self
        
        // set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos()

    }
    
    // MARK: - Model Delegate Methods
    func videoFetched(_ videos: [Video]) {
        
        // set the returned videos to our video proprety
        self.videos = videos
        
        // Refresh the tableView
        tabelView.reloadData()
    }
    
    
    // MARK: - TableView MOTHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // configure the cell with data
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        // return the cell
        return cell
    }
    
}

