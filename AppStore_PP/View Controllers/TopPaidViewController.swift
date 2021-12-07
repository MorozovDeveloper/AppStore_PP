//
//  TopPaidViewController.swift
//  AppStore_PP
//
//  Created by Oleg on 06.12.2021.
//

import UIKit

class TopPaidViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var model: Model?
    var price = [100.00, 200.00, 300.00, 500.00, 600.00]

    override func viewDidLoad() {
        super.viewDidLoad()
        parseAPI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail2" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                guard let detailController = segue.destination as? DetailViewController else {return}
                detailController.detailData = (model?.feed.results[indexPath.row].name)!
                detailController.imageData = (model?.feed.results[indexPath.row].artworkUrl100)!
                detailController.priceData = price.randomElement()
                
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model != nil {
            return (model?.feed.results.count)!
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as? TopPaidTableViewCell
        
        cell2?.nameLabel.text = model?.feed.results[indexPath.row].name
        cell2?.descriptionLabel.text = model?.feed.results[indexPath.row].genres.first?.name
        cell2?.priceLabel.text = "\(price.randomElement()!) ₽"
        cell2?.priceLabel.layer.cornerRadius = 7
        cell2?.priceLabel.clipsToBounds = true
        cell2?.priceLabel.layer.borderWidth = 0.2
        cell2?.priceLabel.layer.borderColor = UIColor.black.cgColor
        
        guard let receivedImage = try? Data(contentsOf: URL(string: (model?.feed.results[indexPath.row].artworkUrl100)!)!) else {return cell2!}
        cell2?.imageLabel.image = UIImage(data: receivedImage)
        cell2?.imageLabel.layer.cornerRadius = 20
        cell2?.imageLabel.clipsToBounds = true
        
        return cell2!
    }

    
}
