//
//  TableViewController.swift
//  HybridDemo
//
//  Created by HuangSenhui on 2022/11/18.
//

import UIKit
import Flutter

class TableViewController: UITableViewController {
    
    var titles: [Int: String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "原生与Flutter"
        view.backgroundColor = .systemGray6
        titles = [
            0: "打开Flutter - 默认",
            1: "打开Flutter - 隐式",
            2: "打开Flutter - 入口",
            3: "打开Flutter - 路由",
            4: "打开Flutter - 通道+路由",
            5: "打开Flutter - 通道+路由 2",
            6: "打开Flutter - 入口+路由",
            7: "打开Flutter - 入口+路由 2",
        ]
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            openFlutter1()
        case 1:
            openFlutter2()
        case 2:
            openFlutter3()
        case 3:
            openFlutter4()
        case 4:
            openFlutter5(routName: "/Page1")
        case 5:
            openFlutter5(routName: "/Page2")
        case 6:
            openFlutter6(routName: "/Page1")
        case 7:
            openFlutter6(routName: "/Page2")
        default:
            debugPrint("--> 未实现 \(indexPath)")
        }
    }

}

extension TableViewController {
    
    /**
     使用默认默认引擎
     1. 页面会有缓存快照
     2. 生命周期里共用一个引擎
     3. VC会被释放
     */
    func openFlutter1() {
        let engine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        engine.run() // 第一次加载有明显耗时等待
        let vc = HFlutterViewController(engine: engine, nibName: nil, bundle: nil)
        present(vc, animated: true)
    }
    
    /**
     隐式创建
     1. 页面不会缓存
     2. engine创建需要时间
     3. VC，engine没有释放
     */
    func openFlutter2() {
        let vc = HFlutterViewController(nibName: nil, bundle: nil)
        present(vc, animated: true)
    }
    
    /**
     指定Dart 入口
     1. 打开指定入口界面
     2. 页面不会缓存，engine创建需要时间
     3. VC、engine 会被释放
     */
    func openFlutter3() {
        let engine = FlutterEngine(name: "flutter_playground_page2")
        engine.run(withEntrypoint: "openFlutterPage2")
        let vc = HFlutterViewController(engine: engine, nibName: nil, bundle: nil)
        present(vc, animated: true)
    }
    
    /**
     初始化路由
     1. 通过路由加载指定界面
     2. 页面不会缓存，engine创建需要时间
     3. vc、engine不会释放
     */
    func openFlutter4() {
        let pj = FlutterDartProject(precompiledDartBundle: nil)
        let vc = HFlutterViewController(project: pj, initialRoute: "/Page2", nibName: nil, bundle: nil)
        present(vc, animated: true)
    }
    
    /**
     路由+通道方法
     1. 共用Engine
     2. 不同路由页面不会缓存
     3. vc 会释放
     */
    func openFlutter5(routName: String) {
        let engine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        engine.run(withEntrypoint: "openFlutterPage3")
        let vc = HFlutterViewController(engine: engine, nibName: nil, bundle: nil)
        let channel = FlutterMethodChannel(name: "LoadPage", binaryMessenger: vc.binaryMessenger)
        channel.invokeMethod(routName, arguments: "-- 参数 --")
        present(vc, animated: true)
    }
    
    /**
     引擎 + 路由
     1. 指定初始界面
     2. 页面会缓存，路由无效
     3. vc 会释放
     */
    func openFlutter6(routName: String) {
        let engine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        engine.run(withEntrypoint: nil, initialRoute: routName)
        let vc = HFlutterViewController(engine: engine, nibName: nil, bundle: nil)
        present(vc, animated: true)
    }
}
