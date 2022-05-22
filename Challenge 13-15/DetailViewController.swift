//
//  DetailViewController.swift
//  Challenge 13-15
//
//  Created by Denys Denysenko on 22.12.2021.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var country: Country!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = country.countryName
        navigationController?.navigationBar.prefersLargeTitles = false
        
        tableView.tableFooterView = UIView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareInfo))
        
    }
    
    @objc func shareInfo () {
        
        let av = UIActivityViewController(activityItems:[title, country.capital, country.currencyCode, country.continentName, country.population], applicationActivities: [])
        present(av, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Info")
            
            cell?.textLabel?.text = country.capital
            cell?.detailTextLabel?.text = "CAPITAL:"
            return cell!
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Info2")
            
            cell?.textLabel?.text = (country.population)
            cell?.detailTextLabel?.text = "POPULATION:"
            return cell!
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Info3")
            
            cell?.textLabel?.text = country.currencyCode
            cell?.detailTextLabel?.text = "CURRENCY:"
            return cell!
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Info4")
            
            cell?.textLabel?.text = country.continentName
            cell?.detailTextLabel?.text = "CONTINENT:"
            return cell!
        }

}
}
