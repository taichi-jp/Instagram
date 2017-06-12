import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //PostDataの内容をセル内に配置したイメージやキャプションラベルに反映させる
    func setPostData(postData: PostData) {
        self.postImageView.image = postData.image
        
        //文章（キャプション + コメント）
        var text = "\(postData.name!) : \(postData.caption!)\n\n"
        for comment in postData.comments {
            text = text + "\(comment["name"]!): \(comment["text"]!)\n"
        }
        self.captionLabel.text = text
        
        //いいね
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        //日付のフォーマット
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString:String = formatter.string(from: postData.date! as Date)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        }
    }
}
