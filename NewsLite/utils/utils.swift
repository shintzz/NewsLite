//
//  utils.swift
//  NewsLite
//
//  Created by Shinto Joseph on 11/04/21.
//

import Foundation
import UIKit

class Util{
    
    let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView();
    
    static let shared = Util()
    private init(){}
    
    func startLoading(view:UIView){
        activityIndicator.center = view.center;
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.style = UIActivityIndicatorView.Style.gray;
        view.addSubview(activityIndicator);

        activityIndicator.startAnimating();
        UIApplication.shared.beginIgnoringInteractionEvents();

    }

    func stopLoading(){

        activityIndicator.stopAnimating();
        UIApplication.shared.endIgnoringInteractionEvents();

    }
    

    
}


