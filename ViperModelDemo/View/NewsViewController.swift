//
//  NewsViewController.swift
//  ViperModelDemo
//
//  Created by Vaishak Iyer on 19/06/19.
//  Copyright © 2019 Vaishak Iyer. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,PresenterToViewProtocol {
   
    @IBOutlet weak var newsTable: UITableView!
    
    var presenter : ViewToPresenterProtocol?
    var articleArray: [Article]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTable.dataSource = self
        newsTable.estimatedRowHeight = 202
        newsTable.rowHeight = UITableView.automaticDimension
        presenter?.updateView()
        // Do any additional setup after loading the view.
    }
    
    func showLiveNews(news: NewsModel) {
        articleArray = news.articles
        DispatchQueue.main.async {
            self.newsTable.reloadData()
        }
       
    }
    
    func showError() {
        let alertVC = UIAlertController(title: "", message: "Common this was easy bro!!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension NewsViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleArray?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTable.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell
        
        cell?.author.text = articleArray?[indexPath.row].author
        cell?.headline.text = articleArray?[indexPath.row].title
        cell?.content.text = articleArray?[indexPath.row].articleDescription
        cell?.thumbnail.downloaded(from: articleArray?[indexPath.row].urlToImage ?? "", contentMode: .scaleAspectFit)
        
        return cell!
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

