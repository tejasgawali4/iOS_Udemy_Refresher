
import UIKit

class MessageCellTableViewCell: UITableViewCell {

    @IBOutlet weak var RightAvtarImg: UIImageView!
    @IBOutlet weak var MessageLbl: UILabel!
    @IBOutlet weak var LeftAvatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
