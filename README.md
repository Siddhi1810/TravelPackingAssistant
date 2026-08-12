# Travel Packing Assistant

A personalized travel packing assistant built in **Haskell**.

The program asks users about their trip and creates a customized packing list based on their destination, trip length, weather, trip type, activities, international travel, cultural preferences, and personal items.

## Features

* Creates a personalized packing list
* Adjusts clothing quantities based on trip length
* Recommends items based on weather and planned activities
* Provides cultural and religious clothing suggestions when requested
* Includes travel documents, toiletries, electronics, snacks, and other essentials
* Allows users to add their own personal items
* Removes duplicate items from the final packing list

## Functional Programming

This project uses several functional programming concepts in Haskell:

* Pure functions
* Recursion
* Pattern matching
* Guards
* Lists and list processing
* Higher-order functions such as `map`, `filter`, and `any`
* Immutable data

Instead of relying on traditional loops or repeatedly changing variables, the program uses separate functions to generate and process lists of packing recommendations.

## Design

The program separates the packing logic into functions for clothing, weather, trip type, activities, documents, cultural recommendations, and other essentials.

These functions return lists that are combined and processed to create one final packing list. This keeps the recommendation logic separate from the user interaction in `main`.

## How to Run

The program requires Haskell and GHC.

You can check whether GHC is installed by running:

```bash
ghc --version
```

From the Travel Packing Assistant project folder, run:

```bash
runghc Main.hs
```

The program will then ask questions about the trip and generate the packing list in the terminal.

## Example

Example user input:

```text
Where are you travelling?
India

How many days is your trip?
7

What kind of weather are you expecting?
1. Hot
2. Cold
3. Rainy
4. Mixed
1

What type of trip is this?
1. Vacation
2. Business
3. Study
4. Visiting family/friends
1

Will you be doing any special activities?
swimming, hiking, temple

Do you want cultural/religious clothing suggestions?
yes

Will you be travelling internationally?
yes
```

Part of the generated packing list:

```text
[ ] 7 shirts/tops
[ ] 4 pants/shorts/bottoms
[ ] 8 underwear
[ ] 8 pairs of socks
[ ] Lightweight clothes
[ ] Sunscreen
[ ] Sunglasses
[ ] Swimsuit
[ ] Swimming goggles
[ ] Hiking shoes
[ ] Backpack
[ ] Passport
[ ] Visa if required
[ ] Scarf/shawl
```

The recommendations change depending on the destination, weather, activities, trip type, and other information entered by the user.

## Project Structure

```text
TravelPackingAssistant/
├── Main.hs
├── README.md
└── .gitignore
```

`Main.hs` contains the complete Travel Packing Assistant program and its functional logic.

## Future Improvements

Possible future improvements include:

* Supporting more destinations and activities
* Saving generated packing lists to a file
* Adding recommendations based on season and more detailed destination information

## Course Connection

This project was created for **CS3003 Programming Languages – Summer 2026**.

It demonstrates how the functional programming paradigm can be used to create a practical and interactive application. Haskell's use of functions, recursion, pattern matching, immutable data, and list operations influenced how the program was designed and implemented.

## Author

Siddhi Sheth

