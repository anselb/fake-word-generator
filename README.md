# fake word generator
An API for generating fake words based on logical phonetic sound combinations

## Quick Start
You can try running this project locally (you will likely have to change versions of Ruby and change the database settings), but I recommend downloading Docker and running `docker-compose up` in your terminal, in this project's local directory. After you see that the databases have been migrated, the API should be good to go!

To start generating words, you should create a couple component lists to build words.

List of consonants:
```cURL
curl -X POST http://localhost:3000/component_lists.json \
  -H 'Content-Type: application/json' \
  -d '{
	"component_list": {
		"name": "consonants",
		"components": "b c d f g h j k l m n p q r s t v w x y z"
	}
}'
```
List of vowels:
```cURL
curl -X POST http://localhost:3000/component_lists.json \
  -H 'Content-Type: application/json' \
  -d '{
	"component_list": {
		"name": "vowels",
		"components": "a e i o u"
	}
}'
```
***
After you create the component lists, you need an order list so that the API knows what order to put together the components:
```cURL
curl -X POST http://localhost:3000/order_lists.json \
  -H 'Content-Type: application/json' \
  -d '{
	"order_list": {
		"name": "five_letter",
		"order": "consonants vowels consonants vowels consonants"
	}
}'
```
***
Now you can try generating words by referencing that order list:
```cURL
curl -X GET http://localhost:3000/words/generate/five_letter.json
```

## How to Use
There are a couple pieces that are needed to generate a fake word
1. components - A list of components to sample from to help create a word
2. order - The order in which a component list is sampled from to create the word
Both are saved as a string of components or component list names that are separated by a space

For example:
- Components:
  - consonants = "b c d f g h j k l m n p q r s t v w x y z"
  - vowels = "a e i o u"
- Order:
  - three_letter = "consonants vowels consonants"
  - five_letter = "consonants vowels consonants vowels consonants"
- Generating the word by calling ```GET /words/generate/:name.json``` where name is the name of the order list:
  - ```/words/generate/three_letter.json``` might return "jir" or "qaw"
  - ```/words/generate/five_letter.json``` might return "bikup" or "voxoy"

- ```GET /component_lists.json``` - Get all lists of word components
- ```POST /component_lists.json``` - Post a name and component list as strings to create your own component list to sample from
- ```PATCH/PUT /component_lists/1.json``` - Patch or put a name and component list to update your component list

- ```GET /order_lists.json``` - Get a list of previously created component arrangements
- ```POST /order_lists.json``` - Post a name and order list as strings to create your own arrangement of components
- ```PATCH/PUT /order_lists/1.json``` - Patch or put a name and order list to update your order list

## Things to Do
- Get Markov chains to load faster with a large corpus and try generating a word with that
- Get arrays to save to the database for slightly faster word generation times
- Handle errors when a user tries to request something that isn't available

### Original Proposal
First, I would have to get a basic understanding of phonetics and define rules for how a word can sound (possibly allow custom rules to dictate word generation by users?). If possible, I am thinking of storing a list of letters or a combination of letters by their "sound type category", similarly to consonants and vowels.

The generator could return a word that has a certain length (or syllable count if easily implementable), a list or string of words, etc.

In addition, (unauthenticated?) users could come to the site, generate a couple words and save them to a list if they think the word is intriguing or funny enough for others to see. Users could also vote on the words, so that the "best" fake words are more easily seen.

A list of possible use cases:
- Fake names
- Filler data
- Laughing at the generated words
- Used to create a word for a definition that lacks a word
