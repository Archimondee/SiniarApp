//
//  HomeController.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 01/04/23.
//

import UIKit

class HomeViewController: UIViewController {
  weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  func setup() {
    title = "Home"
    if #available(iOS 11.0, *) {
      navigationController?.navigationBar.prefersLargeTitles = true
    }
    let tableView = UITableView(frame: .zero, style: .grouped)
    view.addSubview(tableView)
    self.tableView = tableView
    tableView.showsVerticalScrollIndicator = false
    tableView.showsHorizontalScrollIndicator = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = .clear
    tableView.separatorStyle = .none
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    tableView.register(AlbumsViewCell.self, forCellReuseIdentifier: "albumsCellId")
    tableView.register(MusicViewCell.self, forCellReuseIdentifier: "musicCellId")
    tableView.dataSource = self
    tableView.delegate = self
  }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 1
    case 1:
      return 10
    default:
      return 0
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "albumsCellId", for: indexPath) as! AlbumsViewCell
      cell.collectionView.dataSource = self
      cell.collectionView.delegate = self
      // if data set it will reload data
      cell.collectionView.reloadData()
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "musicCellId", for: indexPath) as! MusicViewCell

      cell.noLabel.text = String(format: "%2d", indexPath.row + 1)
      cell.thumbImageView.image = UIImage(named: "img_ftux3")
      cell.titleLabel.text = "Lorem ipsum dolor index \(indexPath.row)"
      cell.subtitleLabel.text = "Dolor dolor sit amet"

      cell.delegate = self

      return cell
    default:
      return UITableViewCell()
    }
  }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = UIView(frame: .zero)
    let label = UILabel(frame: .zero)
    view.addSubview(label)
    label.textColor = UIColor.Siniar.neutral1
    label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
      label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
    ])
    switch section {
    case 0:
      label.text = "New Albums"

      let button = UIButton(type: .system)
      view.addSubview(button)
      button.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        // Sejajar dengan label
        button.centerYAnchor.constraint(equalTo: label.centerYAnchor)
      ])
      button.setTitle("View All", for: .normal)
      button.tintColor = UIColor.Siniar.neutral1
      button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    case 1:
      label.text = "Recently Music"

    default:
      break
    }

    // button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)

    return view
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 56
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 56
  }

  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let view = UIView(frame: .zero)
    view.backgroundColor = .clear
    return view
  }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCellId", for: indexPath) as! AlbumViewCell

    cell.imageView.image = UIImage(named: "img_ftux3")
    cell.titleLabel.text = "Lorem ipsum"
    cell.subtitleLabel.text = "Dolor dolor sit amet"

    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 200, height: 200)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    // Margin
    return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
}

// MARK: - MusicViewCellDelegate

extension HomeViewController: MusicViewCellDelegate {
  func musicViewCellMoreButtonTapped(_ cell: MusicViewCell) {
    if let indexPath = tableView.indexPath(for: cell) {
      let alert = UIAlertController(title: "More", message: "More button at \(indexPath.row) tapped", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default))
      present(alert, animated: true)
    }
  }
}
