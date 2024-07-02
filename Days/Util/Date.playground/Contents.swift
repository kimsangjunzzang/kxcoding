import UIKit

let worldCup2002Date = Date(year: 2002,month: 5, day: 31)

Date.today.days(from: worldCup2002Date)

let event = Event(
    date: worldCup2002Date,
    title: "2002년 월드컵 개막일",
    backgroundColor: .red,
    textColor: .white,
    icon: "")

event.daysString
