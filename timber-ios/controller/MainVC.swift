//
//  SplashScreenController.swift
//  timber-ios
//
//  Created by 罗晓胜 on 2021/1/13.
//

import UIKit
import Alamofire
import Reachability

/*
 主界面
 */
class MainVC: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var clickBtn: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    //网络检查
    let networkCheck = try! Reachability()
    
    //按钮点击——跳转下一个VC
    @IBAction func btnClickTap(_ sender: Any) {
        print("按钮点击")
        let storyboard = UIStoryboard(name: "SearchVC", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        //执行跳转
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    //程序加载的地方
    override func viewDidLoad() {
        print("程序加载")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //界面即将显示
    override func viewWillAppear(_ animated: Bool) {
        print("界面即将加载")
        super.viewWillAppear(animated)
        // Hide NavigationBar in this viewController.
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    //界面即将退出
    override func viewWillDisappear(_ animated: Bool) {
        print("界面即将消失")
        super.viewWillDisappear(animated)
        // Show NavigationBar other viewController.
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    //界面展示
    override func viewDidAppear(_ animated: Bool) {
        print("界面展示")
//        showAlert(titleInput: "展示消息头!", messageInput: "展示消息体")
        super.viewDidAppear(true)
        if NetworkManager.shared.reachabilityManager?.isReachable == true {
            startIndicator()
            //延时两秒关闭进度条
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.stopIndicator()
                self.logoImg.isHidden = false
            }
        } else {
            showAlert(titleInput: "HATA!", messageInput: "İnternet Bağlantınız Yok...")
        }
    }
    
    //展示进度条
    func startIndicator(){
        spinner.startAnimating()
    }
    //停止进度条
    func stopIndicator(){
        spinner.stopAnimating()
        spinner.isHidden = true
    }
    //提示信息
    func showAlert(titleInput: String, messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确认", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

//网络请求类
class NetworkManager {
    
    //shared instance
    
    static let shared = NetworkManager()
    
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "http://omdbapi.com")
    
    func startNetworkReachabilityObserver() {
        
        switch reachabilityManager?.status {
            
        case .reachable(.cellular):
            print("Hücresel Veri Kullanılabilir...")
            
        case .reachable(.ethernetOrWiFi):
            print("Wi-fi Kullanılabilir...")
            
        case .notReachable:
            print("İnternet Erişiminiz Bulunmamaktadır...")
            
        default:
            break
        }
    }
}
