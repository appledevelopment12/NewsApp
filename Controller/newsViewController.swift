//
//  newsViewController.swift
//  NewsApp
//
//  Created by Rajeev on 06/08/23.
//

import UIKit

class newsViewController: UIViewController {

    
    var articlesList = [ArticleData]()
    @IBOutlet weak var newstable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    fetchData()

    }
    func fetchData()
    {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=a665a98ab7584650b68b767e083b95f7")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler:{ (data,response,error) in
            guard let data = data , error  == nil else {
                print("error")
                return
            }
            var newsFullList:NewsData?
            do
            {
                newsFullList = try JSONDecoder().decode(NewsData.self,from: data)
            }
            catch
            {
                print("error occured ")
            }
            self.articlesList = newsFullList!.articles
            DispatchQueue.main.async {
                self.newstable.reloadData()
            }
            
        })
        dataTask.resume()
    }

}

extension UIImageView
{
    func downloaded(from url: URL)
    {
        contentMode = .scaleToFill
    let dataTask =   URLSession.shared.dataTask(with: url,completionHandler:{ data,response,error in
            
            
            guard   let httpURLResponse = response as? HTTPURLResponse,httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType,mimeType.hasPrefix("image"),
            let data = data,error == nil,
            let image = UIImage(data: data)
            else
            {
                return
            }
            DispatchQueue.main.async(){
                self.image = image
            }
        })
            dataTask.resume()
    }
//    func downloaded(from link: String,contentMode mode: ContentMode = .scaleAspectFit)
//    {
//        guard let url = URL(string: link) else {return }
//        downloaded(from: url,contentMode: mode)
//    }
}
extension newsViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newstable.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! newsViewCell
        if articlesList[indexPath.row].author != nil
        {
            cell.autherlbl.text = "Author: \(articlesList[indexPath.row].author!)"
            
        }
        else
        {
            cell.autherlbl.text = "No Author available "
        }
        cell.titleLbll.text = articlesList[indexPath.row].title
        if articlesList[indexPath.row].urlToImage != nil
        {
            let url = URL(string: articlesList[indexPath.row].urlToImage!)
            cell.newimg.downloaded(from: url!)
            cell.newimg.contentMode = .scaleToFill
        
        }
        else
        {
            cell.newimg.image = UIImage(named: "empty")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ba")
//        let vc = storyboard?.instantiateViewController(withIdentifier: "newsNavigationViewController") as? newsNavigationViewController
//
//        vc?.newsContent = articlesList[indexPath.row]
//        navigationController?.pushViewController(vc!, animated: true)
        let next = self.storyboard?.instantiateViewController(withIdentifier: "newsNavigationViewController") as! newsNavigationViewController
        next.newsContent = articlesList[indexPath.row]
        self.present(next, animated: true, completion: nil)

    }
  
    
    
}
