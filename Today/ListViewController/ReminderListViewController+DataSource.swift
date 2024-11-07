//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by 백대홍 on 11/5/24.
//
// 해당 익스텐션에서 알림 List에 대해 데이터소스 역할을 하는 모든 동작을 포함
// 구성 반환 메서드 -> 어떤 특정한 설정이나 구성을 생성하고 반환

import UIKit

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Reminder.ID>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Int, Reminder.ID>
    
    // 셀을 구성할때 사용하는 핸들러 메서드
    func cellRegistrationHandler(
        cell:
            UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID
    ) {
        // 인덱스에 해당하는 객체 가져오기
        let reminder = reminders[indexPath.item]
        // 셀의 기본 콘텐츠 설정 생성
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = reminder.title
        contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfiguration
        
        //완료 버튼 구성 생성
        var doneButtonConfiguration = doneButtonConfiguration(for: reminder)
        doneButtonConfiguration.tintColor = .todayListCellDoneButtonTint
        cell.accessories = [
            .customView(configuration: doneButtonConfiguration), .disclosureIndicator(displayed: .always)
        ]
        
        cell.accessories = [.customView(configuration: doneButtonConfiguration)]
        // listGroupedCell()는 iOS 18.0 부터는 rename listGroupedCell() --> listCell()
        var backgroundConfiguration = UIBackgroundConfiguration.listCell()
        // 셀의 배경색
        backgroundConfiguration.backgroundColor = .todayListCellBackground
        // 배경색 적용
        cell.backgroundConfiguration = backgroundConfiguration
    }
    
    // 완료 버튼의 구성 반환 메서드
    private func doneButtonConfiguration(for reminder: Reminder)
    -> UICellAccessory.CustomViewConfiguration
    {
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
}
