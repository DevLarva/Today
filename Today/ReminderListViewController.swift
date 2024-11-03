//
//  ViewController.swift
//  Today
//
//  Created by 백대홍 on 11/3/24.
//

import UIKit

class ReminderListViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // listLayout 메서드를 호출하여 레이아웃을 설정하고, 이를 컬렉션 뷰의 레이아웃에 할당
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
    }
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        // 위에서 설정된 리스트 구성을 사용하여 UICollectionViewCompositionalLayout 반환
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}


// UICollectionViewCompositionalLayout?
// https://developer.apple.com/documentation/uikit/uicollectionviewcompositionallayout

