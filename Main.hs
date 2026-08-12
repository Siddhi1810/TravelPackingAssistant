module Main where

import Data.Char (toLower)
import Data.List (isInfixOf)

main :: IO ()
main = do
    putStrLn ""
    putStrLn "======================================"
    putStrLn "       TRAVEL PACKING ASSISTANT"
    putStrLn "======================================"
    putStrLn ""

    putStrLn "Where are you travelling?"
    destination <- getLine

    putStrLn "How many days is your trip?"
    daysInput <- getLine
    let days = read daysInput :: Int

    putStrLn "What kind of weather are you expecting?"
    putStrLn "1. Hot"
    putStrLn "2. Cold"
    putStrLn "3. Rainy"
    putStrLn "4. Mixed"
    weather <- getLine

    putStrLn "What type of trip is this?"
    putStrLn "1. Vacation"
    putStrLn "2. Business"
    putStrLn "3. Study"
    putStrLn "4. Visiting family/friends"
    tripType <- getLine

    putStrLn "Will you be doing any special activities?"
    putStrLn "Enter activities separated by commas."
    putStrLn "Example: swimming, hiking, gym, temple, beach"
    activitiesInput <- getLine

    putStrLn "Do you want cultural/religious clothing suggestions? (yes/no)"
    cultureChoice <- getLine

    putStrLn "Will you be travelling internationally? (yes/no)"
    international <- getLine

    putStrLn "Do you want to add your own personal items? (yes/no)"
    customChoice <- getLine

    customItems <-
        if lower customChoice == "yes"
        then do
            putStrLn "Enter personal items separated by commas."
            putStrLn "Example: camera, book, makeup, medicines"
            customInput <- getLine
            return (splitByComma customInput)
        else
            return []

    let activities = map cleanText (splitByComma activitiesInput)

    let clothes = clothingList days weather
    let weatherItems = weatherList weather
    let toiletries = toiletriesList
    let electronics = electronicsList
    let documents = documentList international
    let tripItems = tripTypeList tripType
    let activityItems = activityList activities
    let culturalItems = cultureList destination cultureChoice activities
    let snacks = snackList
    let essentials = essentialList

    let completeList =
            removeDuplicates
                ( clothes
                ++ weatherItems
                ++ toiletries
                ++ electronics
                ++ documents
                ++ tripItems
                ++ activityItems
                ++ culturalItems
                ++ snacks
                ++ essentials
                ++ customItems
                )

    putStrLn ""
    putStrLn "======================================"
    putStrLn "             TRIP SUMMARY"
    putStrLn "======================================"

    putStrLn ("Destination: " ++ destination)
    putStrLn ("Trip length: " ++ show days ++ " days")
    putStrLn ("Weather: " ++ weatherName weather)
    putStrLn ("Trip type: " ++ tripTypeName tripType)

    if null activities
    then putStrLn "Activities: None"
    else putStrLn ("Activities: " ++ joinItems activities)

    putStrLn ""
    putStrLn "======================================"
    putStrLn "         COMPLETE PACKING LIST"
    putStrLn "======================================"

    printItems completeList

    putStrLn ""
    putStrLn ("Total suggested items: " ++ show (length completeList))

    putStrLn ""
    putStrLn "======================================"
    putStrLn "Packing list complete!"
    putStrLn "Have a safe trip!"
    putStrLn "======================================"



clothingList :: Int -> String -> [String]
clothingList days weather =
    let shirts = min days 7
        bottoms = max 2 ((days + 1) `div` 2)
        underwear = days + 1
        socks = days + 1

        basic =
            [ show shirts ++ " shirts/tops"
            , show bottoms ++ " pants/shorts/bottoms"
            , show underwear ++ " underwear"
            , show socks ++ " pairs of socks"
            , "1 set of sleepwear"
            , "Comfortable shoes"
            , "Slippers/flip-flops"
            ]

    in basic ++ extraClothes weather



extraClothes :: String -> [String]
extraClothes weather
    | weather == "1" =
        [ "Lightweight clothes"
        , "Hat/cap"
        ]

    | weather == "2" =
        [ "Warm sweater"
        , "Jacket/coat"
        , "Thermal wear"
        , "Gloves"
        , "Scarf"
        , "Warm socks"
        ]

    | weather == "3" =
        [ "Light jacket"
        , "Quick-dry clothes"
        ]

    | weather == "4" =
        [ "Light jacket"
        , "Sweater"
        , "Layering clothes"
        ]

    | otherwise = []



weatherList :: String -> [String]
weatherList weather
    | weather == "1" =
        [ "Sunscreen"
        , "Sunglasses"
        , "Hat"
        , "Reusable water bottle"
        ]

    | weather == "2" =
        [ "Warm jacket"
        , "Lip balm"
        , "Moisturizer"
        , "Umbrella"
        ]

    | weather == "3" =
        [ "Umbrella"
        , "Raincoat"
        , "Water-resistant shoes"
        , "Waterproof bag"
        ]

    | weather == "4" =
        [ "Umbrella"
        , "Light jacket"
        , "Sunscreen"
        , "Sunglasses"
        ]

    | otherwise =
        [ "Check weather before leaving" ]



toiletriesList :: [String]
toiletriesList =
    [ "Toothbrush"
    , "Toothpaste"
    , "Soap/body wash"
    , "Shampoo"
    , "Conditioner"
    , "Face wash"
    , "Deodorant"
    , "Comb/hairbrush"
    , "Skincare products"
    , "Moisturizer"
    , "Lip balm"
    , "Tissues"
    , "Hand sanitizer"
    , "Personal hygiene products"
    , "Personal medicines"
    ]



electronicsList :: [String]
electronicsList =
    [ "Phone"
    , "Phone charger"
    , "Power bank"
    , "Headphones/earphones"
    , "Charging cables"
    , "Travel adapter"
    , "Laptop/tablet if needed"
    , "Laptop charger if needed"
    ]



documentList :: String -> [String]
documentList international
    | lower international == "yes" =
        [ "Passport"
        , "Visa if required"
        , "Flight/train tickets"
        , "Hotel/accommodation details"
        , "Travel insurance"
        , "ID card"
        , "Copies of important documents"
        , "Emergency contact information"
        , "Credit/debit cards"
        , "Some cash"
        ]

    | otherwise =
        [ "Government ID"
        , "Tickets"
        , "Hotel/accommodation details"
        , "Credit/debit cards"
        , "Some cash"
        , "Emergency contact information"
        ]



tripTypeList :: String -> [String]
tripTypeList tripType
    | tripType == "1" =
        [ "Camera if needed"
        , "Small day bag"
        , "Travel guide or saved maps"
        ]

    | tripType == "2" =
        [ "Formal clothes"
        , "Formal shoes"
        , "Laptop"
        , "Notebook"
        , "Pen"
        , "Business documents"
        ]

    | tripType == "3" =
        [ "Laptop"
        , "Notebook"
        , "Pens/pencils"
        , "Student ID"
        , "Study materials"
        , "Backpack"
        ]

    | tripType == "4" =
        [ "Small gifts if desired"
        , "Comfortable casual clothes"
        ]

    | otherwise = []



activityList :: [String] -> [String]
activityList activities =
    concat (map itemsForActivity activities)



itemsForActivity :: String -> [String]
itemsForActivity activity
    | "swim" `isInfixOf` activity =
        [ "Swimsuit"
        , "Swimming goggles"
        , "Quick-dry towel"
        , "Waterproof bag"
        ]

    | "hik" `isInfixOf` activity || "trek" `isInfixOf` activity =
        [ "Hiking shoes"
        , "Comfortable activewear"
        , "Backpack"
        , "Reusable water bottle"
        , "Sunscreen"
        , "Hat"
        ]

    | "gym" `isInfixOf` activity || "workout" `isInfixOf` activity =
        [ "Workout clothes"
        , "Sports shoes"
        , "Gym towel"
        , "Water bottle"
        ]

    | "beach" `isInfixOf` activity =
        [ "Swimsuit"
        , "Beach towel"
        , "Flip-flops"
        , "Sunscreen"
        , "Sunglasses"
        , "Hat"
        ]

    | "party" `isInfixOf` activity || "club" `isInfixOf` activity =
        [ "Going-out outfit"
        , "Dress shoes"
        , "Small bag"
        ]

    | "ski" `isInfixOf` activity || "snow" `isInfixOf` activity =
        [ "Thermal clothes"
        , "Warm gloves"
        , "Winter jacket"
        , "Warm socks"
        , "Beanie"
        ]

    | "camp" `isInfixOf` activity =
        [ "Flashlight"
        , "Extra batteries"
        , "Bug spray"
        , "Reusable water bottle"
        , "First-aid kit"
        ]

    | "temple" `isInfixOf` activity =
        [ "Modest clothing"
        , "Scarf/shawl"
        ]

    | "photography" `isInfixOf` activity =
        [ "Camera"
        , "Camera charger"
        , "Extra memory card"
        ]

    | "cycling" `isInfixOf` activity || "bike" `isInfixOf` activity =
        [ "Comfortable activewear"
        , "Sports shoes"
        , "Water bottle"
        ]

    | otherwise = []



cultureList :: String -> String -> [String] -> [String]
cultureList destination choice activities
    | lower choice /= "yes" = []

    | otherwise =
        religiousItems ++ destinationItems

  where
    d = lower destination

    religiousItems =
        if containsReligiousActivity activities
        then
            [ "Modest clothing"
            , "Clothing that covers shoulders"
            , "Long pants/skirt if required"
            , "Scarf/shawl"
            ]
        else
            []

    destinationItems
        | "india" `isInfixOf` d =
            [ "Modest clothing for religious places"
            , "Scarf/shawl"
            , "Traditional outfit if desired"
            ]

        | "uae" `isInfixOf` d
            || "dubai" `isInfixOf` d
            || "abu dhabi" `isInfixOf` d =
            [ "Modest clothing"
            , "Light scarf/shawl"
            , "Clothes covering shoulders and knees"
            ]

        | "japan" `isInfixOf` d =
            [ "Easy-to-remove shoes"
            , "Clean socks for places where shoes are removed"
            ]

        | "thailand" `isInfixOf` d =
            [ "Modest clothes for temples"
            , "Shoulder-covering top"
            , "Long pants/skirt"
            ]

        | "italy" `isInfixOf` d =
            [ "Modest outfit for churches"
            , "Shoulder-covering clothing"
            ]

        | otherwise =
            [ "Check local dress customs"
            , "Pack one modest outfit"
            ]



containsReligiousActivity :: [String] -> Bool
containsReligiousActivity activities =
    any isReligious activities



isReligious :: String -> Bool
isReligious activity =
    "temple" `isInfixOf` activity
    || "mosque" `isInfixOf` activity
    || "church" `isInfixOf` activity
    || "religious" `isInfixOf` activity



snackList :: [String]
snackList =
    [ "Granola/protein bars"
    , "Dry snacks"
    , "Nuts"
    , "Biscuits/crackers"
    , "Candy/gum"
    ]



essentialList :: [String]
essentialList =
    [ "Wallet"
    , "Keys"
    , "Small backpack/day bag"
    , "Reusable water bottle"
    , "First-aid items"
    , "Prescription medicines"
    , "Laundry bag"
    , "Zip-lock/plastic bags"
    , "Travel pillow if needed"
    , "Pen"
    ]



weatherName :: String -> String
weatherName "1" = "Hot"
weatherName "2" = "Cold"
weatherName "3" = "Rainy"
weatherName "4" = "Mixed"
weatherName _ = "Not specified"



tripTypeName :: String -> String
tripTypeName "1" = "Vacation"
tripTypeName "2" = "Business"
tripTypeName "3" = "Study"
tripTypeName "4" = "Visiting family/friends"
tripTypeName _ = "Other"



printItems :: [String] -> IO ()
printItems [] = return ()
printItems (x:xs) = do
    putStrLn ("[ ] " ++ x)
    printItems xs



removeDuplicates :: [String] -> [String]
removeDuplicates [] = []
removeDuplicates (x:xs) =
    x : removeDuplicates (filter (/= x) xs)



splitByComma :: String -> [String]
splitByComma "" = []
splitByComma text =
    let (first, rest) = break (== ',') text
    in cleanText first :
        case rest of
            [] -> []
            (_:remaining) -> splitByComma remaining



cleanText :: String -> String
cleanText text =
    lower (trim text)



trim :: String -> String
trim =
    reverse . dropWhile (== ' ') . reverse . dropWhile (== ' ')



joinItems :: [String] -> String
joinItems [] = ""
joinItems [x] = x
joinItems (x:xs) =
    x ++ ", " ++ joinItems xs



lower :: String -> String
lower = map toLower
