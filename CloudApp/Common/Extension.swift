//
//  Extension.swift
//  CloudApp
//
//  Created by Sachin Amrale on 14/05/22.
//

import Foundation
import UIKit
import SKActivityIndicatorView

extension UIViewController {
    func showActivityIndicator(loadingText: String) {
        SKActivityIndicator.statusTextColor(UIColor.white)
        SKActivityIndicator.spinnerColor(.white)
        SKActivityIndicator.spinnerStyle(.defaultSpinner)
        SKActivityIndicator.show(loadingText, userInteractionStatus: false)
    }
    
    func hideActivityIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-100, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.getStandardFont(size: 15)
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func instantiateVC(withIdentifier id: String) -> UIViewController {
        let newStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return newStoryboard.instantiateViewController(withIdentifier: id)
    }
}

extension UITextField {
    func setPlaceholder(_ text123: String, _ color:UIColor, _ font: UIFont) {
        attributedPlaceholder = NSAttributedString(string: text123,
                           attributes: [.foregroundColor: color,
                                        .font: font])
    }
    
    func addBottomLine() {
        let bottomBarView = UIView()
        bottomBarView.backgroundColor = UIColor.lightGray
        bottomBarView.translatesAutoresizingMaskIntoConstraints = false
        bottomBarView.accessibilityIgnoresInvertColors = true
        addSubview(bottomBarView)
        bottomBarView.anchorToHeight(1)
        bottomBarView.anchorLeading(leading: self.leadingAnchor, constant: 0)
        bottomBarView.anchorTrailing(trailing: self.trailingAnchor, constant: 0)
        bottomBarView.anchorBottom(bottom: self.bottomAnchor, constant: 0)
    }
}

extension UIView {
    func anchorBottom(bottom: NSLayoutYAxisAnchor, constant: CGFloat) {
        bottomAnchor.constraint(equalTo: bottom, constant: constant).isActive = true
    }
    
    func anchorLeading(leading: NSLayoutXAxisAnchor, constant: CGFloat) {
        leadingAnchor.constraint(equalTo: leading, constant: constant).isActive = true
    }
    
    func anchorTrailing(trailing: NSLayoutXAxisAnchor, constant: CGFloat) {
        trailingAnchor.constraint(equalTo: trailing, constant: constant).isActive = true
    }
    
    func anchorToHeight(_ height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}

extension UIFont {
    class func getStandardFont(size: Int) -> UIFont {
        return self.systemFont(ofSize: CGFloat(size))
    }
    
    class func getBoldFont(size: Int) -> UIFont {
        return self.boldSystemFont(ofSize: CGFloat(size))
    }
}
