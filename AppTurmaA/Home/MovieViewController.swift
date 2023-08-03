import UIKit

class MoviewViewController: UIViewController {
    private let movies: [Movie] = [
        .init(title: "Homem Formiga", releaseDate: "12/12/12", imageURL: ""),
        .init(title: "Guardiões da Galáxia Vol. 3", releaseDate: "12/12/12", imageURL: ""),
        .init(title: "Resgate 2", releaseDate: "12/12/12", imageURL: ""),
        .init(title: "A volta dos que não foram", releaseDate: "12/12/12", imageURL: ""),
        .init(title: "Elementos", releaseDate: "12/12/12", imageURL: "")
    ]
    
    // 1
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Filmes populares"
        return label
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        addViewsInHierarchy()
        setupConstraints()
    }
    
    // 2
    private func addViewsInHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    // 3
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MoviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieCell()
        let movie = movies[indexPath.row]
        cell.setup(movie: movie)
        return cell
    }
}

extension MoviewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailViewController.self))
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        detailViewController.movie = movie
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
