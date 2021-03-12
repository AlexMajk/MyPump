//
//  WatchTableViewCell.swift
//  MyPump
//
//  Created by пользователь on 3/10/21.
//

import UIKit
import WebKit

class WatchTableViewCell: UITableViewCell {

    @IBOutlet weak var webView: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let url = URL(string: "https://www.hackingwithswift.com")!
//        webView.load(URLRequest(url: url))
//        webView.allowsBackForwardNavigationGestures = true
    }
    
}
