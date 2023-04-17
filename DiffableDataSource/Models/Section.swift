//
//  Section.swift
//  DiffableDataSource
//
//  Created by Vaibhav Parmar on 18/11/20.
//

import Foundation

enum NewsType {
    case trending
    case weekly
}

class Section: Hashable {
    
    var id = UUID()
    var type: NewsType
    var title: String
    var newsList: [News]

    init(type: NewsType, title: String, newsList: [News]) {
        self.type = type
        self.title = title
        self.newsList = newsList
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    static func == (lhs: Section, rhs: Section) ->Bool {
        return lhs.id == rhs.id
    }
    
}

private let trendingNews = [
    News(image: #imageLiteral(resourceName: "digital_license"),
         title: "Are digital license plates the future? High-tech plates enable message displays, registration renewal",
         sourceImage: #imageLiteral(resourceName: "usa-today"),
         sourceName: "USA Today",
         description: "About a year ago, Williams, 52, bought a battery-operated digital license plate. He liked its sleek look, which complemented the futuristic design of his 2017 all-electric Tesla Model S, he said.",
         postedTime: "4 hours ago"),
    News(image: #imageLiteral(resourceName: "digital_license"),
         title: "Are digital license plates the future? High-tech plates enable message displays, registration renewal",
         sourceImage: #imageLiteral(resourceName: "usa-today"),
         sourceName: "USA Today",
         description: "About a year ago, Williams, 52, bought a battery-operated digital license plate. He liked its sleek look, which complemented the futuristic design of his 2017 all-electric Tesla Model S, he said.",
         postedTime: "4 hours ago")]

private let weeklyNews = [
    News(image: #imageLiteral(resourceName: "space_x"),
         title: "'Godspeed': 4 astronauts make history as SpaceX's 'Resilience' launches for International Space Station",
         sourceImage: #imageLiteral(resourceName: "usa-today"),
         sourceName: "USA Today",
         description: "It’s made of titanium, aluminum and carbon fiber. It can withstand temperatures exceeding 2,700 degrees Fahrenheit as it barrels through Earth’s atmosphere – but it’s more than a spacecraft. To the astronauts that named the capsule, it’s a symbol of what mankind can accomplish in the face of extreme adversity.", postedTime: "4 hours ago"),
    News(image: #imageLiteral(resourceName: "space_x"),
         title: "'Godspeed': 4 astronauts make history as SpaceX's 'Resilience' launches for International Space Station",
         sourceImage: #imageLiteral(resourceName: "usa-today"),
         sourceName: "USA Today",
         description: "It’s made of titanium, aluminum and carbon fiber. It can withstand temperatures exceeding 2,700 degrees Fahrenheit as it barrels through Earth’s atmosphere – but it’s more than a spacecraft. To the astronauts that named the capsule, it’s a symbol of what mankind can accomplish in the face of extreme adversity.", postedTime: "4 hours ago")]

private let ukTrendingNews = [
    News(image: #imageLiteral(resourceName: "covid_1"),
         title: "States tightening anti-virus restrictions amid case surge",
         sourceImage: #imageLiteral(resourceName: "ap"),
         sourceName: "AP News",
         description: "IOWA CITY, Iowa (AP) — The deadly rise in COVID-19 cases across the U.S. is forcing state and local officials to adjust their blueprints for fighting the virus, with Republican governors adopting mask mandates — skeptically, in at least one case — and schools scrapping plans to reopen classrooms.",
         postedTime: "53 minutes ago"),
    News(image: #imageLiteral(resourceName: "covid_2"),
         title: "Volunteers still needed to test variety of COVID-19 vaccines",
         sourceImage: #imageLiteral(resourceName: "ap"),
         sourceName: "AP News",
         description: "Two COVID-19 vaccines might be nearing the finish line, but scientists caution it's critical that enough people volunteer to help finish studying other candidates in the U.S. and around the.",
         postedTime: "Yesterday"),
    News(image: #imageLiteral(resourceName: "fda"),
         title: "FDA allows 1st rapid virus test that gives results at home",
         sourceImage: #imageLiteral(resourceName: "ap"),
         sourceName: "AP News", description: "The announcement by the Food and Drug Administration represents an important step in U.S. efforts to expand testing options for COVID-19 beyond health care facilities and testing sites. However, the test will require a prescription, likely limiting its initial use.",
         postedTime: "Yesterday")
]

private let ukWeeklyNews = [
    News(image: #imageLiteral(resourceName: "covid_1"),
         title: "Johnson seeks Downing St reset with ‘green industrial revolution’",
         sourceImage: #imageLiteral(resourceName: "ap"),
         sourceName: "AP News",
         description: "IOWA CITY, Iowa (AP) — The deadly rise in COVID-19 cases across the U.S. is forcing state and local officials to adjust their blueprints for fighting the virus, with Republican governors adopting mask mandates — skeptically, in at least one case — and schools scrapping plans to reopen classrooms.",
         postedTime: "53 minutes ago"),
    News(image: #imageLiteral(resourceName: "covid_2"),
         title: "BoE's Ramsden sees plus for economy from vaccine news",
         sourceImage: #imageLiteral(resourceName: "r"),
         sourceName: "Reuters",
         description: "LONDON (Reuters) - Bank of England Deputy Governor Dave Ramsden said on Tuesday that positive news about COVID-19 vaccines could help to reduce the risks facing Britain’s economy but the central bank was unlikely to revise up its forecasts as a result.",
         postedTime: "Yesterday"),
    News(image: #imageLiteral(resourceName: "fda"),
         title: "Johnson raises ire of Scots independence-seekers with devolution 'disaster' comment",
         sourceImage: #imageLiteral(resourceName: "r"),
         sourceName: "Reuters",
         description: "LONDON (Reuters) - British Prime Minister Boris Johnson has called the devolution of powers to Scotland “a disaster”, a comment that played into the hands of Scottish nationalists as recent polls show a majority of Scots now support independence.",
         postedTime: "Yesterday")
]

extension Section {
    
    static var allSections: [Section] = [
        Section(
            type: .trending,
            title: "Trending News for for UK NRIs",
            newsList: ukTrendingNews),
        Section(
            type: .weekly,
            title: "Weekly News for for UK NRIs",
            newsList: ukWeeklyNews),
        Section(
            type: .trending,
            title: "Trending News for for US NRIs",
            newsList: trendingNews),
        Section(
            type: .weekly,
            title: "Weekly News for for US NRIs",
            newsList: weeklyNews)
    ]
    
}
