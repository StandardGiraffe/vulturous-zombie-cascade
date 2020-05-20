# Vulturous Zombie + Altar of Dementia Cascade Calculator

## A quick Ruby script for calculating the total deck-destroying potential of multiple Vulturous Zombies and an Altar of Dementia in MTG

In *Magic the Gathering*, a mild and silly combo exists when sacrificing multiple [Vulturous Zombie](https://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid=446906)s to an [Altar of Dementia](https://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid=464167).

Assuming a target library with enough cards exists at each Altar activation, the optimal execution is:

1. Sacrifice all non-Vulturous Zombie creatures with power > 0 in any order.
2. Sacrifice the Vulturous Zombie with the highest power.
3. Repeat Step 2 until you control no more Vulturous Zombies.

This can snowball into unexpectedly dramatic deck destruction; I built this silly script to calculate and report the results.

```terminal
$ ruby cascade.rb
Welcome to the Vulturous Zombie Cascade Calculator!
Assuming you have an Altar of Dementia in play...

What is the total power of creatures under your control OTHER THAN Vulturous Zombie? 12

Okay, how many Vulturous Zombies do you have in play? 3
  Zombie #1's power: 6
  Zombie #2's power: 4
  Zombie #3's power: 3


Total Milled: 0
Zombie Power Roster: [3, 4, 6]


STEP 1: sacrifice non-zombie creatures to the Altar...


Total Milled: 12
Zombie Power Roster: [15, 16, 18]


STEP 2: sacrifice the zombies from strongest to weakest...
  Sacrificing a zombie with 18 power...


Total Milled: 30
Zombie Power Roster: [33, 34]

  Sacrificing a zombie with 34 power...


Total Milled: 64
Zombie Power Roster: [67]

  Sacrificing a zombie with 67 power...


Total Milled: 131
Zombie Power Roster: []


Now that all the zombies are sacrificed, and assuming a library
with sufficient cards was the target at each activation,
the total number of cards milled was 131.

... Yeesh.
```
