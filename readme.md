# SDAI-project
This is my project from the course of Symbolic and Distributed AI (University of Genoa, 2025). 

### Details of the project
The project will focus on a library/office scenario, with some clients that are requesting services. In this scenario we have different kinds of agents, based on their role and what they would like to achieve. The clients will have to wait in order to be received; since there is a time factor, an "impatient client" could be implemented. The workers are those agents that could help, getting a service or a information. The workers could also take a lot of time to do their work, and can be declared "unprofessional": this could spark another event, which is a complaint to HR. In this case, HR workers would be a special kind of worker agents.
Since the basic MAS implementation of the project in Jason would be "banal", I will do it with VEsNA-ProC, which already provides a graphic user interface, along with some features (like character propenties).
After this proposal, I modified some specifics: the main one is that I should have used VEsNA-Pro, instead of VEsNA-ProC. The difference is that VEsNA-ProC implements also cooperation, which was not needed in my scenario. However, some problems with the software resulted in the impossibility of using propensities: in the final version of my project I simply used VEsNA.

VEsNA is a tool available at [VEsNA-ToolKit](https://github.com/VEsNA-ToolKit).

### Structure of the repository
Folders
- `src\agt`: code for the agents (`.asl`)
- `vesna`: all the VEsNA files in Java
- `via`: three main Java classes for movement

Files
- `vesna.jcm`: configuration file for the MAS