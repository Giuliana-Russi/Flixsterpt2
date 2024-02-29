//
//  Film.swift
//  FlixsterPt1
//
//  Created by Giuliana Russi on 2/3/24.
//

import Foundation

struct Film: Decodable {
    let title: String
    let poster_path: URL
    let overview: String
    let backdrop_path: URL
    let vote_average : Float
    let vote_count: Int
    let popularity: Float
}

struct FilmsResponse: Decodable {
    let results: [Film]
}


extension Film {
    static var mockFilms: [Film] = [
        Film(title: "Aquaman and the Lost Kingdom", poster_path: URL(string: "https://image.tmdb.org/t/p/original/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg")!, overview: "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.", backdrop_path: URL(string: "https://image.tmdb.org/t/p/original/cnqwv5Uz3UW5f086IWbQKr3ksJr.jpg")!, vote_average: 6.976, vote_count: 1291, popularity: 1870.622),
        Film(title: "Lift", poster_path: URL(string: "https://image.tmdb.org/t/p/original/gma8o1jWa6m0K1iJ9TzHIiFyTtI.jpg")!, overview: "An international heist crew, led by Cyrus Whitaker, race to lift $500 million in gold from a passenger plane at 40,000 feet.", backdrop_path: URL(string: "https://image.tmdb.org/t/p/original/rz8GGX5Id2hCW1KzAIY4xwbQw1w.jpg")!, vote_average: 6.505, vote_count: 647, popularity: 683.568),
        Film(title: "Argylle", poster_path: URL(string: "https://image.tmdb.org/t/p/original/siduVKgOnABO4WH4lOwPQwaGwJp.jpg")!, overview: "When the plots of reclusive author Elly Conway's fictional espionage novels begin to mirror the covert actions of a real-life spy organization, quiet evenings at home become a thing of the past. Accompanied by her cat Alfie and Aiden, a cat-allergic spy, Elly races across the world to stay one step ahead of the killers as the line between Conway's fictional world and her real one begins to blur.", backdrop_path: URL(string: "https://image.tmdb.org/t/p/original/8te0oIAuUOxi03RbM1SfL3xUYHB.jpg")!, vote_average: 6.655, vote_count: 87, popularity: 397.608),
        Film(title: "Wonka", poster_path: URL(string: "https://image.tmdb.org/t/p/original/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!, overview: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.", backdrop_path: URL(string: "https://image.tmdb.org/t/p/original/yyFc8Iclt2jxPmLztbP617xXllT.jpg")!, vote_average: 7.234, vote_count: 1763, popularity: 2244.452),
        Film(title: "The Underdoggs", poster_path: URL(string: "https://image.tmdb.org/t/p/original/lffRj9dg53EumzklwzWWv18LXvg.jpg")!, overview: "Jaycen 'Two Js' Jennings is a washed-up former pro football star who has hit rock bottom. When sentenced to community service coaching the Underdoggs, an unruly pee-wee football team in his hometown, he sees it mostly as an opportunity to rebuild his public image. But in the process, he may just turn his life around and rediscover his love of the game.", backdrop_path: URL(string: "https://image.tmdb.org/t/p/original/dT1bXXEd7cfuVsB7CMvOKYiRZWl.jpg")!, vote_average: 6.4, vote_count: 23, popularity: 674.683)
        
    ]
}
