//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by 백대홍 on 11/5/24.
//
// 해당 익스텐션에서 알림 List에 대해 데이터소스 역할을 하는 모든 동작을 포함
import UIKit

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Int, String>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: String) {
        let reminder = Reminder.sampleData[indexPath.item]
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = reminder.title
        contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfiguration
    }
}
