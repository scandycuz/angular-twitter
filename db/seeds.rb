# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

groups = Group.create([
  { number: 1 }
])

handles = Handle.create([
  { screen_name: "realDonaldTrump",
    group: 1
  },
  { screen_name: "RBReich",
    group: 1
  },
  { screen_name: "PutinRF_Eng",
    group: 1
  },
  { screen_name: "ConanOBrien",
    group: 1
  },
  { screen_name: "POTUS",
    group: 1
  },
  { screen_name: "POTUS44",
    group: 1
  },
  { screen_name: "JerrySeinfeld",
    group: 1
  },
  { screen_name: "Oprah",
    group: 1
  },
  { screen_name: "KingJames",
    group: 1
  },
  { screen_name: "BillGates",
    group: 1
  },
  { screen_name: "KevinHart4real",
    group: 1
  },
  { screen_name: "Trevornoah",
    group: 1
  },
  { screen_name: "CNN",
    group: 1
  },
  { screen_name: "StephenAtHome",
    group: 1
  },
  { screen_name: "kanyewest",
    group: 1
  },
  { screen_name: "danieltosh",
    group: 1
  },
  { screen_name: "NASA",
    group: 1
  },
  { screen_name: "Google",
    group: 1
  },
  { screen_name: "JimCarrey",
    group: 1
  },
  { screen_name: "NBCNews",
    group: 1
  },
  { screen_name: "Sethrogen",
    group: 1
  },
  { screen_name: "rickygervais",
    group: 1
  },
  { screen_name: "jack",
    group: 1
  },
  { screen_name: "LeoDiCaprio",
    group: 1
  },
  { screen_name: "neiltyson",
    group: 1
  },
  { screen_name: "Pontifex",
    group: 1
  },
  { screen_name: "elizabethforma",
    group: 1
  },
  { screen_name: "danaperino",
    group: 1
  },
  { screen_name: "NateSilver538",
    group: 1
  },
  { screen_name: "jaketapper",
    group: 1
  },
  { screen_name: "billmaher",
    group: 1
  },
  { screen_name: "mollyesque",
    group: 1
  },
  { screen_name: "JohnDingell",
    group: 1
  },
  { screen_name: "davidafrench",
    group: 1
  },
  { screen_name: "elonjames",
    group: 1
  },
  { screen_name: "benpolitico",
    group: 1
  },
  { screen_name: "AlanColmes",
    group: 1
  },
  { screen_name: "MysteryPollster",
    group: 1
  },
  { screen_name: "RasmussenPoll",
    group: 1
  },
  { screen_name: "elonmusk",
    group: 1
  },
  { screen_name: "Schwarzenegger",
    group: 1
  },
  { screen_name: "mviser",
    group: 1
  },
  { screen_name: "BuzzFeedAndrew",
    group: 1
  },
  { screen_name: "EliStokols",
    group: 1
  },
  { screen_name: "amychozick",
    group: 1
  },
  { screen_name: "TheBradMielke",
    group: 1
  },
  { screen_name: "DomenicoNPR",
    group: 1
  },
  { screen_name: "danmericaCNN",
    group: 1
  },
  { screen_name: "EvanMcSan",
    group: 1
  },
  { screen_name: "wpjenna",
    group: 1
  },
  { screen_name: "daveweigel",
    group: 1
  },
  { screen_name: "fixfelicia",
    group: 1
  },
  { screen_name: "pwire",
    group: 1
  },
  { screen_name: "SusanPage",
    group: 1
  },
  { screen_name: "alex_wags",
    group: 1
  },
  { screen_name: "HotlineReid",
    group: 1
  },
  { screen_name: "PElliottAP",
    group: 1
  },
  { screen_name: "thegarance",
    group: 1
  },
  { screen_name: "mikememoli",
    group: 1
  },
  { screen_name: "ErinMcPike",
    group: 1
  },
  { screen_name: "markknoller",
    group: 1
  },
  { screen_name: "dmataconis",
    group: 1
  },
  { screen_name: "ppppolls",
    group: 1
  },
  { screen_name: "LeahNTorres",
    group: 1
  },
  { screen_name: "andersoncooper",
    group: 1
  },
  { screen_name: "maddow",
    group: 1
  },
  { screen_name: "GStephanopoulos",
    group: 1
  },
  { screen_name: "camanpour",
    group: 1
  },
  { screen_name: "mikeallen",
    group: 1
  },
  { screen_name: "chucktodd",
    group: 1
  },
  { screen_name: "brianstelter",
    group: 1
  },
  { screen_name: "BuzzFeedBen",
    group: 1
  },
  { screen_name: "ariannahuff",
    group: 1
  },
  { screen_name: "chrislhayes",
    group: 1
  },
  { screen_name: "AnnCurry",
    group: 1
  },
  { screen_name: "paulkrugman",
    group: 1
  },
  { screen_name: "wolfblitzer",
    group: 1
  },
  { screen_name: "FareedZakaria",
    group: 1
  },
  { screen_name: "megynkelly",
    group: 1
  },
  { screen_name: "TheFix",
    group: 1
  },
  { screen_name: "ggreenwald",
    group: 1
  },
  { screen_name: "JoeNBC",
    group: 1
  },
  { screen_name: "daveweigel",
    group: 1
  },
  { screen_name: "markknoller",
    group: 1
  },
  { screen_name: "mitchellreports",
    group: 1
  },
  { screen_name: "MHarrisPerry",
    group: 1
  },
  { screen_name: "HowardKurtz",
    group: 1
  },
  { screen_name: "DanaPerino",
    group: 1
  },
  { screen_name: "BretBaier",
    group: 1
  },
  { screen_name: "greta",
    group: 1
  },
  { screen_name: "AHMalcolm",
    group: 1
  },
  { screen_name: "glennbeck",
    group: 1
  },
  { screen_name: "donnabrazile",
    group: 1
  },
  { screen_name: "DavidCornDC",
    group: 1
  },
  { screen_name: "KatrinaNation",
    group: 1
  },
  { screen_name: "nycjim",
    group: 1
  },
  { screen_name: "mtaibbi",
    group: 1
  },
  { screen_name: "mattyglesias",
    group: 2
  },
  { screen_name: "DianeSawyer",
    group: 2
  },
  { screen_name: "donlemon",
    group: 2
  },
  { screen_name: "markos",
    group: 2
  },
  { screen_name: "tomfriedman",
    group: 2
  },
  { screen_name: "anamariecox",
    group: 2
  },
  { screen_name: "ChrisCuomo",
    group: 2
  },
  { screen_name: "TheRevAl",
    group: 2
  },
  { screen_name: "sullydish",
    group: 2
  },
  { screen_name: "billkeller2014",
    group: 2
  },
  { screen_name: "CharlesMBlow",
    group: 2
  },
  { screen_name: "jaketapper",
    group: 2
  },
  { screen_name: "megynkelly",
    group: 2
  },
  { screen_name: "seanhannity",
    group: 2
  },
  { screen_name: "DRUDGE",
    group: 2
  },
  { screen_name: "oreillyfactor",
    group: 2
  },
  { screen_name: "DLoesch",
    group: 2
  },
  { screen_name: "repjohnlewis",
    group: 2
  },
  { screen_name: "edhenry",
    group: 2
  },
  { screen_name: "TuckerCarlson",
    group: 2
  },
  { screen_name: "greggutfeld",
    group: 2
  },
  { screen_name: "MajorCBS",
    group: 2
  },
  { screen_name: "secupp",
    group: 2
  },
  { screen_name: "EWErickson",
    group: 2
  },
  { screen_name: "Judgenap",
    group: 2
  },
  { screen_name: "AndreaTantaros",
    group: 2
  },
  { screen_name: "stephenfhayes",
    group: 2
  },
  { screen_name: "kimguilfoyle",
    group: 2
  },
  { screen_name: "TeamCavuto",
    group: 2
  },
  { screen_name: "Peggynoonannyc",
    group: 2
  },
  { screen_name: "KirstenPowers",
    group: 2
  },
  { screen_name: "costareports",
    group: 2
  },
  { screen_name: "LarrySabato",
    group: 2
  },
  { screen_name: "RichLowry",
    group: 2
  },
  { screen_name: "ericbolling",
    group: 2
  },
  { screen_name: "JonahNRO",
    group: 2
  },
  { screen_name: "MarkLeibovich",
    group: 2
  },
  { screen_name: "politicalwire",
    group: 2
  },
  { screen_name: "nickconfessore",
    group: 2
  },
  { screen_name: "jbarro",
    group: 2
  },
  { screen_name: "DylanByers",
    group: 2
  },
  { screen_name: "jonkarl",
    group: 2
  },
  { screen_name: "WillieGeist",
    group: 2
  },
  { screen_name: "marcambinder",
    group: 2
  },
  { screen_name: "morningmika",
    group: 2
  },
  { screen_name: "RyanLizza",
    group: 2
  },
  { screen_name: "thegarance",
    group: 2
  },
  { screen_name: "ktumulty",
    group: 2
  },
  { screen_name: "JeffreyGoldberg",
    group: 2
  },
  { screen_name: "rickklein",
    group: 2
  },
  { screen_name: "DLeonhardt",
    group: 2
  },
  { screen_name: "maggieNYT",
    group: 2
  },
  { screen_name: "MarkHalperin",
    group: 2
  },
  { screen_name: "NorahODonnell",
    group: 2
  },
  { screen_name: "jmartNYT",
    group: 2
  },
  { screen_name: "davidfrum",
    group: 2
  },
  { screen_name: "HowardKurtz",
    group: 2
  },
  { screen_name: "mitchellreports",
    group: 2
  },
  { screen_name: "markknoller",
    group: 2
  },
  { screen_name: "TheFix",
    group: 2
  },
  { screen_name: "daveweigel",
    group: 2
  },
  { screen_name: "Lawrence",
    group: 2
  },
  { screen_name: "joshtpm",
    group: 2
  },
  { screen_name: "blakehounshell",
    group: 2
  },
  { screen_name: "BorowitzReport",
    group: 2
  }
])
