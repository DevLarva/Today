//
//  ReminderListViewController.swift
//  Today
//
//  Created by 백대홍 on 11/3/24.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    // DataSource, snapShot의 유형을 Int, String으로 설정하는 타입 별칭
//    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
//    typealias SnapShot = NSDiffableDataSourceSnapshot<Int, String>
    
    var dataSource: DataSource!
    // 샘플 데이터로 배열 초기화
    var reminders: [Reminder] = Reminder.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // listLayout 메서드를 호출하여 레이아웃을 설정하고, 이를 컬렉션 뷰의 레이아웃에 할당
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        // 셀 등록 구성: 셀 생성 시마다 실행될 클로저를 정의
        // 위 코드로 대체
//        let cellRegistration = UICollectionView.CellRegistration {
//            (cell: UICollectionViewListCell, IndexPath: IndexPath, itemIdentifier: String) in
//            // 인덱스에 해당하는 Reminder 객체 가져오기
//            let reminder = Reminder.sampleData[IndexPath.item]
//            // 셀의 기본 콘텐츠 설정
//            var contentConfiguration = cell.defaultContentConfiguration()
//            // 제목 설정
//            contentConfiguration.text = reminder.title
//            // 셀에 콘텐츠 설정 적용
//            cell.contentConfiguration = contentConfiguration
//        }
        // 데이터 소스 초기화: 컬렉션 뷰와 셀 등록 클로저를 이용해 구성
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, IndexPath: IndexPath, itemIdentifier: Reminder.ID) in
            // 설정된 셀 등록을 통해 셀 재사용 및 반환
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: IndexPath, item: itemIdentifier)
        }
        
        // 스냅샷을 생성하고, 초기 데이터로 구성
        var snapshot = SnapShot()
        snapshot.appendSections([0])
        // Reminder 객체의 제목들을 아이템으로 추가
        snapshot.appendItems(reminders.map { $0.id })
//        아래 코드 == 위 코드 줄이기 전 코드
//        var remiderTitles = [String]()
//        for reminder in Reminder.sampleData {
//            remiderTitles.append(reminder.title)
//        }
//        snapshot.appendItems(remiderTitles)
        // 스냅샷을 데이터 소스에 적용하여 컬렉션 뷰에 표시되도록 함
        dataSource.apply(snapshot)
        // 데이터 소스를 컬렉션 뷰의 dataSource로 설정
        collectionView.dataSource = dataSource
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

