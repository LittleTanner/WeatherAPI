//
//  DetailViewController.swift
//  WeatherAPI
//
//  Created by Kevin Tanner on 8/15/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var todayMaxTemperatureLabel: UILabel!
    @IBOutlet weak var todayWeatherType: UILabel!
    
    @IBOutlet weak var tomorrowMaxTempLabel: UILabel!
    @IBOutlet weak var tomorrowWeatherType: UILabel!
    
    
    // MARK: - Properties
    
    var landingPad: [Day]? {
        didSet {
            updateViews()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        guard let days = landingPad else { return }
        
        DispatchQueue.main.async {
            self.todayMaxTemperatureLabel.text = String(days[0].temperatureMax)
            self.tomorrowMaxTempLabel.text = String(days[1].temperatureMax)
            self.todayWeatherType.text = String(days[0].weatherType)
            self.tomorrowWeatherType.text = String(days[1].weatherType)
            
        }
        
        //todayTempLabel.text = weather.daily
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
