//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Kevin Tanner on 8/15/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let weatherController = WeatherController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        weatherController.fetchWeatherForcast(latitude: 34.0522, longitude: -118.2437) { (weather) in
            print(weather)
        }
    }
    
    // MARK: - Actions
    @IBAction func provoButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func losAngelesButtonTapped(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // IIDOO
        
        // Identify
        if segue.identifier == "toProvoDetail" {
            
            // Index
//            guard let _ = sender as? UIButton,
                guard let destinationVC = segue.destination as? DetailViewController else { return }
            
            // Object To Send
            weatherController.fetchWeatherForcast(latitude: 40.2338, longitude: -111.6585) { (day) in
                guard let day = day else { return
                }
                
                // Object Sent
                destinationVC.landingPad = day
                
            }
            
        } else if segue.identifier == "toLosAngelesDetail" {
            // Button
//            guard let _ = sender as? UIButton,
                guard let destinationVC = segue.destination as? DetailViewController else { return }
            
            weatherController.fetchWeatherForcast(latitude: 34.0522, longitude: -118.2437) { (day) in
                guard let day = day else { return
                }
                
                destinationVC.landingPad = day
            }
        }
        
    }
    
    
}

