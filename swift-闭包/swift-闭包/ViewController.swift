//
//  ViewController.swift
//  swift-闭包
//
//  Created by 田彬彬 on 2017/4/22.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var httptool:Httptools?
    // 在swift 中只要是对父类的方法进行重写 必须在方法钱加上 override
    override func viewDidLoad() {
        super.viewDidLoad()
       
        httptool = Httptools()
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("点击了屏幕------")
        
        // 解决方案一
        /*
        weak var weakselft:ViewController? = self
        
        // 闭包相当于 oc 的 block
        httptool?.LoadData({ (JsonData:String) in
            
            print("在我们的控制器中获取到数据\(JsonData)")
            
            //　这里self。 一半可以省略到 
            // 1. 如果改方中 局部变量于成员属性之间有歧义 （名称相同）
            // 2. 在闭包中使用成员属性
            // 这里要注意 是否会造成循环引用
            weakselft?.view.backgroundColor = UIColor.red
            
        })
        */
        
        
        
        // 第二种解决方法
        
        httptool?.LoadData({[weak self](jsonData:String) in
            
            self?.view.backgroundColor = UIColor.blue
            
        })
 
        /*
        // 第三种不建议用 会造成野指针
        httptool?.LoadData({ [unowned self ] (jsonData:String) in
            
             self.view.backgroundColor = UIColor.blue
            
        })
        */
        
        
        // 尾随闭包的概念刚开始不建议
        // 如果在函数中 闭包是最后一个参数 那么可以写成尾随闭包
        // 如果时唯一的参数 也可以将前面的()省略掉
        httptool?.LoadData(){[weak self](jsonData:String) in
            
            self?.view.backgroundColor = UIColor.blue
        }
    
    }
    
    deinit {
        
        print("该对象释放了")
        
    }

}

