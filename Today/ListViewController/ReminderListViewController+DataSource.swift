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
    
    func updateSnapshot(reloading ids: [Reminder.ID] = []) {
        // 스냅샷을 생성하고, 초기 데이터로 구성
        var snapshot = SnapShot()
        snapshot.appendSections([0])
        // Reminder 객체의 제목들을 아이템으로 추가
        snapshot.appendItems(reminders.map { $0.id })
        // 배열이 비어 있지 않다면 스냅샷에 식별자에 대한 remider를 다시 로드
        if  !ids.isEmpty {
            snapshot.reloadItems(ids)
        }
        // 스냅샷을 데이터 소스에 적용하여 컬렉션 뷰에 표시되도록 함
        dataSource.apply(snapshot)
    }
    
    // 셀을 구성할때 사용하는 핸들러 메서드
    func cellRegistrationHandler(
        cell:
            UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID
    ) {
        // 인덱스에 해당하는 객체 가져오기
        let reminder = reminder(withID: id)
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
    // remider 배열에서 해당 알림을 반환하는 메서드
    func reminder(withID id: Reminder.ID) -> Reminder {
        let index = reminders.indexOfReminder(withId: id)
        return reminders[index]
    }
    // 알림 업데이트 메서드
    func updateReminder(_ reminder: Reminder) {
        let index = reminders.indexOfReminder(withId: reminder.id)
        reminders[index] = reminder
    }
    // 모델에서 Remider.ID를 허용하기 위한 메서드
    func completeReminder(withId id: Reminder.ID) {
        var reminder = reminder(withID: id)
        reminder.isComplete.toggle()
        updateReminder(reminder)
        updateSnapshot(reloading: [id])
    }
    
    // 완료 버튼의 구성 반환 메서드
    private func doneButtonConfiguration(for reminder: Reminder)
    -> UICellAccessory.CustomViewConfiguration
    {
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = RemiderDoneButton()
        button.addTarget(self, action: #selector(didPressDoneButton(_:)), for: .touchUpInside)
        button.id = reminder.id
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
}
