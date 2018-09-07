# Embedded Elixir Thing

## This is a test
This is just a fun side project to bring some use to make some use of the random stuff I have laying
around, like a RaspberryPi, LED, a resistor, etc. Also, I need to practice making new apps and
deploying Elixir stuff.

## Tech to try out
GraphiQL
GraphQL
Nerves

## Architecture Plan, V1
* Remote Server
  - No Database
  - No Permanent State
  - Models generic state machines
  - Models specific instances of particular state machines

* Generic State Machine
  - Has a name
  - Has a state
  - Stored as a graph defined by its edges
