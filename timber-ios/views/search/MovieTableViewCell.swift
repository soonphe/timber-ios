//
//  MovieTableViewCell.swift
//  timber-ios
//
//  Created by 罗晓胜 on 2021/1/15.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    var searchResponse: MovieModel!
    
    @IBOutlet weak var movieImgView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayers()
    }
    
    func setLayers() {
//        movieImgView.layer.cornerRadius = 5
    }
    
    //MARK: - Fill Search Movie List
    func fillSearchList(searchResponse: MovieModel) {
        let imgUrl = URL(string: searchResponse.poster ?? "")
        movieImgView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        movieTitleLabel.text = searchResponse.title
        releaseDateLabel.text = searchResponse.year
    }
}
