//
//  ViewController.swift
//  Web Service Example
//
//  Created by Lisa Steele on 12/8/16.
//  Copyright © 2016 Lisa Steele. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var forecastLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = AFHTTPSessionManager()
        
        manager.get("http://api.openweathermap.org/data/2.5/forecast/daily?q=SanFrancisco&mode=json&units=metric&cnt=1&appid=7b8ddd009f73a79dd0de6fdfa101ac20",
            parameters: nil,
            progress: nil,
            success: { (operation: URLSessionDataTask, responseObject: Any?) in
                
        let json = JSON(responseObject)
                if let forecast = json["list"][0]["weather"][0]["description"].string {
                    self.forecastLabel.text = forecast
                }
         
                
          /*
                if let responseObject = responseObject {
                    print("Response: " + (responseObject as AnyObject).description)
                    
                    if let listOfDays = (responseObject as AnyObject)["list"] as? [AnyObject] {
                        if let tomorrow = listOfDays[0] as? [String:AnyObject] {
                            if let tomorrowsWeather = tomorrow["temp"] as? [AnyObject] {
                                if let firstWeatherOfDay = tomorrowsWeather[0] as? [String:AnyObject] {
                                    if let forecast = firstWeatherOfDay ["max"] as? String {
                                        self.forecastLabel.text = forecast
                                    }
                                }
                            }
 
                        }
 
                    }
 
                }
 
 */
            
        }) { (operation: URLSessionDataTask?, error: Error) in
            print("Error: " + error.localizedDescription)
        
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

