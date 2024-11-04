//
//  Reminder.swift
//  Today
//
//  Created by 백대홍 on 11/3/24.
//

import Foundation


struct Reminder {
    var title: String
    var dueDate: Date
    var notes: String? = nil
    // notes는 'String' 타입의 옵셔널 변수이며, 초기값으로 'nil'을 가집니다.
    // 즉,'notes'는 현재 값을 가지고 있지 않음을 의미하며,
    // 나중에 문자열 값이 할당될 수도 있습니다.
    var isComplete: Bool = false
}

#if DEBUG
//#if DEBUG와 #endif 사이의 코드는 디버그 빌드에서만 활성화됩니다.
extension Reminder {
    static var sampleData = [
            Reminder(
                title: "Submit reimbursement report", dueDate: Date().addingTimeInterval(800.0),
                notes: "Don't forget about taxi receipts"),
            Reminder(
                title: "Code review", dueDate: Date().addingTimeInterval(14000.0),
                notes: "Check tech specs in shared folder", isComplete: true),
            Reminder(
                title: "Pick up new contacts", dueDate: Date().addingTimeInterval(24000.0),
                notes: "Optometrist closes at 6:00PM"),
            Reminder(
                title: "Add notes to retrospective", dueDate: Date().addingTimeInterval(3200.0),
                notes: "Collaborate with project manager", isComplete: true),
            Reminder(
                title: "Interview new project manager candidate",
                dueDate: Date().addingTimeInterval(60000.0), notes: "Review portfolio"),
            Reminder(
                title: "Mock up onboarding experience", dueDate: Date().addingTimeInterval(72000.0),
                notes: "Think different"),
            Reminder(
                title: "Review usage analytics", dueDate: Date().addingTimeInterval(83000.0),
                notes: "Discuss trends with management"),
            Reminder(
                title: "Confirm group reservation", dueDate: Date().addingTimeInterval(92500.0),
                notes: "Ask about space heaters"),
            Reminder(
                title: "Add beta testers to TestFlight", dueDate: Date().addingTimeInterval(101000.0),
                notes: "v0.9 out on Friday")
        ]
}
#endif
