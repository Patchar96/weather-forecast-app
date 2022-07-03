//
//  ApiManager.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 2/7/2565 BE.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift

class ApiManager {
    
    static let main = "https://api.openweathermap.org/data/2.5/"
    
    static let weather = "weather?"
    static let forecast = "forecast?"
    
    func printRequest(_ domain: String, _ apiname: String, _ parameter: [String: Any]?) {
        print("URL : \(domain)\(apiname) \nRequest : \(parameter ?? [:]) ")
    }
    
    func printResponse(_ statusCode: Int?, _ domain: String, _ apiname: String) {
        print("\(statusCode ?? 0)] '\(domain)\(apiname)'")
    }
    
    public func request<T: ObjectMapperModel>(_ domain: String, _ apiname: String, _ method: HTTPMethod, _ parameter: [String: Any]?) -> Observable<T> {
        let url = domain + apiname
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        printRequest(domain, apiname, parameter)
        return Observable<T>.create { e in
            
            if InternetUtils.isConnect() {
                let request = AF.request(url, method: method, parameters: parameter, encoding: JSONEncoding.default, headers: header)
                
                request.responseObject { (response: DataResponse<T>) in
                    self.printResponse(response.response?.statusCode, domain, apiname)
                    switch response.result {
                    case let .success(value):
                        
                        if response.response?.statusCode == 200 {
                            e.onNext(value)
                        } else {
                            
                            self.showSneckBar("Incorrect information. Please recheck.")
                            print("StatusCodeEroror : ",response.response?.statusCode," : domain \(domain)\(apiname)")
                        }
                        
                    case let .failure(error):
                        e.onError(error)
                        self.showSneckBar("Incorrect information. Please recheck.")
                        print("StatusCodeEroror : ",response.response?.statusCode," : domain \(domain)\(apiname)")
                    }
                }
            }else{
                print("StatusCodeEroror :  : domain \(domain)\(apiname)")
                self.showSneckBar("Can't connect to server. Please check your internet.")
            }
            return Disposables.create()
        }
    }
    
    func showSneckBar(_ text:String) {
        DispatchQueue.main.async{
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            if let view = UIApplication.shared.keyWindow?.rootViewController?.view {
                //            guard let view = topController.view else {return}
                for subviews in view.subviews  where subviews is SnackbarView{
                    subviews.removeFromSuperview()
                    return
                }
                
                let snackbarviewModel: SnackbarViewModel
                snackbarviewModel = SnackbarViewModel(type: .info, text: text, image: nil)
                let frame = CGRect(x: 0, y: 0, width: view.frame.size.width/1.5, height: 60)
                let snackbar = SnackbarView(viewModel: snackbarviewModel,frame:frame)
                let width = view.frame.size.width/1.5
                snackbar.frame = CGRect(x: (view.frame.size.width-width)/2, y: 88, width: width, height: 60)
                
                view.addSubview(snackbar)
                
                UIView.animate(withDuration: 0.5, animations: {
                    snackbar.frame = CGRect(x: (view.frame.size.width-width)/2, y: 88, width: width, height: 60)
                },completion: { done in
                    if done{
                        UIView.animate(withDuration: 5, animations: {
                            snackbar.frame = CGRect(x: (view.frame.size.width-width)/2, y: 88, width: width, height: 60)
                        },completion: { finished in
                            if finished{
                                DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                                    snackbar.removeFromSuperview()
                                })
                            }
                        })
                    }
                })
            }
        }
        
    }
}
    
    
