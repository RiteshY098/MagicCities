//
//  ViewController.swift
//  MagicCities
//
//  Created by Natasha Shinde on 22/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var citiesTableView : UITableView!
    
    struct Constants {
        static let cellIdentifier = "Magic Cities"
    }
    
    var cities: [String] = ["New York", "Tokyo", "Beling", "Mumbai", "Amsterdam", "Las Vegas"]
    
    var citiesDict : [String : String] = ["New York": "USA" , "Tokyo" : "Japan" , "Beling" : "China" , "Mumbai" : "India" , "Amsterdam" : "Netherlands" , "Las Vegas" : "USA"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let cityName = cities[indexPath.row]
        cellContentConfiguration.text = cityName
        
        cellContentConfiguration.secondaryText = citiesDict[cityName] ?? "City Name"
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("user tapped on cell at \(indexPath) indexPath")
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
