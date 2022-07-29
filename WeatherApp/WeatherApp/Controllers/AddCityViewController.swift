//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Tarek El Ghoul on 28/07/2022.
//

import UIKit
import CoreLocation
import CoreData

class AddCityViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func addCityTapped(_ sender: Any) {
        if let cityName = cityTextField.text {
            getCoordinateFrom(address: cityName) { [self] coordinate, error in
                save(name: cityName, longitude: Double(coordinate?.longitude ?? 0.0), latitude: Double(coordinate?.latitude ?? 0.0))
            }
        }
        view.endEditing(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            _ = self.navigationController?.popViewController(animated: true)
        }
        
     
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1)
        }
    }
    
    func save(name: String, longitude: Double, latitude: Double) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CityData",
                                   in: managedContext)!
        
        let city = NSManagedObject(entity: entity, insertInto: managedContext)
        
        city.setValue(latitude, forKeyPath: "latitude")
        city.setValue(longitude, forKeyPath: "longitude")
        city.setValue(name, forKeyPath: "name")
        
        do {
            try managedContext.save()
            print("DidSave")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    
    
}
