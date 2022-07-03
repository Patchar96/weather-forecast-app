//
//  SnackbarView.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 3/7/2565 BE.
//

import Foundation
import UIKit

class SnackbarView : UIView{
    
    let viewModel: SnackbarViewModel
    
    private var handler: Handler?
    
    private let label: UILabel = {
        let label = UILabel()
        if #available(iOS 13.0, *) {
            label.textColor = .white
        } else {
            // Fallback on earlier versions
        }
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(viewModel: SnackbarViewModel,frame:CGRect) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        addSubview(label)
        
        if viewModel.image != nil{
            addSubview(imageView)
        }
        
        if #available(iOS 13.0, *) {
            backgroundColor = .systemGray
        } else {
            // Fallback on earlier versions
        }
        
        clipsToBounds = true
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        
        configure()
    }
    
    private func configure() {
        label.text = viewModel.text
        imageView.image = viewModel.image
        
        switch viewModel.type {
        case .action(let handler):
            self.handler = handler
            isUserInteractionEnabled = true
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSnackbar))
            gesture.numberOfTouchesRequired = 1
            gesture.numberOfTapsRequired = 1
            addGestureRecognizer(gesture)
        case .info : break
            
        }
    }
    
    @objc private func didTapSnackbar() {
        handler?()
    }
    
    public func showSnackbar(snackbar : SnackbarView){
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if viewModel.image != nil{
            label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
            imageView.frame = CGRect(x: imageView.frame.size.height, y: 0, width: frame.width - imageView.frame.size.width, height: frame.height)
        }else{
            label.frame = bounds
        }
    }
    
    private func show(on viewController :UIViewController) {
        handler?()
    }
    
}

typealias Handler = (() -> Void)

enum SnackbarType {
    case info
    case action(handler:Handler)
}

struct SnackbarViewModel {
    let type :SnackbarType
    let text :String
    let image : UIImage?
}
