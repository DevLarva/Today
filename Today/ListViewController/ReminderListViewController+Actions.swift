//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by 백대홍 on 11/8/24.
//
// reminder 식별자를 저장하는 사용자 지정 버튼을 만들고, 사용자가 버튼을 탭할때 호출할 함수 정의
import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: RemiderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
