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
        // 커스텀 포맷을 사용해 날짜 및 시간 문자열 생성
        let timeText = self.formatted(customFormat)

        // 현재 날짜가 오늘인 경우 "Today at [시간]" 형식으로 반환
        if Locale.current.calendar.isDateInToday(self) {
            let timeFormat = NSLocalizedString("오늘은 %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText)
        } else {
            // 오늘이 아닌 경우 날짜와 시간을 포함한 형식으로 반환
            let dateText = self.formatted(customFormat)
            let dateAndTimeFormat = NSLocalizedString("%@부터 %@", comment: "Date and time format string")
            return String(format: dateAndTimeFormat, dateText, timeText)
        }
    }

}
// 커스텀 한글 포맷
let customFormat = Date.FormatStyle()
    .month(.wide)
    .day(.twoDigits)
    .year(.defaultDigits)
    .locale(Locale(identifier: "ko_KR"))
