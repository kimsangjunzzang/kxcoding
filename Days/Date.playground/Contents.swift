import UIKit

/*

let now = Date()
print(now)

//Reference Date
//Apple Epoch, Cocoa Epoch
// 2001. 1. 1. 00:00:00

var dt = Date(timeIntervalSinceReferenceDate: 60 * 60)
print(dt)

dt = Date(timeIntervalSinceReferenceDate: 60 * 60 * -1)
print(dt)

let oneSec = TimeInterval(1)
let oneMillisecond = TimeInterval(0.001)

// 1분
let oneMin = TimeInterval(60)
// 1 시간
let oneHour = TimeInterval(oneMin * 60)

// 하루
let oneDay = TimeInterval(oneHour * 24)

let after24h = Date(timeIntervalSinceNow: oneDay)
print(after24h)


Calendar.Identifier.gregorian // 달력 인스턴스 생성
 
 */


// DateComponents
let calender = Calendar.current
let now = Date.now

//now.year
let components = calender.dateComponents([Calendar.Component.year,.month,.day], from: now)
components.year
components.month
components.day


let year = calender.component(.year, from: now)

var memorialDayComponents = DateComponents()
memorialDayComponents.year = 2011
memorialDayComponents.month = 10
memorialDayComponents.day = 5

let memorialDay = calender.date(from: memorialDayComponents)

let today = calender.startOfDay(for: Date())

var comps = DateComponents()
comps.day = 100

calender.date(byAdding: comps, to: today)

var challengeComponent = DateComponents()
challengeComponent.year = 2002
challengeComponent.month = 5
challengeComponent.day = 31

if let challengeDate = calender.date(from: challengeComponent) {
    calender.dateComponents([.day], from: challengeDate, to:today).day
}

