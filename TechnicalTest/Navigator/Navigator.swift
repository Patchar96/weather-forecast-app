//
//  Navigator.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import Foundation
import UIKit

class Navigator {
    static let share = Navigator()
    
    func toForecast(_ viewController : UIViewController,title:String,latitude:String,longitude:String,scaleTemp:String) {
        
        guard let vc = viewController.storyboard?.instantiateViewController(withIdentifier: ForecastViewController.identifier) as? ForecastViewController else {return}
        
        vc.titleName = title
        vc.longitude = longitude
        vc.latitude = latitude
        vc.scaleTemp = scaleTemp
        
        print("titleName:" ,title,longitude,latitude)
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve

        viewController.present(vc, animated: true, completion:nil)
    }
}
