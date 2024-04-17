//
//  ViewController.swift
//  MAAutoLayout_Example
//
//  Created by admin on 9/10/20.
//  Copyright © 2020 ma772528138@qq.com. All rights reserved.
//

import UIKit
import MAAutoLayout

class ViewController: UIViewController {
    lazy var view0: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    lazy var view2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        return view
    }()
    lazy var view3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.view0)
        self.view.addSubview(self.view1)
        self.view.addSubview(self.view2)
        self.view.addSubview(self.view3)

        self.view0.ma_makeConstraints { (make) in
            make.top.equalTo(self.view.ma_safeAreaLayoutGuideTop).offset(10)
            make.left.equalTo(self.view).offset(10)
            make.bottom.equalTo(self.view.ma_safeAreaLayoutGuideBottom).offset(-10)
            make.right.equalTo(self.view).offset(-10)
        }
        self.view1.ma_makeConstraints({ (make) in
            make.edge.equalTo(self.view0).insets(UIEdgeInsets.init(top: 10, left: 10, bottom: -10, right: -10))
        })
        self.view2.ma_makeConstraints { (make) in
            make.edge.equalTo(self.view1).insets(UIEdgeInsets.init(top: 10, left: 10, bottom: -10, right: -10))
        }
        self.view3.ma_makeConstraints { (make) in
            make.center.equalToSuperView(nil)
            make.size.ma_equalSize(100,200)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view2.ma_remakeConstraints { (make) in
            make.edge.equalTo(self.view1).insets(UIEdgeInsets.init(top: 80, left: 80, bottom: -80, right: -80))
        }
        UIView.animate(withDuration: 1, animations: {
            self.view.layoutIfNeeded()
        }) { (finished) in
            self.view2.ma_remakeConstraints { (make) in
                make.edge.equalTo(self.view1).insets(UIEdgeInsets.init(top: 10, left: 10, bottom: -10, right: -10))
            }
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
}
