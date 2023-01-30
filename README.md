# Lura - TAMUhack 23

## Inspiration
Even today, one of the most common causes of patient harm is the inaccurate and delayed diagnosis of illnesses. In the recent aftermath left by COVID-19, people are even warier of diagnosis tests and symptom-based testing. Additionally, healthy and accurate testing is not affordable and available to all and this acts as a bottleneck for people in low-income communities. Not knowing whether they have a contagious disease can prevent their ability to work, resulting in more expensive treatment down the road, and in some cases - death. 

Seeing this, we thought there has to be a better way to not only diagnose people with respiratory diseases but also inform them about the impact the disease can have.

This two-form solution would allow us to prevent patients from thinking they just have the flu when they might have something serious and also, inform people of the risk they face with the disease. These two pieces of information, in our eyes, inform the patient and empower the patient to take health into their own hands.

Additionally, with a faster way of knowing whether you have COVID-19 or a respiratory disease, you could allow people to get back to work faster, allow people in low-income communities faster access to healthcare which helps them in many socioeconomic areas and allow for contactless testing which relieves the burden from the hospitals and doctors that we saw.

Motivated by the implications of this solution and the people we can help and how we help people, we named this Lura - Latin for mouth - to help them breathe easily for us and for their loved ones.

## What it does
Lura is an app that lets users get self-diagnosed for diseases like COVID-19 by simply coughing into their smartphone's microphone. Through the power of artificial intelligence and machine learning, Lura can detect diseases by simply analyzing your coughs with an accuracy of ~85%. Additionally, using the Fitbit API, Lura can tell the likely impact COVID-19 can have on you, based on your biometric data. With its two services, Lura aims to diagnose, create awareness, and ultimately make patients breathe easy.

## How we built it
We developed a full-stack iOS app using Xcode/Swift for the front end and Python for the back end to give the user an aesthetically-pleasing, but also functional software. Our full tech stack includes:

 - Swift
 - Python (Tensorflow, Librosa, PyDub)
 - Node.js / Express.js
 - Firebase
 - AWS

On top of that, we used the Fitbit API so users can connect their Fitbit smartwatch to get more specific medical information based on their biometrics.

## Accomplishments and challenges that we're proud of
One of the biggest things we are proud of is our machine learning. There was a huge learning curve to learning about audio classification and finding suitable datasets. We had to search in various research papers as data about coughing is considered private data - we even had to sign a data agreement for one! 
After collecting and synthesizing data, preparing the dataset for training was an uphill task. There were various avenues to take with modeling: approaches considered were LSTM, transformers, and CNNs. Ultimately, we decided to select
CNNs due to their special learning ability with images and the fact that audio can be well represented with images.
After that, our ability to train, get state-of-the-art results, deploy, and utilize them in a mobile app was a miracle - each step required hours of debugging and painstaking concentration.

Our second biggest achievement is our UI/UX. Developed by Cesar, the UI/UX seek to make the experience as calm and peaceful as possible whilst offering interfaces that allowed people who are not as advanced with technology/English to interact.
To go from wireframes to actual pages on screen that worked with our system was a very proud moment for us - we all remembered when we were able to get the first coughs working fully with the system!

## What we learned
One of the biggest things we learned was to temper our ambitions, be realistic with our goals, and constantly restrategize.

The idea that we had for our app was different than the one that has turned and we all think that that change was for the better as we incorporated advice from friends and the workshops.
We always ended up having small meetings where we talked about each other's progress, updated each on our own problems, and discussed compromises to our solution. All of us cut down on the ambition of our ideas or made them very realistic.
If it weren't for these meetings, we would not have made a functioning app - something that was incredibly gratifying to see.

Going hand in hand with this, communication was key and we really learned how vital it is for project management and development.

The ability for all of us to be honest with our goals, our work, our motivations, and our progress allowed all of us to constantly recalibrate our own ideas, motivations, and so on. 
In the long run, this allowed the team to look out for each other's work and be a more inclusive team.


## What's next for Lura
The big thing that we wanted to implement was recognition between varying types of respiratory diseases, primarily: common cough, pneumonia, and bronchitis.
We were able to find the dataset but did not have the time to integrate these different models into our workflow for this hackathon. The ability to find whether a cough
is a common cough, COVID, pneumonia, or bronchitis is a great aid to people as diagnosing between those diseases is often confusing. Especially for low-income
communities, the correct and early diagnosis can help them plan out their healthcare journey and be more aware. Of course, this goes without saying for everyone else
as well but low-income communities stand the most to be benefited from this service as in developing countries, pneumonia and bronchitis are still prevalent. 

The second thing in the future for Lura is to keep a track of the cough tests and the basic diagnosis for those tests. This data, which people can do on themselves
as often, can tremendously help doctors. With a past history that users can show to other people in the form of a summarized report, they can reach out to
doctors and hospitals and inform them with more knowledge about their symptoms. This can also further empower people to make more healthy and safe decisions such as
self-isolating. The ease with which the tests are performed and how we measure metrics means that the app is well-placed in care settings. Its non-invasive and voluntary
data collection means that it is able to build trust with the patient and as a result, be trusted by doctors. 

<img src="https://i.imgur.com/NBRWt0p.png" width="250"/>
<p float="left">
 <img src="https://i.imgur.com/dJgKDMn.jpg" width="250" hspace="20"/>
 <img src="https://i.imgur.com/KgTQD2r.jpg" width="250" hspace="20"/>
 <img src="https://i.imgur.com/VtutJkT.jpg" width="250" hspace="20"/>
</p>
