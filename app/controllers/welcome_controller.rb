class WelcomeController < ApplicationController
  def index

  	if user_signed_in?

	  	@user = current_user

		# Facebook graph api load for user
		@graph = Koala::Facebook::API.new(@user.fb_token)
		@user_fb = @graph.get_object("me?fields=name,id,location")
		# events.limit(500),likes.limit(500),friends,posts.limit(500)
		# @user_past_fb_events = @user_fb['events']['data']
		# @user_fb_likes = @user_fb['likes']['data']
		# @user_fb_posts = @user_fb['posts']['data']

		# # General hash of word counts generator
		# def word_counter(data, attribute)
		# 	words_hash = {}
		# 	data.each do |hash_object|
		# 		# for each word in the string
		# 		string = hash_object[attribute]
		# 		unless string == nil
		# 			string = string.downcase.gsub(/[^a-z ]/, '')
		# 			string.split(" ").each do |word|
		# 				# if already in hash
		# 				if words_hash.has_key?(word)
		# 					# iterate it
		# 					words_hash[word] += 1
		# 				# otherwise
		# 				else
		# 					# add new word and +1
		# 					words_hash[word] = 1
		# 				end
		# 			end
		# 		end
		# 	end

		# 	return words_hash.sort_by {|key, value| value}.reverse.to_h
		# end

		# # Generate some interesting data
		# @events_name_word_count = word_counter(@user_past_fb_events, 'name')
		# @events_description_word_count = word_counter(@user_past_fb_events, 'description')
		# @likes_word_count = word_counter(@user_fb_likes, 'name')
		# @posts_message_word_count = word_counter(@user_fb_posts, 'message')
		# @posts_story_word_count = word_counter(@user_fb_posts, 'story')

		# # Add together word count totals
		# def word_count_merger(hashes)
		# 	merged = {}
		# 	hashes.each do |hash|
		# 		merged = merged.merge(hash) {|key, val1, val2| val1 + val2}
		# 	end
		# 	return merged.sort_by {|key, value| value}.reverse.to_h
		# end

		# @total_word_count = word_count_merger([@events_name_word_count, @events_description_word_count, @likes_word_count, @posts_message_word_count, @posts_story_word_count])

		# @working = {"the"=>590, "and"=>412, "to"=>371, "of"=>298, "a"=>282, "in"=>211, "for"=>179, "you"=>153, "is"=>149, "at"=>139, "be"=>131, "on"=>120, "with"=>117, "will"=>95, "this"=>94, "we"=>91, "your"=>88, "party"=>87, "are"=>84, "that"=>81, "nite"=>80, "all"=>80, "by"=>76, "laser"=>75, "if"=>68, "it"=>67, "or"=>64, "as"=>62, "i"=>61, "from"=>61, "so"=>60, "our"=>58, "have"=>57, "pm"=>52, "new"=>49, "us"=>46, "get"=>46, "mit"=>45, "come"=>43, "people"=>41, "not"=>40, "its"=>39, "can"=>37, "an"=>36, "my"=>36, "about"=>32, "but"=>32, "th"=>32, "me"=>30, "night"=>30, "more"=>30, "there"=>30, "up"=>30, "just"=>28, "dont"=>28, "time"=>28, "shared"=>28, "only"=>27, "year"=>26, "free"=>26, "some"=>26, "school"=>26, "everyone"=>25, "please"=>25, "their"=>25, "event"=>25, "day"=>24, "was"=>24, "link"=>23, "no"=>23, "like"=>23, "bring"=>23, "dance"=>23, "do"=>23, "how"=>22, "what"=>22, "class"=>22, "one"=>22, "well"=>22, "fun"=>22, "birthday"=>21, "invite"=>21, "senior"=>21, "see"=>21, "who"=>21, "out"=>21, "his"=>20, "has"=>20, "friends"=>20, "students"=>20, "house"=>20, "years"=>19, "saanichton"=>19, "her"=>19, "want"=>19, "know"=>19, "would"=>19, "tickets"=>18, "into"=>18, "msae"=>18, "may"=>18, "take"=>18, "they"=>18, "help"=>18, "other"=>17, "love"=>17, "now"=>17, "them"=>16, "harvard"=>16, "ticket"=>16, "each"=>16, "maharishi"=>16, "need"=>16, "life"=>16, "play"=>15, "facebook"=>15, "anyone"=>15, "food"=>15, "world"=>15, "go"=>15, "make"=>15, "saturday"=>15, "such"=>14, "after"=>14, "been"=>14, "any"=>14, "good"=>14, "last"=>14, "let"=>14, "center"=>14, "group"=>14, "projects"=>14, "speech"=>14, "also"=>14, "fairfield"=>14, "best"=>14, "join"=>14, "celebrate"=>13, "including"=>13, "grand"=>13, "enjoy"=>13, "here"=>13, "being"=>13, "vote"=>13, "game"=>13, "first"=>13, "way"=>13, "back"=>12, "welcome"=>12, "drinks"=>12, "friday"=>12, "l"=>12, "work"=>12, "learn"=>12, "high"=>12, "music"=>12, "presents"=>12, "should"=>12, "student"=>12, "find"=>12, "earth"=>11, "holiday"=>11, "think"=>11, "going"=>11, "invited"=>11, "home"=>11, "open"=>11, "special"=>11, "lets"=>11, "grade"=>11, "includes"=>11, "off"=>11, "than"=>11, "through"=>11, "vision"=>11, "most"=>11, "end"=>11, "data"=>11, "where"=>10, "trade"=>10, "next"=>10, "before"=>10, "state"=>10, "top"=>10, "much"=>10, "when"=>10, "parti"=>10, "continuation"=>10, "google"=>10, "im"=>10, "d"=>10, "theater"=>10, "gray"=>10, "week"=>10, "again"=>10, "oh"=>10, "experience"=>10, "were"=>10, "many"=>10, "video"=>10, "space"=>10, "place"=>10, "pizza"=>10, "few"=>10, "say"=>10, "ever"=>10, "together"=>10, "something"=>10, "must"=>10, "thats"=>10, "then"=>10, "right"=>10, "support"=>10, "level"=>10, "got"=>10, "fair"=>10, "because"=>9, "others"=>9, "down"=>9, "photo"=>9, "thanks"=>9, "give"=>9, "live"=>9, "youre"=>9, "s"=>9, "part"=>9, "guests"=>9, "he"=>9, "sure"=>9, "three"=>9, "city"=>9, "gonna"=>9, "local"=>9, "every"=>9, "am"=>9, "available"=>9, "alumni"=>9, "consciousness"=>8, "taking"=>8, "performance"=>8, "without"=>8, "st"=>8, "money"=>8, "over"=>8, "annual"=>8, "lobby"=>8, "which"=>8, "person"=>8, "n"=>8, "competition"=>8, "dj"=>8, "max"=>8, "featuring"=>8, "buy"=>8, "look"=>8, "rsvp"=>8, "really"=>8, "bryan"=>8, "miss"=>8, "starting"=>8, "surprise"=>8, "awesome"=>8, "hackmit"=>8, "boston"=>8, "had"=>8, "ideas"=>8, "left"=>8, "long"=>8, "around"=>8, "page"=>8, "summer"=>8, "reading"=>7, "square"=>7, "likes"=>7, "art"=>7, "stop"=>7, "spring"=>7, "conscious"=>7, "michael"=>7, "basketball"=>7, "march"=>7, "sunday"=>7, "show"=>7, "program"=>7, "made"=>7, "big"=>7, "heaven"=>7, "costume"=>7, "boat"=>7, "post"=>7, "put"=>7, "list"=>7, "getting"=>7, "eve"=>7, "feel"=>7, "didnt"=>7, "favorite"=>7, "area"=>7, "ask"=>7, "even"=>7, "hollywood"=>7, "real"=>7, "stage"=>7, "aug"=>7, "wear"=>7, "create"=>7, "between"=>7, "wanna"=>7, "call"=>7, "pool"=>7, "programming"=>7, "web"=>7, "along"=>7, "green"=>7, "government"=>7, "delicious"=>6, "admission"=>6, "snacks"=>6, "very"=>6, "able"=>6, "still"=>6, "heart"=>6, "maseeh"=>6, "these"=>6, "official"=>6, "gifts"=>6, "host"=>6, "guys"=>6, "justin"=>6, "hug"=>6, "name"=>6, "tea"=>6, "she"=>6, "mum"=>6, "acting"=>6, "range"=>6, "allstate"=>6, "divine"=>6, "build"=>6, "general"=>6, "check"=>6, "once"=>6, "youll"=>6, "keep"=>6, "largest"=>6, "creating"=>6, "sale"=>6, "own"=>6, "oct"=>6, "fire"=>6, "morgan"=>6, "great"=>6, "iowa"=>6, "everything"=>6, "tomorrow"=>6, "illuminus"=>6, "events"=>6, "trip"=>6, "clothing"=>6, "old"=>6, "october"=>6, "rd"=>6, "leave"=>6, "does"=>6, "cispa"=>6, "happy"=>6, "team"=>6, "cant"=>6, "hope"=>6, "teaching"=>6, "college"=>6, "updated"=>6, "enough"=>6, "cover"=>6, "midnight"=>6, "noel"=>6, "word"=>6, "itll"=>6, "another"=>6, "light"=>5, "meetup"=>5, "better"=>5, "internet"=>5, "company"=>5, "incube"=>5, "amazing"=>5, "dear"=>5, "wait"=>5, "economy"=>5, "added"=>5, "coming"=>5, "cast"=>5, "feb"=>5, "vip"=>5, "nd"=>5, "cool"=>5, "yet"=>5, "performances"=>5, "act"=>5, "too"=>5, "month"=>5, "korean"=>5, "door"=>5, "did"=>5, "institute"=>5, "worry"=>5, "beats"=>5, "research"=>5, "schools"=>5, "fast"=>5, "never"=>5, "kathryn"=>5, "weve"=>5, "mathematics"=>5, "corazza"=>5, "probably"=>5, "themed"=>5, "minute"=>5, "date"=>5, "hot"=>5, "hack"=>5, "drink"=>5, "eat"=>5, "basement"=>5, "dancing"=>5, "shop"=>5, "thursday"=>5, "shit"=>5, "toys"=>5, "times"=>5, "gift"=>5, "nites"=>5, "dream"=>5, "later"=>5, "plan"=>5, "international"=>5, "career"=>5, "anybody"=>5, "eternal"=>5, "days"=>5, "born"=>5, "future"=>5, "studio"=>5, "round"=>5, "why"=>5, "paramount"=>5, "tell"=>5, "based"=>5, "looking"=>5, "early"=>5, "away"=>5, "second"=>5, "hey"=>5, "per"=>5, "politicians"=>5, "little"=>5, "gb"=>5, "five"=>5, "movement"=>5, "technology"=>5, "morning"=>5, "across"=>5, "cut"=>5, "drive"=>5, "community"=>5, "street"=>5, "information"=>5, "already"=>5, "global"=>5, "share"=>5, "age"=>5, "building"=>5, "having"=>5, "profile"=>5, "campus"=>5, "story"=>5, "picture"=>5, "piece"=>5, "gelfand"=>5, "while"=>5, "ios"=>5, "set"=>5, "ball"=>5, "lunch"=>5, "pandora"=>5, "applause"=>4, "tagged"=>4, "half"=>4, "photos"=>4, "minutes"=>4, "mike"=>4, "system"=>4, "avi"=>4, "isnt"=>4, "same"=>4, "formal"=>4, "built"=>4, "fhs"=>4, "kitchen"=>4, "both"=>4, "deangelis"=>4, "sold"=>4, "required"=>4, "james"=>4, "anything"=>4, "awakening"=>4, "nice"=>4, "least"=>4, "happening"=>4, "applications"=>4, "run"=>4, "rather"=>4, "possible"=>4, "movie"=>4, "main"=>4, "following"=>4, "blocks"=>4, "actually"=>4, "silent"=>4, "showing"=>4, "extra"=>4, "upon"=>4, "signup"=>4, "white"=>4, "finance"=>4, "musical"=>4, "university"=>4, "office"=>4, "consider"=>4, "start"=>4, "everybody"=>4, "voting"=>4, "two"=>4, "jewish"=>4, "hit"=>4, "living"=>4, "family"=>4, "stuff"=>4, "adventures"=>4, "someone"=>4, "watch"=>4, "thanksgiving"=>4, "film"=>4, "chair"=>4, "startup"=>4, "held"=>4, "social"=>4, "done"=>4, "limited"=>4, "forward"=>4, "throwing"=>4, "lost"=>4, "venture"=>4, "jews"=>4, "everyones"=>4, "weekend"=>4, "jew"=>4, "president"=>4, "else"=>4, "mits"=>4, "except"=>4, "romney"=>4, "kane"=>4, "include"=>4, "ready"=>4, "water"=>4, "yes"=>4, "wooden"=>4, "oils"=>4, "effective"=>4, "hours"=>4, "doing"=>4, "those"=>4, "sound"=>4, "use"=>4, "homemade"=>4, "id"=>4, "moment"=>4, "perry"=>4, "brainstorm"=>4, "performer"=>4, "single"=>4, "offering"=>4, "freshman"=>4, "american"=>4, "sondheim"=>4, "different"=>4, "wellesley"=>4, "project"=>4, "production"=>4, "joined"=>4, "dress"=>4, "mind"=>4, "simple"=>4, "late"=>4, "adults"=>4, "air"=>4, "mime"=>4, "mother"=>4, "using"=>4, "season"=>4, "field"=>4, "floor"=>4, "kathryns"=>4, "beauty"=>4, "association"=>4, "nights"=>4, "club"=>4, "him"=>4, "online"=>4, "four"=>4, "entertainment"=>4, "un"=>4, "board"=>4, "peoplenovember"=>4, "gives"=>4, "analytics"=>4, "november"=>4, "performed"=>4, "making"=>4, "jams"=>3, "model"=>3, "professor"=>3, "afterparty"=>3, "god"=>3, "thank"=>3, "ipad"=>3, "starts"=>3, "ge"=>3, "ragogna"=>3, "silver"=>3, "sept"=>3, "cold"=>3, "haunted"=>3, "sleep"=>3, "short"=>3, "lot"=>3, "obama"=>3, "campaign"=>3, "rice"=>3, "chinese"=>3, "sweet"=>3, "giant"=>3, "djs"=>3, "circus"=>3, "opening"=>3, "classic"=>3, "songs"=>3, "variety"=>3, "capital"=>3, "environment"=>3, "couldnt"=>3, "stephen"=>3, "goal"=>3, "property"=>3, "surprises"=>3, "harper"=>3, "krueger"=>3, "service"=>3, "hour"=>3, "theme"=>3, "past"=>3, "artist"=>3, "partners"=>3, "thinking"=>3, "celebration"=>3, "david"=>3, "imagination"=>3, "zeta"=>3, "asked"=>3, "higher"=>3, "today"=>3, "job"=>3, "change"=>3, "security"=>3, "paying"=>3, "texas"=>3, "laws"=>3, "grow"=>3, "doesnt"=>3, "talk"=>3, "soon"=>3, "p"=>3, "ive"=>3, "ill"=>3, "launch"=>3, "unless"=>3, "kickoff"=>3, "jefferson"=>3, "album"=>3, "means"=>3, "religion"=>3, "whole"=>3, "might"=>3, "super"=>3, "bowl"=>3, "winner"=>3, "until"=>3, "winter"=>3, "tom"=>3, "energy"=>3, "sun"=>3, "lower"=>3, "star"=>3, "products"=>3, "xi"=>3, "titus"=>3, "chosie"=>3, "vs"=>3, "against"=>3, "john"=>3, "tdc"=>3, "organic"=>3, "original"=>3, "monday"=>3, "blue"=>3, "steven"=>3, "brothers"=>3, "solutions"=>3, "hifza"=>3, "pratherhuff"=>3, "action"=>3, "choice"=>3, "passport"=>3, "july"=>3, "recognition"=>3, "power"=>3, "always"=>3, "charge"=>3, "capitol"=>3, "provided"=>3, "dropbox"=>3, "report"=>3, "km"=>3, "extension"=>3, "however"=>3, "hates"=>3, "therefore"=>3, "financial"=>3, "wishes"=>3, "paid"=>3, "independently"=>3, "romneys"=>3, "providers"=>3, "solar"=>3, "spot"=>3, "public"=>3, "marys"=>3, "mean"=>3, "needed"=>3, "cube"=>3, "rubiks"=>3, "throw"=>3, "fundraiser"=>3, "dinner"=>3, "gathering"=>3, "dharma"=>3, "info"=>3, "holland"=>3, "altruism"=>3, "hubweek"=>3, "tegmark"=>3, "missed"=>3, "slippers"=>3, "forgot"=>3, "creative"=>3, "email"=>3, "rain"=>3, "lansdowne"=>3, "arts"=>3, "bostons"=>3, "store"=>3, "pmsunday"=>3, "hackathon"=>3, "la"=>3, "april"=>3, "nearly"=>3, "liquor"=>3, "stars"=>3, "happen"=>3, "seen"=>3, "salad"=>3, "worth"=>3, "debut"=>3, "beer"=>3, "meet"=>3, "advance"=>3, "concert"=>3, "members"=>3, "alone"=>3, "biggest"=>3, "couple"=>3, "playing"=>3, "pop"=>3, "line"=>3, "hacker"=>3, "true"=>3, "prizes"=>3, "station"=>3, "believe"=>3, "incredible"=>3, "hong"=>3, "things"=>3, "turn"=>3, "above"=>3, "beautiful"=>3, "fresh"=>3, "policy"=>3, "charlie"=>3, "min"=>3, "minds"=>3, "september"=>3, "costumes"=>3, "sign"=>3, "props"=>3, "popular"=>3, "mobile"=>3, "demos"=>3, "presented"=>3, "farm"=>3, "purchased"=>3, "sales"=>3, "matched"=>3, "during"=>3, "talley"=>3, "questions"=>3, "claire"=>3, "guest"=>3, "li"=>3, "man"=>3, "levchin"=>3, "spread"=>3, "rock"=>3, "gods"=>3, "congress"=>3, "olivia"=>3, "return"=>3, "anywhere"=>3, "soul"=>3, "improv"=>3, "butter"=>3, "book"=>3, "gourmet"=>3, "fine"=>3, "treats"=>3, "hassan"=>3, "broadway"=>3, "vendors"=>3, "message"=>3, "singing"=>3, "won"=>3, "valentineing"=>3, "poinsettias"=>3, "lessons"=>3, "auction"=>3, "speak"=>3, "peace"=>3, "tacocopter"=>3, "widely"=>3, "worlds"=>3, "creations"=>3, "developers"=>3, "review"=>3, "bliss"=>3, "though"=>3, "basic"=>3, "mac"=>3, "partner"=>3, "growing"=>3, "council"=>3, "reserved"=>3, "performers"=>3, "current"=>3, "youve"=>3, "longer"=>3, "york"=>3, "wow"=>3, "hardware"=>3, "countdown"=>3, "laptop"=>3, "katy"=>3, "unique"=>3, "break"=>3, "choral"=>3, "exceptions"=>3, "jungle"=>3, "mini"=>3, "handmade"=>3, "clothes"=>3, "item"=>3, "version"=>3, "knowledge"=>3, "series"=>3, "direction"=>3, "enter"=>3, "safe"=>3, "skills"=>3, "legal"=>3, "chance"=>3, "masters"=>3, "box"=>3, "ago"=>3, "anna"=>3, "included"=>3, "degree"=>3, "stay"=>3, "development"=>3, "thing"=>3, "landlord"=>3, "save"=>3, "spend"=>3, "science"=>3, "mark"=>3, "nobody"=>3, "bad"=>3, "excellent"=>3, "festival"=>3, "middle"=>3, "rhyme"=>2, "chi"=>2, "annie"=>2, "cookout"=>2, "towel"=>2, "toga"=>2, "river"=>2, "e"=>2, "copies"=>2, "challenge"=>2, "prior"=>2, "destiny"=>2, "solo"=>2, "pong"=>2, "prepare"=>2, "master"=>2, "ride"=>2, "order"=>2, "hottest"=>2, "bam"=>2, "price"=>2, "costa"=>2, "delts"=>2, "queers"=>2, "ksa"=>2, "worked"=>2, "working"=>2, "eye"=>2, "jeff"=>2, "statistics"=>2, "chuseok"=>2, "scientist"=>2, "growth"=>2, "guru"=>2, "rica"=>2, "donations"=>2, "coop"=>2, "pmsat"=>2, "pmsun"=>2, "offcampus"=>2, "rules"=>2, "jobs"=>2, "theres"=>2, "chill"=>2, "prices"=>2, "slow"=>2, "almost"=>2, "ben"=>2, "taken"=>2, "bitch"=>2, "alumnus"=>2, "theyre"=>2, "waiting"=>2, "resident"=>2, "affiliates"=>2, "workshop"=>2, "app"=>2, "seventeen"=>2, "important"=>2, "table"=>2, "minority"=>2, "trying"=>2, "options"=>2, "xcode"=>2, "personal"=>2, "user"=>2, "theta"=>2, "heffter"=>2, "spiritual"=>2, "rainbow"=>2, "number"=>2, "desk"=>2, "ptsd"=>2, "fill"=>2, "bosworth"=>2, "highest"=>2, "kyle"=>2, "friend"=>2, "horizons"=>2, "sleeping"=>2, "pick"=>2, "bubash"=>2, "forever"=>2, "grace"=>2, "bailey"=>2, "meeting"=>2, "kindly"=>2, "chairs"=>2, "elaborate"=>2, "amanda"=>2, "maxwell"=>2, "pleased"=>2, "planning"=>2, "repp"=>2, "study"=>2, "kelsey"=>2, "brightest"=>2, "greatest"=>2, "groups"=>2, "premier"=>2, "interface"=>2, "award"=>2, "dropping"=>2, "wish"=>2, "sustainable"=>2, "amazed"=>2, "teams"=>2, "ongoing"=>2, "semester"=>2, "passions"=>2, "bright"=>2, "collaborate"=>2, "sky"=>2, "heavenly"=>2, "alejandras"=>2, "spayde"=>2, "angels"=>2, "valentine"=>2, "lasers"=>2, "created"=>2, "wallets"=>2, "lifes"=>2, "tight"=>2, "cofounder"=>2, "topics"=>2, "ensure"=>2, "moviehangoutwe"=>2, "talented"=>2, "found"=>2, "whats"=>2, "rising"=>2, "peer"=>2, "reality"=>2, "wouldnt"=>2, "beyond"=>2, "thought"=>2, "west"=>2, "transcendental"=>2, "pure"=>2, "hypothesis"=>2, "clay"=>2, "bringing"=>2, "sing"=>2, "glorious"=>2, "ring"=>2, "inner"=>2, "flowing"=>2, "tours"=>2, "continue"=>2, "delay"=>2, "lots"=>2, "yourself"=>2, "abundance"=>2, "pink"=>2, "burlington"=>2, "wont"=>2, "beverages"=>2, "knock"=>2, "storm"=>2, "muffins"=>2, "mohamed"=>2, "buttered"=>2, "goes"=>2, "ha"=>2, "semiformal"=>2, "holden"=>2, "rage"=>2, "helping"=>2, "giving"=>2, "view"=>2, "showcase"=>2, "ones"=>2, "full"=>2, "di"=>2, "doors"=>2, "ids"=>2, "leap"=>2, "naked"=>2, "crosswalk"=>2, "exit"=>2, "ayurveda"=>2, "walk"=>2, "proceed"=>2, "june"=>2, "sigma"=>2, "compete"=>2, "contest"=>2, "sl"=>2, "launching"=>2, "greenhouse"=>2, "bassnectar"=>2, "npr"=>2, "several"=>2, "swift"=>2, "studies"=>2, "iap"=>2, "feds"=>2, "intro"=>2, "projx"=>2, "nursery"=>2, "remember"=>2, "known"=>2, "request"=>2, "permaculture"=>2, "member"=>2, "csa"=>2, "nu"=>2, "mattress"=>2, "wonderland"=>2, "csc"=>2, "thatthe"=>2, "traditional"=>2, "offered"=>2, "presale"=>2, "education"=>2, "adam"=>2, "possibly"=>2, "rose"=>2, "cirque"=>2, "du"=>2, "longawaited"=>2, "resources"=>2, "huge"=>2, "cambridge"=>2, "costs"=>2, "totally"=>2, "further"=>2, "pasha"=>2, "police"=>2, "glow"=>2, "drop"=>2, "tacos"=>2, "yall"=>2, "byob"=>2, "older"=>2, "style"=>2, "roof"=>2, "tropical"=>2, "weeks"=>2, "memorable"=>2, "warm"=>2, "access"=>2, "delight"=>2, "maybe"=>2, "turkish"=>2, "sam"=>2, "types"=>2, "cause"=>2, "parents"=>2, "everyday"=>2, "effects"=>2, "disco"=>2, "mandatory"=>2, "etc"=>2, "hooray"=>2, "clean"=>2, "pitch"=>2, "games"=>2, "soccer"=>2, "hosted"=>2, "directions"=>2, "cono"=>2, "locations"=>2, "indoor"=>2, "alot"=>2, "camp"=>2, "hipsters"=>2, "hippies"=>2, "stupid"=>2, "utopia"=>2, "housewarming"=>2, "contribution"=>2, "artists"=>2, "established"=>2, "zachary"=>2, "red"=>2, "become"=>2, "ma"=>2, "fiske"=>2, "band"=>2, "track"=>2, "spins"=>2, "k"=>2, "room"=>2, "talks"=>2, "nyc"=>2, "uk"=>2, "shapes"=>2, "county"=>2, "davis"=>2, "drinking"=>2, "wfb"=>2, "proof"=>2, "shows"=>2, "somebody"=>2, "censored"=>2, "cares"=>2, "courtyard"=>2, "religious"=>2, "cash"=>2, "bar"=>2, "under"=>2, "relative"=>2, "shitty"=>2, "merica"=>2, "knowerknowingknown"=>2, "ie"=>2, "due"=>2, "rachel"=>2, "corrie"=>2, "code"=>2, "sat"=>2, "entries"=>2, "suit"=>2, "boy"=>2, "point"=>2, "meets"=>2, "shittyfest"=>2, "girl"=>2, "san"=>2, "comedy"=>2, "festivalgroup"=>2, "south"=>2, "t"=>2, "arrive"=>2, "mysterious"=>2, "cells"=>2, "docks"=>2, "readers"=>2, "wharf"=>2, "rowes"=>2, "boarding"=>2, "freedom"=>2, "bash"=>2, "purchase"=>2, "evening"=>2, "keefe"=>2, "niko"=>2, "thiel"=>2, "mickey"=>2, "mothers"=>2, "nathaniel"=>2, "zhu"=>2, "hearts"=>2, "kishan"=>2, "thijm"=>2, "brush"=>2, "donovan"=>2, "schroeder"=>2, "isabel"=>2, "reed"=>2, "avery"=>2, "travis"=>2, "kadie"=>2, "roberts"=>2, "dia"=>2, "alana"=>2, "interesting"=>2, "huggins"=>2, "hosting"=>2, "bond"=>2, "ensemble"=>2, "collective"=>2, "venue"=>2, "plays"=>2, "drama"=>2, "glasses"=>2, "thomas"=>2, "sets"=>2, "battery"=>2, "attention"=>2, "problems"=>2, "elephant"=>2, "phone"=>2, "lifted"=>2, "christian"=>2, "joseph"=>2, "lighting"=>2, "items"=>2, "stone"=>2, "although"=>2, "de"=>2, "girindra"=>2, "selleck"=>2, "brecon"=>2, "anastasio"=>2, "vinit"=>2, "clbrer"=>2, "alina"=>2, "pioneer"=>2, "knight"=>2, "fieldhouse"=>2, "ou"=>2, "plus"=>2, "issues"=>2, "shelf"=>2, "scene"=>2, "raffi"=>2, "color"=>2, "pour"=>2, "facepainting"=>2, "distorted"=>2, "weekly"=>2, "o"=>2, "breads"=>2, "pies"=>2, "interests"=>2, "chocolates"=>2, "coffees"=>2, "candy"=>2, "edges"=>2, "raise"=>2, "yummy"=>2, "lobbyists"=>2, "care"=>2, "features"=>2, "incense"=>2, "coast"=>2, "aroma"=>2, "awards"=>2, "soaps"=>2, "scented"=>2, "cremes"=>2, "skin"=>2, "featured"=>2, "sensual"=>2, "fabulous"=>2, "hats"=>2, "socks"=>2, "knitted"=>2, "upcycled"=>2, "handfelted"=>2, "scarves"=>2, "silk"=>2, "ten"=>2, "jewelry"=>2, "samantha"=>2, "bell"=>2, "eugenia"=>2, "foundation"=>2, "plants"=>2, "decorative"=>2, "try"=>2, "could"=>2, "wreaths"=>2, "candles"=>2, "beeswax"=>2, "seem"=>2, "utensils"=>2, "pottery"=>2, "birdhouses"=>2, "handpainted"=>2, "framed"=>2, "quilts"=>2, "decorations"=>2, "handcrafted"=>2, "lovely"=>2, "animals"=>2, "plush"=>2, "viable"=>2, "cuddly"=>2, "trucks"=>2, "tops"=>2, "httpswwwfacebookcomincubemitfrefts"=>2, "massachusetts"=>2, "wide"=>2, "economically"=>2, "faculty"=>2, "httpsgroupsmiteduwebmoiralistincubersfb"=>2, "institutions"=>2, "admitted"=>2, "httpswwwfacebookcomgroupsmoira"=>2, "avoid"=>2, "enjoyfb"=>2, "pictures"=>2, "studios"=>2, "status"=>2, "donelots"=>2, "boast"=>2, "compilation"=>2, "httpincubemitedubring"=>2, "example"=>2, "poetry"=>2, "hell"=>2, "dwell"=>2, "ground"=>2, "looks"=>2, "apple"=>2, "months"=>2, "content"=>2, "dec"=>2, "concerned"=>2, "tour"=>2, "dreams"=>2, "upload"=>2, "sophia"=>2, "thth"=>2, "responded"=>2, "wednesday"=>2, "priority"=>2, "girls"=>2, "especially"=>2, "accept"=>2, "registration"=>2, "media"=>2, "finally"=>2, "cone"=>2, "electro"=>2, "toast"=>2, "park"=>2, "business"=>2, "less"=>2, "mins"=>2, "applied"=>2, "jeffrey"=>2, "volume"=>2, "lab"=>2, "talent"=>2, "victory"=>2, "innovation"=>2, "win"=>2, "hes"=>2, "mixing"=>2, "website"=>2, "services"=>2, "organizations"=>2, "location"=>2, "network"=>2, "alex"=>2, "idea"=>2, "proceeds"=>2, "false"=>2, "positive"=>2, "courtesy"=>2, "educational"=>2, "case"=>2, "assume"=>2, "wrote"=>2, "hopefully"=>2, "via"=>2, "teachers"=>2, "expense"=>2, "goods"=>2, "goodale"=>2, "sheridan"=>2, "katya"=>2, "eyes"=>2, "christ"=>2, "folk"=>2, "wei"=>2, "solaris"=>2, "received"=>2, "cloud"=>2, "entire"=>2, "specific"=>2, "akber"=>2, "cleveland"=>2, "told"=>2, "era"=>2, "matt"=>2, "african"=>2, "halloween"=>2, "storage"=>2, "samuel"=>2, "friendly"=>2, "determined"=>2, "course"=>2, "click"=>2, "leadership"=>2, "sharing"=>2, "head"=>2, "question"=>2, "copy"=>2, "cost"=>2, "void"=>2, "coinbase"=>2, "illegal"=>2, "complete"=>2, "corporate"=>2, "lack"=>2, "children"=>2, "chrome"=>2, "shining"=>2, "wanted"=>2, "according"=>2, "dark"=>2, "automatically"=>2, "answer"=>2, "sake"=>2, "mostly"=>2, "federal"=>2, "winning"=>2, "words"=>2, "mustaches"=>2, "brother"=>2, "bill"=>2, "puts"=>2, "cia"=>2, "uh"=>2, "amazon"=>2, "psi"=>2, "sending"=>2, "awareness"=>2, "calling"=>2, "america"=>2, "becoming"=>2, "suffering"=>2, "add"=>2, "source"=>2, "cannot"=>2, "moved"=>2, "breaks"=>2, "thankyou"=>2, "marks"=>2, "running"=>2, "arising"=>2, "bday"=>2, "whoever"=>2, "budget"=>2, "lecturer"=>2, "books"=>2, "pages"=>2, "read"=>2, "market"=>2, "calender"=>2, "result"=>2, "fed"=>2, "sex"=>2, "destination"=>2, "problem"=>2, "classes"=>2, "instead"=>2, "account"=>2, "boom"=>2, "minimum"=>2, "degrees"=>2, "bros"=>2, "saying"=>2, "chips"=>2, "tonight"=>2, "nye"=>2, "pitching"=>2, "works"=>2, "tilly"=>2, "ads"=>2, "limitless"=>2, "ad"=>2, "currently"=>2, "prasad"=>2, "monk"=>2, "evidence"=>2, "gloria"=>2, "large"=>2, "august"=>2, "install"=>2, "visit"=>2, "randomly"=>2, "interested"=>2, "daniel"=>2, "jackson"=>2, "focus"=>2, "strong"=>2, "edge"=>2, "fehr"=>2, "maseehcre"=>2, "steps"=>2, "dishaw"=>2, "physics"=>2, "trudeau"=>2, "child"=>2, "artificial"=>2, "behind"=>2}
		# @just_string = []
		# @generic_words = File.read("#{Rails.root}/public/generic_words")
		# @working.each do |entry|
		# 	# Don't add if generic
		# 	unless @generic_words.include? entry[0]
		# 		@just_string.append(entry[0])
		# 	end
		# end


		# Get user location
  		@user_fb_location = @user_fb['location']['name']
  		@geo_location = Geocoder.search(@user_fb_location)[0]
  		# Nearby coordinates ranges (0.3 = ~20 miles)
  		lat_high = @geo_location.latitude + 0.3
  		lat_low = @geo_location.latitude - 0.3
  		long_high = @geo_location.longitude + 0.3
  		long_low = @geo_location.longitude - 0.3
  		# Save to locations model and add to user if not present, otherwise just update user
  		if Location.where(city: @geo_location.city).count == 0
  			new_location = Location.new
  			new_location.city = @geo_location.city
  			new_location.state = @geo_location.state
  			new_location.country = @geo_location.country
  			new_location.latitude = @geo_location.latitude
  			new_location.longitude = @geo_location.longitude
  			new_location.save
  			# Save/update location_id to user model
  			@user.location_id = new_location.id
  			@user.save
  		else
  			@user.location_id = Location.find_by(city: @geo_location.city).id
  		end
  		# Get nearby cities from locations model, ex. cambridge -> boston
  		@nearby_locations = Location.where("latitude > ? and latitude < ? and longitude > ? and longitude < ?", lat_low, lat_high, long_low, long_high)
  		# generic words for broadening event search results
  		@extra_words = ["", "the", "and", "to", "of", "a", "in", "for", "you", "is", "at", "be", "on", "with", "will", "this", "we"]
  		@extra_words2 = ["", "party", "nite", "laser", "mit", "people", "night", "shared", "free", "school", "everyone", "link", "dance", "class", "fun", "birthday", "senior"]
  		@extra_words3 = [""]
  		# Fb query each nearby city name for events
  		for loc in @nearby_locations do
  			for word in @extra_words3 do
	  			# query fb events by location city
	  			city_fb_events = @graph.get_object("search?q=#{word + " " + loc['city']}&type=event&limit=500&fields=id,name,description,place,start_time,category,attending_count,cover")
	  			# save/update events in db
	  			unless city_fb_events == nil
			  		city_fb_events.each do |event|
			  			# If new then create
			  			if Event.find_by(fb_id: event['id']) == nil
			  				new_event = Event.new
			  				new_event.fb_id = event['id']
			  				new_event.name = event['name']
			  				new_event.description = event['description']
			  				new_event.attending_count = event['attending_count']
			  				new_event.start_time = event['start_time']
			  				# cover photo storing, avoiding nils
			  				cover = event['cover']
			  				unless event['cover'] == nil
			  					new_event.image_url = cover['source']
			  				end
			  				# location storing, avoiding nils
			  				place = event['place']
			  				unless place == nil
			  					location = place['location']
			  				end
			  				unless location == nil
			  					new_event.longitude = location['longitude']
			  					new_event.latitude = location['latitude']
			  				end
			  				new_event.save
			  			# else already exists, update event info
			  			else
			  				stored_event = Event.find_by(fb_id: event['id'])
			  				stored_event.fb_id = event['id']
			  				stored_event.name = event['name']
			  				stored_event.description = event['description']
			  				stored_event.attending_count = event['attending_count']
			  				stored_event.start_time = event['start_time']
			  				# cover photo storing, avoiding nils
			  				cover = event['cover']
			  				unless event['cover'] == nil
			  					stored_event.image_url = cover['source']
			  				end
			  				# location storing, avoiding nils
			  				place = event['place']
			  				unless place == nil
			  					location = place['location']
			  				end
			  				unless location == nil
			  					stored_event.longitude = location['longitude']
			  					stored_event.latitude = location['latitude']
			  				end
			  				stored_event.save
			  			end
			  		end
			  	end
	  		end
		end

  		# Get local events within about 20 miles, or about 0.3 latitude and longitude
  		@local_events = Event.where("latitude > ? and latitude < ? and longitude > ? and longitude < ?", lat_low, lat_high, long_low, long_high)

  		# Get local events that are within the upcoming week
  		@local_events_upcoming = @local_events.where("start_time > ?", Time.now)
  		@local_events_upcoming_ten_days = @local_events_upcoming.where("start_time < ?", Time.now + 864000)	
  		@local_top_events = @local_events_upcoming_ten_days.sort_by {|event| event.attending_count}

	end
  end
end
