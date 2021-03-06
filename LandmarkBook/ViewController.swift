//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Kadir Akyol on 20.06.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var choosenLandmarkName = ""
    var choosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // LandmarkBook DATA
        landmarkNames.append("Colosseum")
        landmarkNames.append("GreatWall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("TajMahal")
        
        
        landmarkImages.append(UIImage(named: "Colosseum")!)
        landmarkImages.append(UIImage(named: "GreatWall")!)
        landmarkImages.append(UIImage(named: "Kremlin")!)
        landmarkImages.append(UIImage(named: "Stonehenge")!)
        landmarkImages.append(UIImage(named: "TajMahal")!)
        
        navigationItem.title = "Landmark Book"
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenLandmarkName = landmarkNames[indexPath.row]
        choosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController"{
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = choosenLandmarkName
            destinationVC.selectedLandmarkImages = choosenLandmarkImage
        }
    }


}

