//
//  ViewController.swift
//  LandmarkBook
//
//  Created by cem bayat on 17.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    // landmark isimleri ve görselleri için 2 ayrı dizi oluşturduk
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // delegate ve datasource u viewcontroller a eşitliyoruz
        tableView.delegate = self
        tableView.dataSource = self
        
        // landmark isimlerini dizi içine aktardık
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        
        // landmark fotoğraflarını dizi içine aktardık
        landmarkImages.append(UIImage(named: "colosseum.jpeg")!)
        landmarkImages.append(UIImage(named: "greatwall.jpeg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpeg")!)
        landmarkImages.append(UIImage(named: "stonehenge.jpeg")!)
        landmarkImages.append(UIImage(named: "tajmahal.jpeg")!)
        
        // navigasyon bar'a başlık ekleme
        navigationItem.title = "Landmark Book"

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        
        
    }
    
    
    // bu iki fonksiyon olmadan table viewi kullanamayız
    
    //her bir sıra içinde göstereceğimiz şey ne olacak
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //10 sıranın içinde ne olacak? bunlar olacak
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    //table viewde kaç sıra olacak
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //10 sıra olacak
        return landmarkNames.count
    }
    
    //seçilince ne olacak
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }

}

