# CollatzConjecture
Ryan Dynski and Wyndham White

We were inspired by Edmund Harris’ visualization of the Collatz Conjecture
By treating each step of the sequence as a binary output making a trail turn left or right, this picture can be produced

Problem:
  We wondered, How can we produce similarly beautiful art generated with our own creative approach to any     arbitrary function

State Solution
  Any function can be tuned to output an array of boolean values
  So, by writing generalized visualization functions to boolean array inputs, we can produce visuals for     any function that can be tuned to output an array of booleans
  There are two components to any visualization
  The mathematical function adjusted to output a boolean array
  The visualization method used to interpret the boolean array into 3D coordinates, which are then graphed   using splines 
  
Technologies used
  Java
  Processing
  P3D

Challenges:
Getting colors, particularly gradients of colors
Merging code
Large input sizes
Growth/Things
Using interfaces to generalize more
  Each function was already tuned to have identically named functions for producing the array of booleans,    and each illustrative method also shared function names, but we never got around to combining everything
Optimality:
  The code is pretty slow, making the already laggy visualization software even slower

Accomplishments
  They look cool
  We have never worked with 3D until now, and we had success working on separate sides of the project and     having them combine as planned to produce images
  We made multiple illustrative templates and functions, demonstrating the proof of concept that any         function could be tuned to output a boolean array, then creating however many illustrations we could       possibly come up with 
  This art doesn’t just look good, it can be interpreted
  
For the factorString method we made, numbers that have more factors tend to have more true values in their array output, yielding more negative curvature in our phi angle, and larger positive curvature in theta
This art is appealing because it is dual-faceted
It looks intriguing to anyone who looks at it without knowledge of its production, but it is even more engaging to someone who can understand what the shapes mean



