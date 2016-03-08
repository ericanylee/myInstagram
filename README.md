# Project 6 - *myInstagram*

**myInstagram** is a photo sharing app using Parse as its backend.

Time spent: 10 hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can sign up to create a new account using Parse authentication
- [x] User can log in and log out of his or her account
- [x] The current signed in user is persisted across app restarts
- [x] User can take a photo, add a caption, and post it to "Instagram"
- [x] User can view the last 20 posts submitted to "Instagram"

The following **optional** features are implemented:

- [ ] Show the username and creation time for each post
- [ ] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse.
- [ ] User Profiles:
   - [ ] Allow the logged in user to add a profile photo
   - [ ] Display the profile photo with each post
   - [ ] Tapping on a post's username or profile photo goes to that user's profile page

The following **additional** features are implemented:
- [x] Added refresh Control
- [x] User has option to choose between camera roll and taking a picture
- [x] An error alert if the user tries to post without any images

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How can I emplement adding friends and viewing others posts?


## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/LBuI4bN.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes
Some navigation among the view controllers got confusing (after uploading photo, dismissing the view controller, or after signing out, going back to the log in screen..etc)
I tried to retrieve created_at timestamps and username, but everything would be returned as nil.. Want to debug it

## License

    Copyright [2016] [Erica Lee]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
