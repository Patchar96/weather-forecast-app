//
//  WeatherViewController.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var scale: UISegmentedControl!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var forecastBarItem: UIBarButtonItem!
    
    var weatherData : WeatherModel?
    var weatherDetail: DetailWeatherModel?
    
    var latitude : Double?
    var longitude : Double?
    var scaleTemp:String = "Celsius"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLocation(cityName: "Bangkok")
    }
    
    
    
    func initView(){
        for data in weatherData?.weather ?? [] {
            weatherDetail = data
            setImage()
            weatherLabel.text = weatherDetail?.description
            weatherImage.layer.cornerRadius = weatherImage.frame.height/2
            searchButton.isEnabled = false

        }
        
        humidityLabel.text = "\(weatherData?.main?.humidity ?? 0)" + " %"
        navBar.topItem?.title = weatherData?.name
        calculateTemp(scaleTemp: scaleTemp)
        cityNameTextField.addTarget(self, action: #selector(self.editingChanged), for: .editingChanged)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func editingChanged(_ textField: UITextField) {
        
        if textField.text != ""{
            searchButton.isEnabled = true
            searchButton.tintColor = UIColor(red: 0.000, green: 0.780, blue: 0.745, alpha: 1.0)
        }else{
            searchButton.isEnabled = false
        }

    }
    
    
    
    func calculateTemp(scaleTemp:String){
        let celsius = (weatherData?.main?.temp  ?? 0.0 ) - 273.15
        if scaleTemp == "Celsius" {
            temperatureLabel.text = "\(Int(celsius))" + "°C"
        }else if scaleTemp == "Fahrenheit" {
            let fahrenheit = Int(celsius * 1.8 + 32)
            temperatureLabel.text = "\(fahrenheit)" + "°F"
        }
    }
    
    func setImage(){
        let iconString:String = "https://openweathermap.org/img/wn/" + "\(weatherDetail?.icon ?? "01d")" + "@2x.png"
        
        weatherImage.imageFrom(url: URL(string: iconString)!)
    }
    
    @IBAction func changeScale(_ sender: Any) {
        switch scale.selectedSegmentIndex
        {
        case 0:
            self.scaleTemp = "Celsius"
            calculateTemp(scaleTemp: scaleTemp )
        case 1:
            self.scaleTemp = "Fahrenheit"
            calculateTemp(scaleTemp: scaleTemp )
        default:
            break
        }
    }
    
    @IBAction func searchLocation(_ sender: Any) {
        getLocation(cityName: cityNameTextField.text ?? "")
    }
    
    @IBAction func toForecast(_ sender: Any) {
        Navigator.share.toForecast(self, title: weatherData?.name ?? "", latitude: String(self.latitude ?? 0), longitude: String(self.longitude ?? 0), scaleTemp: scaleTemp)
    }
    
    
    func getLocation(cityName:String){
        
        let repo = WeatherRepository()
        
        repo.getWeather(cityName).subscribe { event in
            switch event.event {
            case let .next(data):
                print("data", data.toJSON())
                self.weatherData = data
                self.initView()
                self.latitude = data.coord?.lat
                self.longitude = data.coord?.lon
            case .completed:
                break
            case let .error(err):
                break
                
            }
        }
        
    }
    
    
    
}

extension UIImageView{
  func imageFrom(url:URL){
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url){
        if let image = UIImage(data:data){
          DispatchQueue.main.async{
            self?.image = image
          }
        }
      }
    }
  }
}
