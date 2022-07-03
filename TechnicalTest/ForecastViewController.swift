//
//  ForecastViewController.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import UIKit

class ForecastViewController: UIViewController {
    
    static let identifier = "ForecastViewController"
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewTable: UIView!
    @IBOutlet weak var scale: UISegmentedControl!
    
    var titleName:String? = ""
    var latitude: String? = ""
    var longitude : String? = ""
    var forecastData : ForecastModel?
    
    var scaleTemp:String = "Celsius"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        getList(latitude: latitude ?? "", longitude: longitude ?? "")
        initCompenent()
    }
    
    func initView(){
        viewTable.layer.cornerRadius = 8
        viewTable.layer.masksToBounds = true
        navBar.topItem?.title = titleName
        
        if scaleTemp == "Celsius" {
            scale.selectedSegmentIndex = 0
        }else if scaleTemp == "Fahrenheit" {
            scale.selectedSegmentIndex = 1
        }

    }
    
    
    
    func initCompenent(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ForecastTableViewCell.nib, forCellReuseIdentifier: ForecastTableViewCell.identifier)
        
    }
    
    
    @IBAction func onDismiss(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeScale(_ sender: Any) {
        switch scale.selectedSegmentIndex
        {
        case 0:
            self.scaleTemp = "Celsius"
            tableView.reloadData()
        case 1:
            self.scaleTemp = "Fahrenheit"
            tableView.reloadData()
        default:
            break
        }
    }
    
    func getList(latitude:String,longitude:String){
        let repo = WeatherRepository()
        
        repo.getForecast(latitude, longitude).subscribe { event in
            switch event.event {
            case let .next(data):
                print("getForecast", data.toJSON())
                self.forecastData = data
                self.tableView.reloadData()
            case .completed:
                break
            case let .error(err):
                break
            }
        }
        
    }
    
    
}


extension ForecastViewController : UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier, for: indexPath) as? ForecastTableViewCell else{return UITableViewCell()}
        
        let celsiusMin = (forecastData?.list?[indexPath.row].main?.temp_min ?? 0 ) - 273.15
        let celsiusMax = (forecastData?.list?[indexPath.row].main?.temp_max ?? 0 ) - 273.15
        
        
        for weatherData in forecastData?.list?[indexPath.row].weather ?? [] {
            let iconString:String = "https://openweathermap.org/img/wn/" + "\(weatherData.icon ?? "")" + "@2x.png"
            cell.weatherImage.imageFrom(url: URL(string: iconString)!)
        }
        
        if scaleTemp == "Celsius" {
            cell.minTempLabel.text = "\(Int(celsiusMin))" + "°C"
            cell.maxTempLabel.text = "\(Int(celsiusMax))" + "°C"

        }else if scaleTemp == "Fahrenheit" {
            let fahrenheitMin = Int(celsiusMin * 1.8 + 32)
            let fahrenheitMax = Int(celsiusMax * 1.8 + 32)
            
            cell.minTempLabel.text = "\(fahrenheitMin)" + "°F"
            cell.maxTempLabel.text = "\(fahrenheitMax)" + "°F"
        }
        
        let dateString = forecastData?.list?[indexPath.row].dateTime ?? ""
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.locale = Locale(identifier: "en")
        dateFormatterPrint.dateFormat = "E HH:mm"
        
        let date: Date? = dateFormatterGet.date(from: dateString)
        
        cell.dateLabel.text = dateFormatterPrint.string(from: date!)
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastData?.list?.count ?? 0
    }
    
    
}
