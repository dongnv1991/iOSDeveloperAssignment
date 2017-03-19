//
//  MainViewController.swift
//  AplicationiOS
//
//  Created by Dong Nguyen on 3/19/17.
//  Copyright © 2017 TVT25. All rights reserved.
//

import UIKit
import AVFoundation
import MBProgressHUD


class MainViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - VAR
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var datas : Array<Result> = []
    
    var audioPlayer : AVPlayer?
    
    var mbHUD : MBProgressHUD? = MBProgressHUD()
    
    var lblNoResult = UILabel()
    
    //MARK: - SELF
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupUI()
        setupVar()
    }
    
    
    //MARK: - SETUP UI & VAR
    func setupVar() {
    }
    
    func setupUI() {
        self.title = "Search"
        self.searchBar.delegate = self
        
        //Tableview
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView.init()
        
        // Label No Result
        lblNoResult = UILabel.init(frame: tableView.frame)
        lblNoResult.text = "No Result"
        lblNoResult.textAlignment = .center

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        let model = datas[indexPath.row]
        cell.setUIWithModel(model: model)
        
        // Handle button play
        
        cell.didTouchBtnPlay = { [weak self] in
            do {
                self?.mbHUD = MBProgressHUD.showAdded(to: (self?.view)!, animated: true)
                let playerItem = AVPlayerItem(url:  NSURL.init(string: model.previewUrl)! as URL)
                
                self?.audioPlayer = AVPlayer.init(playerItem: playerItem)
                self?.audioPlayer!.play()
                self?.audioPlayer?.addObserver(self!, forKeyPath: "status", options: .new, context: nil)
            } 
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    
    
    //MARK: - FILL DATA
    func fillData() {
        
        
    }
    
    
    //MARK: - CALL API
    
    func searchTrack(keyword : String) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        APIServices.shareInstance.search(keyword: keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!) { [weak self](isSuccess, data, error) in
            hud.hide(animated: true)
            if isSuccess! {
                if let model = data as? SearchJSONModel {
                    if model.results.count > 0 {
                        self?.datas = model.results as! Array<Result>
                    } else {
                        self?.datas = []
                        self?.tableView.backgroundView = self?.lblNoResult
                    }
                    self?.tableView.reloadData()
                }
                
            }
            
        }
    }
    //MARK: - BUTTON ACTION
    
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTrack(keyword: searchBar.text!)
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    //MARK: - ORDER FUNC
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (object as? AVPlayer == audioPlayer && keyPath! == "status") {
            if (audioPlayer?.status == AVPlayerStatus.readyToPlay) {
                mbHUD?.hide(animated: true)
            } else if (audioPlayer?.status == AVPlayerStatus.failed) {
                mbHUD?.hide(animated: true)
            }
            audioPlayer?.removeObserver(self, forKeyPath: "status")
        }
    }
    
    //MARK: - THE END!
}
