//
//  DetailViewController.swift
//  MovieViewer
//
//  Created by Stefany Felicia on 3/2/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var infoView: UIView!
    
    var movie: NSDictionary!
    var refreshControl: UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self,action: nil)
        let segmentedControl = UISegmentedControl(items: ["Like", "Dislike"])
        segmentedControl.sizeToFit()
       // let segmentedButton = UIBarButtonItem(customView: segmentedControl)
        navigationItem.rightBarButtonItems = [saveButton]
        self.navigationItem.title = "Details"
      //  self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Other Movies", style: .plain, target: nil, action: nil)
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        
        let title = movie["title"] as? String
        titleLabel.text = title
        
      // let baseUrl = "https://image.tmdb.org/t/p/w500"
        let lowUrl = "https://image.tmdb.org/t/p/w45"
        let highUrl = "https://image.tmdb.org/t/p/original"
    
        UIView.animate(withDuration: 0.3, animations: {
            self.posterImageView.alpha = 0.0
            if let posterPath = self.movie["poster_path"] as? String{
                let imageUrl = NSURL(string: lowUrl + posterPath)
                self.posterImageView.setImageWith(imageUrl as! URL)
            }

        }, completion:{ _ in
            self.posterImageView.alpha = 1.0
            if let posterPath = self.movie["poster_path"] as? String{
                let imageUrl = NSURL(string: highUrl + posterPath)
                self.posterImageView.setImageWith(imageUrl as! URL)
            }
            
        })
        
        let overview = movie["overview"] as! String
        overviewLabel.text = overview
        
        overviewLabel.sizeToFit()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
