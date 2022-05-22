//
//  ViewController.swift
//  Challenge 13-15
//
//  Created by Denys Denysenko on 15.12.2021.
//

import UIKit

class ViewController: UITableViewController {

    var countries = [Country]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        print(countries.count)
        guard let path = Bundle.main.path(forResource: "countries", ofType: "json") else { return }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
            
        parse(json: data)
        print(countries.count)
        
    }
    
    func parse (json: Data) {
        
        let jsonDecoder = JSONDecoder()
        if let jsonCountries = try? jsonDecoder.decode(Countries.self, from: json) {
            
            countries = jsonCountries.countries
            print(countries.count)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.countryName
        
        return cell
        
            
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController {
            
            vc.country = countries[indexPath.row]
            print(vc.country.capital)
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }

}

