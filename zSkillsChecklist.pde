/*
Shapes
1. line, ellipse, rect, triangle, quad, arc, curve 
   - displayGrid function in ChronoFrenzy tab

2. fill, stroke, strokeWeight, noFill, noStroke, color
   - Used in the display methods of various objects in the ChronoFrenzy tab, e.g., displayGrid, displayGame, display.

3. Modes: CORNER, CORNERS, CENTER, RADIUS
   - Used in the displayGrid function in the ChronoFrenzy tab, setting rectMode.

System
4. setup(), draw()
   - Implemented in the ChronoFrenzy tab.

5. background(), random(), noise()
   - Used in the ChronoFrenzy tab for background color and generating random values.

6. constrain(), dist()
   - Used in the ChronoFrenzy tab, e.g., in the recallTrail function.

7. keyPressed(), keyReleased(), keyPressed, mousePressed(), mousePressed
   - Implemented in the zControls tab.

8. increment operators: ++, +=, --, -=, *=, /=
   - Used in the zControls tab, e.g., incrementing/decrementing values.

9. declare and use a local variable
   - Implemented in the Door tab, e.g., boolean isLocked.

10. declare and use a global variable
    - Used in the ChronoFrenzy tab, e.g., int tileSize.

Debugging
11. println(), stop()
   - Used in the Player tab for debugging purposes, e.g., printing messages.

Control flow
12. conditional statements: if, else if, else
    - Used in the ChronoFrenzy tab, e.g., in the draw function.

13. Boolean expressions: ==, >=, <=, >, <, !=
    - Used in the ChronoFrenzy tab, e.g., in conditional statements.

14. Logical operators: &&, ||
    - Used in the ChronoFrenzy tab, e.g., in conditional statements.

15. switch statement
    - Implemented in the zControl tab.

Loops
16. for loop, while loop
    - Used in the ChronoFrenzy tab, e.g., in the recallTrail function.

17. A nested loop
    - Used in the ChronoFrenzy tab, e.g., in the recallTrail function.

18. break
    - Used in the zControls tab, e.g., breaking out of a loop.

19. What’s the difference between a for loop and a while loop?
    - A for loop is typically used when the number of iterations is known, while a while loop is used when the condition for termination is not known initially.

Functions
20. Declare & call a function with no parameters and no return type
    - Used in various tabs, e.g., resetGame in the ChronoFrenzy tab.

21. Declare & call a function with a return type
    - Not explicitly used.

22. What’s the difference between parameters and arguments?
    - Parameters are variables declared in a function, and arguments are the values passed to those parameters when the function is called.

23. Pass by copy (value): declare and use a function that takes int, float, char, etc as an argument
    - Used in various tabs, e.g., display function.

24. Pass by reference (objects): declare and use a function that takes an object as an argument
    - Used in various tabs, e.g., setKey in the Door tab.

Classes/objects
25. What’s the difference between a class and an object?
    - A class is a blueprint for creating objects, and an object is an instance of a class.

26. What is a constructor function? What does it do and when?
    - A constructor function initializes an object when it is created. It's called automatically when an object is instantiated.

27. Why should each class have its own tab in Processing?
    - In Processing, each tab represents a separate class or a part of the program. Organizing classes in separate tabs makes the code more modular and easier to manage.

28. Write a class with a constructor function
    - Door class in the Door tab.

29. Use the keyword new to instantiate an object
    - Used throughout the code, e.g., Door door1 = new Door(6, 8, tileSize);

30. Write a constructor function with parameters
    - Example: Door constructor in the Door tab.

Lists
31. What’s the difference between an array and an ArrayList?
    - An array has a fixed size, while an ArrayList can dynamically grow or shrink in size.

32. Why would you want to go through a list backwards, decrementing the index?
    - When removing elements from a list while iterating, going backward avoids issues with shifting indices. 

33. Initialize and populate an array
    - Used in the initWalls function.

34. Initialize and populate an ArrayList
    - Used in the initWalls function.

35. Manage a set of objects with an array or ArrayList
    - Used in various parts of the code like in the doors, keys, and exhaust classes.

36. Use an ArrayList method: size(), get(), remove(), contains()
    - Used in various tabs, e.g., getting size, getting elements, removing elements.

Vectors
37. When should you use PVector instead of float variables?
    - PVector is useful when dealing with 2D or 3D vectors, providing convenient methods for vector operations.

38. Use the PVector class
    - Used in various parts of the code for handling positions and movements.

39. Do some basic physics: use position, velocity, and acceleration (due to gravity) vectors
    - Used in the Player class for movement.

40. Find the direction and distance between two points
    - Used in the Platform pbject implementation.

41. Create a random 2D vector
    - Not clear.

42. What is a normalized vector, why is it useful?
    - A normalized vector is a vector with a magnitude of 1. It is useful for representing direction without considering magnitude.

43. Using the Processing documentation look up a method in the PVector class that’s new to you and use it in your code.
    - PVector array used for the player history implementation.

Nice to Know (optional)

45. Switch between “game states” (eg grounded/jumping) using conditional statements
    - Implemented in the ChronoFrenzy tab. Especially in fail state implementation.

48. Do animation with images (spritesheet or individual files)
    - Implemented for the Platform obstacle.

49. Use collision detection between objects
    - Implemented in various parts of the code, e.g., checking collisions between the player and walls.

*/
