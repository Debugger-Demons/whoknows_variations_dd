# Devops uge 1

- Dependency graph design
  - I worked with dependency graph to create an overview of the dependencies my project has.

# Devops uge 2

# Devops uge 3

# Devops uge 4

# Devops uge 5

# Devops uge 6

## Guest lecture from Eficode

- Sofus og Kasper er kommet på besøg
- Eficode speciliaser sig kun i DevOps

- Summary

  - Fast Feedbak is important
  - Teams must be able to work independently. They should still take responsiblity
  - The agile mindset is continous improvement

- Notes

  We are software engineers because we built blueprints for our work, but are like other engineers ?
  When it comes to software it is easier to be agile, than hardware.
  It is dangerous to think you know better than the users who work in their domain.
  As a software engineer you can work in a domain for several years, and think you know it all, but that is dangerous. In the end you are still a software engineer, and a sales man in the car industry know their domain better than you, so you must always take their input. However, not every user input is valuable but some are. Just take that into consideration.

  You cannot use devops in the waterfall model.

  DevOps and software engineers have different roles. They might not even use the same tools.

# Devops uge 7

Weekly devOps principle is the end to end responsiblity as in Dev and Ops must become 1.

We have to remember to be critical of the tools we use.

Static code analysis: Analyzing the code without executing it
Dynamic code analysis: Analyzing the code executing it

We can show our static score analysis if we are critical about it.

DevOps is a approach and a culture.
You also have to be critical of your approach and figure out improve it.

DevOps Handbook is something that will asked for your exam.

Consider while reading the material, how your group applies these principles.

     - Flow
     - Feedback
     - Continual Learning and Experimentation

## The Three Ways (Detailed Explanation):

The "Three Ways" are foundational principles underpinning DevOps practices, promoting effective flow, continuous feedback, and constant learning.

1. The First Way - Flow

   Direction: Left-to-right (Development → Operations → Customer).

   Goal: Improve the smooth and rapid movement of work through the pipeline.

   Methods:
   Making all work visible.
   Reducing batch sizes (small, frequent changes).
   Limiting Work in Process (WIP) to enhance efficiency.
   Embedding quality from the start to avoid passing defects downstream.
   Result: Shorter deployment lead times (from months to minutes), higher throughput, faster value delivery.

2. The Second Way - Feedback

   Direction: Right-to-left (Operations → Development).

   Goal: Facilitate rapid feedback on every stage of the value stream to quickly detect and fix issues.

   Methods:
   Immediate feedback mechanisms (e.g., automated testing, continuous integration).
   Swarming on problems to prevent recurrence.
   Result: Improved quality, reduced failure rates, and systems that are safer to change due to earlier detection and rapid correction of issues.

3. The Third Way - Continual Learning and Experimentation

   Goal: Create a culture of experimentation, high trust, continuous learning, and innovation.

   Methods:

   Encouraging risk-taking within safe boundaries.
   Designing systems for rapid learning from both successes and failures.
   Sharing knowledge across the organization to enhance collective improvement.
   Result: An adaptive organization that learns quickly and continually improves, thereby staying competitive and resilient.

#### information silos vs knowledge silos

information silos: Departments are isolated from each other and do not share data or information

knowledge silos: expertise is isolated is not shared across teams or individuals.

#### Two on going tracks

Technical tracks

DevOps principle

---

The andon cord means everyone swarms a problem, and it gives a good yield when programming and solving problems.

---

If a major incident occurs you can make a blameless postmortem.

## Continous Deployment

Continous delivery = Vi pakker vores produkt ind og gøre det til en artifakt
Continous Deployement = Vi pusher vores artifakt i skyen.

We have to achieve full continous deployement.

Instead of having our github repository in the server we can make it as a image
(Read the slides) and make a docker image which you push to docker hub. Create a workflow that will run each time you push and a workflow will run which also triggers in the server that gets the newest version of the codebase.
Create a workflow

- Have your image loaded up in docker hub everytime you update your code

#### Quality gates

You can have jobs on your workflows that tests the quality of your gates.
You can use the needs keywords to ensure that job A and job B is successfull before it can proceed.

## GitOps

GitOps is a way of implementing Continuous Deployment for cloud native applications.
