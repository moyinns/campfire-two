extends Node2D

var list = [["Karen Blobsworth", "52" , 
			"Middle manager at a logistics company. Known for her passive agressive Post-it note campaigns in the office kitchen. Has strong opinions about the communal microwave and is not afraid to share them in pointed emails","She made company-wide emails saying, Can everyone PLEASE label their lunches, fourteen times in one year " , 
			"female"],
			["Henry Octagon" , "55" , 
			"A bold, audacious, rude nobleman with a passion for power, feasting, war and getting remarried at an alarming rate. Yet somehow not a one his fault. Owned around 60 palaces and still complained bout drafts", 
			"Ordered all the monastries destroyed because he wanted money to go to war. He lost the wars.",
			 "male"],
			["Charle Emileao" , "20",
			"An internallionaly famous young woman who became famous for dancing on social media. Somehow this turned into a media empire, a shoe deal, and a family reality show. However, she seems genuiely nice, which confuses everyone",
			"Made parents worldwide discover TikTok", 
			"female"],
			["Tonald Drump" , "78" ,
			"A very audacious orange businessman turned politician with an unmistakeble tan and haircut. He built towers,sent tweets aboout being the best including humble and gen AI of his enemies", 
			"Told people to drink bleach to avoid getting sick during pandemic" ,
			 "male" ],
			["Oluwaeren Okafor", "19",
			"A brooding, intense young man form Lagos who discovered a terribel secret about the world and took it extremely personally. Trained for years, had great abs, and a plan so complicated he forgot which side he was on by the end. His friends tried to stop him. he didn't stop",
			"Decided the solution to a deeply complex geopolitical problem was to personaly flatten everything and then explain his reasoning while people where still on fire",
			 "male"]]

var current_index = 0

@onready var name_label = $NameLabel
@onready var age_label = $AgeLabel
@onready var bio_label = $BioLabel
@onready var crime_label = $CrimeLabel
@onready var gender_label = $GenderLabel

func _ready() -> void:
	update_card(current_index)

func update_card(index):
	var character = list[index]
	name_label.text = character[0]
	age_label.text = character[1]
	bio_label.text = character[2]
	crime_label.text = character[3]
	gender_label.text = character[4]

func next_character():
	current_index = (current_index + 1) % list.size()
	update_card(current_index)

func prev_character():
	current_index = (current_index - 1 + list.size()) % list.size()
	update_card(current_index)

func _process(delta: float) -> void:
	pass
# Called when the node enters the scene tree for the first time.

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

	pass
