//
//  Date+Today.swift
//  Today
//
//  Created by 백대홍 on 11/5/24.
//

import Foundation

extension Date {
    // 현재 날짜를 "날짜 및 시간" 형태의 문자열로 변환해 반환해주는 계산
    var dayAndTimeText: String {
        //날짜 형식 제외, 시간만 짧게 표시
        let timeText = formatted(date: .omitted, time: .shortened)
        //현재 날짜가 오늘이라면 아래와 같은 형태로 반환
        if Locale.current.calendar.isDateInToday(self) {
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            //문자열을 포맷팅해서 반환
            return String(format: timeFormat, timeText)
        } else {
            // 오늘이 아니면 날짜는 월과 일만 표시
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
            return String(format: dateAndTimeFormat, dateText, timeText)
        }
    }
}
