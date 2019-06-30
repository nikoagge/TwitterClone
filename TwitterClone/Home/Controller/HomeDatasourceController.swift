//
//  HomeDatasourceController.swift
//  TwitterClone
//
//  Created by Nikolas on 28/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import LBTAComponents
import TRON
import SwiftyJSON


class HomeDatasourceController: DatasourceController {
    
    
    let errorMessageLabel: UILabel = {
        
        let eml = UILabel()
        eml.text = "Sorry, something went wrong. Please try again."
        eml.textAlignment = .center
        eml.numberOfLines = 0
        eml.isHidden = true
        
        return eml
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //setupHomeDatasource()
        NetworkService.sharedInstance.fetchHomeFeed { (homeDatasource, error) in
            
            if let error = error {
                
                self.errorMessageLabel.isHidden = false
                
                if let apiError = error as? APIError<JSONError> {
                    
                    if apiError.response?.statusCode != 200 {
                        
                        self.errorMessageLabel.text = "Status code was not 200"
                        
                        return
                    }
                }
                
                return
            }
            
            self.datasource = homeDatasource
        }
        setupNavigationBarItems()
        setupCollectionView()
        setupViews()
    }
//    func setupHomeDatasource() {
//
//        let homeDatasource = HomeDatasource()
//        self.datasource = homeDatasource
//    }
    
    
    private func setupNavigationBarItems() {
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        //First bar button start from the right edge.
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        //To remove separatorLineView to the top:
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        view.addSubview(navBarSeparatorView)
        
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    
    func setupCollectionView() {
        
        collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
    }
    
    
    private func setupViews() {
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
    }
    
    
    func estimatedHeight(forText text: String) -> CGFloat {
        
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.height
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 1 {
            
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 64)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            
            
            guard let user = self.datasource?.item(indexPath) as? User else { return .zero }
            
            //Get an estimation of the height of the cell based on user.bioText
            let estimatedHeightValue = estimatedHeight(forText: user.bioText)
            
            return CGSize(width: view.frame.width, height: estimatedHeightValue + 66)
            //12 is the padding of the profileImageView and the view-screen, 50 is the actual width of profileImageView. Lastly we must also give a little more padding thus second - 12.
//            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
//
//            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
//
//            //Because in bioTextView declaration set fontSize of 15, I write following line:
//            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
                
            
        } else if indexPath.section == 1 {
            
            //Size estimation for tweets.
        
            guard let tweet = datasource?.item(indexPath) as? Tweet else { return .zero }
            
            let estimatedHeightValue = estimatedHeight(forText: tweet.message)
            
            return CGSize(width: view.frame.width, height: estimatedHeightValue + 74)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        collectionViewLayout.invalidateLayout()
    }
}
