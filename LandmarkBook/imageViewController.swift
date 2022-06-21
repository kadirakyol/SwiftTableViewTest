//
//  imageViewController.swift
//  LandmarkBook
//
//  Created by Kadir Akyol on 21.06.2022.
//

import UIKit

class imageViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImages = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImages
        
        
        
    }
    

    

}
