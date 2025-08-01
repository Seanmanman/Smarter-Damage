// TODO:
int numOfCharsAtInit = GetNumCharacters();
void Init(string level_name) {
	Log(fatal, "number of chars at init is: " + numOfCharsAtInit);
}

string[] legs = { "left_leg", "right_leg" };
string[] arms = { "leftarm", "rightarm" };
string torso = "torso";
string head = "head";

class TrackedCharacter {
	int char_id;
	float head_limb_health;
	float torso_limb_health;
	float larm_limb_health;
	float rarm_limb_health;
	float lleg_limb_health;
	float rleg_limb_health;
	
	TrackedCharacter (int _char_id, float _head_limb_health, float _torso_limb_health, float _larm_limb_health, float _rarm_limb_health, float _lleg_limb_health, float _rleg_limb_health) {
		char_id = _char_id;
		head_limb_health = _head_limb_health;
		torso_limb_health = _torso_limb_health;
		larm_limb_health = _larm_limb_health;
		rarm_limb_health = _rarm_limb_health;
		lleg_limb_health = _lleg_limb_health;
		rleg_limb_health = _rleg_limb_health;
	}
}

void removeDuplicateChars(array<TrackedCharacter@> &in input) {
	array<int> detectedDups;
	int arrayLength = input.length();
	for (int i = arrayLength - 1; i >= 0; i--) {
		for (int i2 = arrayLength - 1; i2 >= 0; i2--) {
			if (i != i2 && input[i].char_id == input[i2].char_id) {
				input.removeAt(i2);
				Log(fatal, "did a thing(get it? i did a thing?)");
			}
		}
	}
}
array<TrackedCharacter@> TrackedCharacters;

void Update(int is_paused) {
	int numOfChars = GetNumCharacters();
	int TrackedArrayLength = TrackedCharacters.size();
	if (TrackedArrayLength < numOfChars) {
		for (int i = numOfChars - 1; i > 0; i--) {
			MovementObject@ char = ReadCharacter(i);
			int char_id = char.GetID();
			TrackedCharacters.insertLast(TrackedCharacter(char_id, 100.0f, 100.0f, 100.0f, 100.0f, 100.0f, 100.0f));
			removeDuplicateChars(TrackedCharacters);
		}
	}
	else {
		removeDuplicateChars(TrackedCharacters);
	}
}
