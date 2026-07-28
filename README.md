# MEXICALIPSIS GAME
This project is a game set in a post-apocalyptic future in Mexico ruled by rats. It has three levels, each taking place in important locations throughout Mexico (Chichen Itza, the mummies of Guanajuato, and La Rumorosa, Plaza Calafia). Created for entertainment and to experiment with the Godot Engine platform.

# HOW THIS WAS MADE
This project was made with Godot Engine, below I’ve included the links below, using the [brackeys]( https://brackeysgames.itch.io/brackeys-platformer-bundle?download) template and with the guide [Horizon Guides] (https://guides.horizons.hackclub.com/guides/godot-guide/) and a lot of youtube videos that I will put in notes. The language used in this project is GDScript. For the design of the player, the enemies and items I use Pixilart, which is a free design website, I chose a size of 100x100 pixels for the sprites. 

**Problems I had:**
1.	When using the navigation agent node, in the function for the physics, remember to make the enemy follow the player only on the x axis, otherwise it will float no matter if you have gravity declared
2.	Work with the property grounded for the enemie in the properties of CharacterBody2D to avoid the constant velocity and the friction works.
3.	The enemy that follows the player can get stuck in the corners and can’t jump, to fix this I add ```gdscript if is_on_wall() and is_on_floor():
			velocity.y = -200.0```
4.	At first I was using raycast to make the enemy bounce between two walls, but for this you need to change the collision layer of the player so the enemy does not get detected as a wall/tilemap, but I think is better to use waypoints for this


# HOW TO RUN THE PROJECT :=)
1.	Download [Godot Engine] (https://godotengine.org/download/windows/)
2.	Clone the repository: ```sh git clone https://github.com/axealbert/test-mexicalipsis.git ´´´
3.	Open Godot Engine and click on Import
4.	Open the clone folder and select the project.godot file
5.	Once you have imported the project, click on the run button or F5 and that’s it

# DEMO LINK
[Play Mexicalipsis] (https://axel-alberto.itch.io/mexicalipsis)

# SCREENSHOTS AND GIFS

<img width="921" height="458" alt="image" src="https://github.com/user-attachments/assets/dbef0b6f-94bf-4e33-a906-3040b5c8d69f" />
<img width="921" height="474" alt="image" src="https://github.com/user-attachments/assets/556723a8-5ba3-4e68-9360-0533a824d228" />
<img width="921" height="610" alt="image" src="https://github.com/user-attachments/assets/f3ee7388-d168-43da-9666-c8e8e80b1f87" />
<img width="921" height="517" alt="image" src="https://github.com/user-attachments/assets/742aeeb3-9fa5-486e-b243-047d0c0c50d7" />
<img width="921" height="449" alt="image" src="https://github.com/user-attachments/assets/7b912923-3701-4502-98d0-1e63b1276b10" />
<img width="921" height="277" alt="image" src="https://github.com/user-attachments/assets/b9141615-739e-4eab-9b77-e494b5feedbd" />

# DISCLOSURE AI
AI was used in this project to debug errors and generate ideas for the level structure, as well as to gather information about archaeological sites in Mexico and a description of each one in order to choose the theme for each level.

### NOTES
Useful youtube videos =)
1.	Create the [executable]( https://www.youtube.com/watch?v=lAirvCJKzIc)
2.	Script for change [fullscreen to windowscreen]( https://www.youtube.com/watch?v=zWgv4lYjZC4)
3.	[Music and sound] (https://www.youtube.com/watch?v=bnWTUsPSJrY&t=1055s)
4.	[How to make a video game]( https://www.youtube.com/watch?v=LOhfqjmasi0&t=4453s)
5.	[How to shoot in Godot]( https://www.youtube.com/watch?v=kU1FsDy6tT4)
6.	[Enemies who are chasing you]( https://www.youtube.com/watch?v=Jp9V18ZyGxM&t=922s)

7.	[Enemies that can see you]( https://www.youtube.com/watch?v=SS9nAEpjS4o)

8.	[Lighting]( https://www.youtube.com/watch?v=LQ_eR74OL_M&t=263s)
