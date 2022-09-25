//
//  ContentView.swift
//  movie.
//
//  Created by Fatma Alhaifi on 21/09/2022.
//

import SwiftUI
struct CastMember: Identifiable {
    let id = UUID()
    let castName: String
    let castImage: String
}
struct MovieInfo: Identifiable {
    let id = UUID()
    let movieTitle : String
    let movieImage : String
    let cast: [CastMember]
}
struct ContentView: View {
    let Movies = [
        MovieInfo(
            movieTitle: "Joker",
            movieImage: "joker",
        cast: [
            CastMember(castName: "JoaquinPhoenix (Joker)",
                       castImage: "jo"),
            CastMember(castName: "Robert De Niro (Murray)",
                       castImage: "ro"),
            CastMember(castName: "Frances Conroy (Penny Fleck)",
                       castImage: "fr"),
            CastMember(castName: "Zazie Beetz (Sophie)",
                       castImage: "z"),
            CastMember(castName: "Bryan Callen (Javier)",
                       castImage: "br")
            ]
        ),
        MovieInfo(
            movieTitle: "RAMBO",
            movieImage: "rambo",
        cast: [
                CastMember(castName: "Sylvester Stallone (rambo)",
                           castImage: "sy"),
                CastMember(castName: "YVette Monreal (Gabrielle)", castImage: "yve"),
                CastMember(castName: "Martin Kove (Ericson)",
                           castImage: "martin"),
                CastMember(castName: "Richard Crenna (Sam)",
                           castImage: "richard")
            ]
        ),
        MovieInfo(
            movieTitle: "The Lion King",
            movieImage: "The Lion King",
            cast: [
                CastMember(castName: "Beyoncé (Nala)",
                           castImage: "Beyoncé"),
                CastMember(castName: "Donald Glover (Simba)",
                           castImage: "donaldGlover"),
                CastMember(castName: "Billy Eichner (Timon)",
                           castImage: "billy"),
                CastMember(castName: "James Earl Jones (Mufasa)",
                           castImage: "james"),
                CastMember(castName: "JD McCrary (Simba)",
                           castImage: "jd"),
                CastMember(castName: "Seth Rogen (Pumbaa)",
                           castImage: "seth")
                ]
            ),
    ]
    var body: some View {
        NavigationView {
        List {
            ForEach(Movies) { movie in
                // to get other view:
                NavigationLink(destination:
                        //Text(movie.movieTitle)
                    MovieDetails(Movie: movie)) {
                    MovieListItem( Movie : movie)
                }
                
            }
        }
        .navigationTitle("Movies")
        }
        .accentColor(.white) //to get white navigation botton instead of blue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MovieDetails: View {  //other view (next page)
    let Movie : MovieInfo
    var body: some View {
        ZStack{
            Color.gray // to get darker background image
            Image(Movie.movieImage)
                .resizable()
                //.scaledToFit()
                .opacity(0.5)
                .blur(radius: 8)
            VStack{
            Image(Movie.movieImage)
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .padding(5)
                .background(.white)
                .clipShape(Circle())
            Text(Movie.movieTitle)
                .font(.largeTitle)
                .foregroundColor(.white)
            ScrollView(.horizontal) {
                HStack{
                    ForEach(Movie.cast) { CastMember in
                        VStack{
                            Image(CastMember.castImage)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                            Text(CastMember.castName)
                        }
                    }
                }
            }
            }
        }
        //.foregroundColor(.white)
        .ignoresSafeArea()
    }
}
struct MovieListItem: View {
    let Movie : MovieInfo
    //let movieTitle : String
   // let movieImage : String
    var body: some View {
        HStack {
            Image(Movie.movieImage)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text(Movie.movieTitle)
                //.font(.headline)
                .font(.system(size: 25))
               //.font(.title)
                
            
        }
        // .padding()
        //.navigationTitle("Movies")
    }
}
