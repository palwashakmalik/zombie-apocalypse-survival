# zombie-apocalypse-survival
The world, as we know it, has fallen into an apocalyptic scenario. A disease is transforming human beings into violent creatures. This system will store information about the survivors, as well as the resources they own.
# **Roles**
*Admin*
1. Can view percentage of infected survivors.
2. Can view percentage of non-infected survivors.
3. Can view the average amount of each kind of resource by the survivor (e.g. 10 Fiji Waters per survivor)
4. Can view points lost because of an infected survivor.

*Survivor*:
1. Create Account, add Picture and location to its profile
2. Can update location and view previous locations
3. Can view other survivor inventory and send trade request
4. Can cancel, accept, reject trade requests
5. Flag survivor as infected
---
## Technology Stack
---
![Mac OS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Heroku](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)
---
| Tools/Technologies  | Description    |
| :---                |:----           |
| Ruby                | Version 2.7.6  |
| Rails               | Version 5.2.8.1|
| Postgres            | Version 14.4   |
| Bootsrap            | Version 5.2.0  |
# Development
### 1. Initial Setup
--------------------
Clone the project repo
-
```$ git clone https://github.com/palwashamalik/zombie-apocalypse-survival.git```
Get into the project directory
-
```$ cd zombie-apocalypse-survival```
Install gems and their dependencies
-
   ``` $ bundle install```
 ### 2. DB Setup
 -------------------------------
 * Setup Postgres
    https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos
 * Create database
 -
    ``` rails db:create ```
 * Migrate database
 -
    ``` rails db:migrate ```
 * Seed database
 -
    ``` rails db:seed ```
 ### 3. Cloudinary Setup
 -------------------------------
 * Create Account on cloudinary
 * Create cloudinary.yml file in config
 * Copy configuration parameters from cloudinary
 * Replace cloudinary parameters in storage.yml file
 Follow https://cloudinary.com/documentation/rails_integration
 ### 4. Start app Server
 -------------------------------
 * Start server
 -
   ``` rails s ```
 ## Servers
* Production: link
 ### 5.Links
 ----------------------------
 * Heroku link: link
