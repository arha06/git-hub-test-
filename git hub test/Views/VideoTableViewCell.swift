//
//  VideoTableViewCell.swift
//  git hub test
//
//  Created by Пользователь on 10.11.2020.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbNailImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        self.video = v
        
        // ensure that we have video
        guard self.video != nil else {
            return
        }
        
        // set the title and date label
        self.titleLabel.text = video?.title
        
        // set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d , yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail){
            
            // Set the thumbnail imageView
            self.thumbNailImageView.image = UIImage(data: cacheData)
            return
        }
        
        // downlaod the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // get the shared URL session object
        let session = URLSession.shared
        
        // create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                
                // create the image object
                let image = UIImage(data: data!)
                
                // set the imageView
                DispatchQueue.main.async {
                    self.thumbNailImageView.image = image
                }
            }
        }
        
        // Start data task
        dataTask.resume()
    }
}
