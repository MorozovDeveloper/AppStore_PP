//
//  TopPaidViewController.swift
//  AppStore_PP
//
//  Created by Oleg on 06.12.2021.
//

import UIKit

class TopPaidViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model: NetworkModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
    
    private func fetch() {
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/25/apps.json") else {return}
        NetworkService.share.parse(url: url) { result in
            
            switch result {
            case . success(let model):
                DispatchQueue.main.async {
                    self.model = model
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail2" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                DetailModel.share.detailData = (model?.feed.results[indexPath.row].name) ?? ""
                DetailModel.share.imageData = (model?.feed.results[indexPath.row].artworkUrl100) ?? ""
                DetailModel.share.priceData = DetailModel.share.fakePrice.randomElement()
            }
        }
    }
    
    // TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model != nil {
            return model?.feed.results.count ?? 00
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as? TopPaidTableViewCell
        
        cell?.configure(with: model!, cellForRowAt: indexPath)
        
        return cell!
    }
}
