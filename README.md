# qb-props

A super simplisitc script to spawn props around the map at any coordinates. An extensive list of props can be found at https://gta-objects.xyz/objects

# Template
Use the below template when you want to add a new prop into the config.lua:

```
[XX] = {
	model = "enter model name here",
	coords = vector4(Enter vector4 coordinates here),
},
```

As a note, some props dont use logical headings when they were made, which means the heading you entered may not be the front face of the prop. If your prop spawns in sideways, either add or subtract 90 from the heading (4th number in vector4) to rotate the prop in the direction you want. Beware though as the heading for a prop can only be up to 360 degrees. If it exceeds this number, restart at 0 to find the right rotation.