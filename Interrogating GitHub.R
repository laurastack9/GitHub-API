install.packages("jsonlite")
library(jsonlite)
install.packages("httpuv")
library(httpuv)
#install.packages("httr")
library(httr)

# Can be github, linkedin etc depending on application
oauth_endpoints("github")

# Change based on what you 
myapp <- oauth_app(appname = "Accessing_GitHub",
                   key = "eacf927480c5753cd99a",
                   secret = "7aa7a2f0943bff9f4acafb3de018b150bf575dff")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/laurastack9/repos", gtoken)

# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))

# Subset data.frame
gitDF[gitDF$full_name == "laurastack9/datasharing", "created_at"]

#above code sourced from https://towardsdatascience.com/accessing-data-from-github-api-using-r-3633fb62cb08

#Interrogate the Github API to extract data from my own github account
myData = fromJSON("https://api.github.com/users/laurastack9")

#displays number of followers
myData$followers 

followers = fromJSON("https://api.github.com/users/laurastack9/followers")
followers$login #gives user names of all my followers

myData$following #displays number of people I am following

following = fromJSON("https://api.github.com/users/laurastack9/following")
following$login #gives the names of all the people I am following

myData$public_repos #displays the number of repositories I have

repos = fromJSON("https://api.github.com/users/laurastack9/repos")
repos$name #Gives of the names of my public repositories
repos$created_at #Gives details of the dates the repositories were created 
repos$full_name #gives names of repositiories


myData$bio #Displays my bio

#Interrogate the Github API to extract data from another account by switching the username
ebroderiData = fromJSON("https://api.github.com/users/ebroderi")
ebroderiData$followers
ebroderiData$following 
ebroderiData$public_repos 
ebroderiData$bio 


