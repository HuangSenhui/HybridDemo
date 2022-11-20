//
//  HFlutterViewController.swift
//  HybridDemo
//
//  Created by HuangSenhui on 2022/11/20.
//

import Flutter

class HFlutterViewController: FlutterViewController {

    deinit {
        debugPrint("--> \(Self.self)", #function)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

}
