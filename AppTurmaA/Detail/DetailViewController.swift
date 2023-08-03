import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieImageView.layer.cornerRadius = 8
        movieImageView.layer.masksToBounds = true
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.backgroundColor = .blue
        
        movieTitle.text = movie.title
    }
}
