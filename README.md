# README

Demo application that lists TV4 idol participants.
Built using RoR.

#Installation
1. git clone git@github.com:ismailmechbal/letsdance.git
2. cd letsdance && bundle
3. install Foreman "gem install foreman"
4. foreman start

#Instruction
Redis is used as the main cache layer, it caches the requests to TV4 api and expires every hour.