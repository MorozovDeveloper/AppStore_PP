//
//  ViewController.swift
//  AppStore_PP
//
//  Created by Oleg on 28.11.2021.
//

import UIKit
import Firebase

class TopFreeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var user: AppUser!
    var reference: DatabaseReference!
    
    var model: Model?

    var imageCell: UIImage?
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var testImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        parseAPI()
        
        guard let currentUser = Auth.auth().currentUser else {return}//не нашли - выходим
        user = AppUser(user: currentUser)
        reference = Database.database().reference(withPath: "users").child(String(user.uid)).child("tasks")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            if let indexPath  = self.tableView.indexPathForSelectedRow {
                let detailController = segue.destination as? DetailViewController
                detailController!.detailData = (model?.feed.results[indexPath.row].name)!
                detailController?.imageData = (model?.feed.results[indexPath.row].artworkUrl100)!
        }
    }
}
    
    // TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model != nil {
            return (model?.feed.results.count)!
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TopFreeTableViewCell
        
        cell?.nameLabel.text = model?.feed.results[indexPath.row].name
        cell?.descriptionLabel.text = model?.feed.results[indexPath.row].genres.first?.name
   
        guard let receivedImage = try? Data(contentsOf: URL(string: (model?.feed.results[indexPath.row].artworkUrl100)!)!) else {return cell!}
        cell?.imageLabel.image = UIImage(data: receivedImage)
        cell?.imageLabel.layer.cornerRadius = 20
        cell?.imageLabel.clipsToBounds = true

        return cell!
    }
    

    
}





