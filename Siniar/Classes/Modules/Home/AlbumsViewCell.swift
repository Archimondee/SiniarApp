//
//  AlbumsViewCell.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 01/04/23.
//

import UIKit

class AlbumsViewCell: UITableViewCell {
  weak var collectionView: UICollectionView!

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    setup()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func setup() {
    backgroundColor = .clear
    selectionStyle = .none

    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    contentView.addSubview(collectionView)
    self.collectionView = collectionView
    collectionView.backgroundColor = .clear
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.showsVerticalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      collectionView.heightAnchor.constraint(equalToConstant: 200)
    ])
    collectionView.register(AlbumViewCell.self, forCellWithReuseIdentifier: "albumCellId")
  }
}
