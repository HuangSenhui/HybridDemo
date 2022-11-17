//
//  ViewController.swift
//  HybridDemo
//
//  Created by HuangSenhui on 2022/11/18.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        if #available(iOS 15.0, *) {
            let button = UIButton(configuration: UIButton.Configuration.filled(), primaryAction: UIAction(handler: { _ in
                self.openFlutterVC()
            }))
            button.setTitle("打开 Flutter", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }


    func openFlutterVC() {
        let engine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let vc = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        vc.view.backgroundColor = .white
        present(vc, animated: true)
    }
}

