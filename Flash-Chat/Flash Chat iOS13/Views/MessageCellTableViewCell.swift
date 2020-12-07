
import UIKit

class MessageCellTableViewCell: UITableViewCell {

    @IBOutlet weak var RightAvtarImg: UIImageView!
    @IBOutlet weak var MessageLbl: UILabel!
    @IBOutlet weak var LeftAvatarImg: UIImageView!
    @IBOutlet weak var messageBubble: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubble.layer.cornerRadius = MessageLbl.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
