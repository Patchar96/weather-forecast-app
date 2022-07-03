//
//  WeatherRepository.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import Foundation
import RxSwift

class WeatherRepository {
    
    func getWeather(_ cityName: String)-> Observable<WeatherModel>{
        
        return ApiManager().request(ApiManager.main, ApiManager.weather+"q="+cityName+"&appid=80ede7162f1da13875a6bf7fb94a8d25", .get, nil)
    }
    
    func getForecast(_ latitude: String,_ longitude :String)-> Observable<ForecastModel>{
        
        return ApiManager().request(ApiManager.main, ApiManager.forecast+"lat="+latitude+"&lon="+longitude+"&appid=80ede7162f1da13875a6bf7fb94a8d25", .get, nil)
    }
    
    
}
