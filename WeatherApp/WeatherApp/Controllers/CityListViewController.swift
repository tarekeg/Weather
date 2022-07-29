//
//  ViewController.swift
//  WeatherApp
//
//  Created by Tarek El Ghoul on 27/07/2022.
//

import UIKit
import WeatherService
import CoreData

class CityListViewController: UIViewController {
    
    var cities: [NSManagedObject] = []
    let weatherService = WeatherService.instance
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CityData")
        
        
        do {
            cities = try managedContext.fetch(fetchRequest)
            print(cities.count)
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
}

extension CityListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if cities.count == 0 {
            self.tableView.setEmptyMessage("Votre liste est vide...\nAjoutez une ville pour commencer")
        } else {
            self.tableView.restore()
        }
        
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        let city = cities[indexPath.row]
        cell.textLabel?.text = city.value(forKeyPath: "name") as? String
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let city = self.cities[indexPath.row]
        if editingStyle == .delete {
            guard let appDelegate =
                    UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            let managedContext =
            appDelegate.persistentContainer.viewContext
            managedContext.delete(city)
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Error While Deleting Note: \(error.userInfo)")
            }
            loadSaveData()
            
        }
    }
    
    func loadSaveData()  {

        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
        appDelegate.persistentContainer.viewContext
        
        
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "CityData")
        
        
        do {
            cities = try managedContext.fetch(fetchRequest)
            print(cities.count)
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    

}

extension CityListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetails", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let indexPath = sender as! IndexPath
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.longitude = cities[indexPath.row].value(forKeyPath: "longitude") as? Double
                detailViewController.latitude = cities[indexPath.row].value(forKeyPath: "latitude") as? Double
            }
        }
    }
    
}

