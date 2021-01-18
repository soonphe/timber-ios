//
//  SearchVC.swift
//  timber-ios
//
//  Created by 罗晓胜 on 2021/1/13.
//

import UIKit
import SVProgressHUD

/*
 搜索controller
 */
class SearchVC: UIViewController {
    
    let searchService = SearchService()
    var searchData: [MovieModel]!
    var text: String = ""


    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.movieTableView.isHidden = true
        setDelegates()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("请求将要显示")
        super.viewWillAppear(animated)
        // Hide NavigationBar in this viewController.
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("页面将要消失")
        super.viewWillDisappear(animated)
        // Show NavigationBar other viewController.
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    /*
     获取数据
     */
    func fetchMovies() {
        print("请求列表数据")
        searchService.getSearch(text: text) { [weak self](result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                print("请求成功")
                self.searchData = response.search
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                    print(response.search ?? "")
                }
            case .failure(let error):
                print("*************************\(error)*******************************")
            }
        }
    }
    
    /*
     初始化调用，监控搜索栏和tableview
     */
    func setDelegates() {
        print("初始化")
        searchBar.delegate = self
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(MovieTableViewCell.self)
    }
}

/*
 处理搜索栏
 */
extension SearchVC: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.text = searchText
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("搜索栏点击")
        fetchMovies()
        self.movieTableView.reloadData()
        self.movieTableView.isHidden = false
        self.view.endEditing(true)
    }

}

/*
 处理tableview
 */
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableview行数")
        if searchData != nil {
            return searchData.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableviewcell")
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.fillSearchList(searchResponse: searchData[indexPath.row])
        cell.searchResponse = searchData[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    /*
     重载选择tableview方法
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("进入详情")
        let storyboard = UIStoryboard(name: "MovieDetailVC", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
        destination.identifier = self.searchData[indexPath.row].imdbID
        self.navigationController?.pushViewController(destination, animated: true)
    }
}
