//
//  YTabBarBoard.swift
//  TuoYouBao
//
//  Created by 郭令 on 2021/11/11.
//

import UIKit
import Foundation
import Flutter

class YTabBarBoard: UITabBarController {

    
    // 创建TabBar数组
    // 创建TabBar数组
    var tabs = ["精选","短视频","电影", "社区","我的"]
    var images = [ "shou_cang_n", "you_yu_n","tuo-you-bao_n","you_xiang_n","wo_de_n"]
    var selectedImages = ["shou_cang_s", "you_yu_s","tuo-you-bao_s","you_xiang_s","wo_de_s"]
    
    public var tabBarItems:[UITabBarItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.toMain()
    }
    
    func toMain() {
        
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController =
            FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
//         flutterViewController.hidesBottomBarWhenPushed = true
        
        let boardArr = [OneBoard(),TwoBoard(),ThreeBoard(),FourBoard(),flutterViewController]
        var navArray:[UIViewController] = [UIViewController]()
        var i = 0
        while i<images.count {
            
            // 改变图片 保证图片不失真
            let normalImage = UIImage(named:images[0])?.withRenderingMode(.alwaysOriginal)
            let selectImage = UIImage(named:selectedImages[0])?.withRenderingMode(.alwaysOriginal)
            let board: UIViewController = boardArr[i]
            let boardNC = UINavigationController.init(rootViewController: board)
            let item = UITabBarItem.init(title: tabs[i], image: normalImage, selectedImage: selectImage)
            boardNC.tabBarItem = item
                        
            //隐藏系统的navigationBar
            boardNC.setNavigationBarHidden(true, animated: true)
            navArray.append(boardNC)
            i+=1
            print(i)
            tabBarItems.append(board.tabBarItem)
            addChild(boardNC)
        }

        //            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
    
        if #available(iOS 13.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            // UITabBarItem 选择颜色和字体大小
            tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10)]
            tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10)]
            // UITabBarItem 文字的偏移量
            tabBarAppearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
            // tabBar 颜色
            tabBarAppearance.backgroundColor = .white
            // tabBar 背景图片
//            tabBarAppearance.backgroundImage = UIImage(named: "abc")
            // 这句一定要放在最后
            tabBar.standardAppearance = tabBarAppearance
            
        } else {
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10)], for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10)], for: .selected)
            UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
            // tabBar 颜色
            UITabBar.appearance().backgroundColor = .white
            // tabBar 背景图片
//            UITabBar.appearance().backgroundImage = UIImage(named: "abc")
        }


        
//        self.tabBar.tintColor = .red
//        let tabBarController = UITabBarController()
        self.viewControllers = navArray
        self.tabBar.backgroundColor = .black
        self.selectedIndex = 0
        print(navArray)
//        AppDelegate.init().window?.rootViewController = self
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //获取选中的item
//        let tabIndex = tabBar.items?.firstIndex(of: item) ?? 0
//        let item_first = tabBar.items?[safe: 0]
//        item_first?.title = ""
//        if tabIndex == 0 {
//            item_first?.title = "托优宝"
//        }
//        print(tabIndex)
//        guard let item_first = tabBar.items?[safe: 0] else {
//            return
//        }
//        self.animationItem(with: tabIndex)
    }
    
    func animationItem(with index: Int) {
        if let `class` = NSClassFromString("UITabBarButton") {
            let view = tabBar.subviews.filter({$0.isKind(of: `class`)})[index]
            let animation = CASpringAnimation(keyPath: "transform.scale")
            animation.mass = 0.6
            animation.stiffness = 80
            animation.damping = 10
            animation.initialVelocity = 0.5
            animation.duration = 0.35
            animation.fromValue = 0.25
            animation.toValue = 1
            animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.6, 0.1, 0.30, 0.90)
            view.layer.add(animation, forKey: nil)
        }
    }
}

