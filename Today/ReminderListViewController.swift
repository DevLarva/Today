//
//  ViewController.swift
//  Today
//
//  Created by 백대홍 on 11/3/24.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // listLayout 메서드를 호출하여 레이아웃을 설정하고, 이를 컬렉션 뷰의 레이아웃에 할당
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        // 셀 등록 구성: 셀 생성 시마다 실행될 클로저를 정의
        let cellRegistration = UICollectionView.CellRegistration {
            (cell: UICollectionViewListCell, IndexPath: IndexPath, itemIdentifier: String) in
            // 인덱스에 해당하는 Reminder 객체 가져오기
            let reminder = Reminder.sampleData[IndexPath.item]
            // 셀의 기본 콘텐츠 설정
            var contentConfiguration = cell.defaultContentConfiguration()
            // 제목 설정
            contentConfiguration.text = reminder.title
            // 셀에 콘텐츠 설정 적용
            cell.contentConfiguration = contentConfiguration
        }
        // 데이터 소스 초기화: 컬렉션 뷰와 셀 등록 클로저를 이용해 구성
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, IndexPath: IndexPath, itemIdentifier: String) in
            // 설정된 셀 등록을 통해 셀 재사용 및 반환
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: IndexPath, item: itemIdentifier)
            
        }
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

