# DynAddress
Each year, 10% of the Swiss population moves home ([source](https://www.baloise.com/en/home/news-stories/news/media-releases/2021/report-on-home-moving-in-switzerland-in-2020.html#:~:text=Every%20year%2C%20more%20than%20450%2C000,cent%20of%20the%20country's%20population.)). In the online world, this currently requires changing addresses across many sites. Leveraging Adnovum's VCMS, sharing this belongs to the past!

## Inspiration
As students, we move around a lot for education. Changing addresses online can be a needless hassle. In addition, some websites require verified addresses (for example, banks). Using Adnovum's VCMS, we saw a way to avoid this problem. Our solution allows trusted providers to issue credentials to users which can then be used across all sites. The days of having to update one's address in every website belong to the past!

## What it does
Our solution allows a trusted provider (e.g. the government), to issue verified credentials (e.g. one's address) to a user. 
Using this trusted credential, the user can 1. now control their privacy across multiple websites and 2. share the same address credential across all sites. This improves one's privacy and also removes the need for updating one's address across many websites. 
Furthermore, the sites can now know the validity of the address given that it was issued by the government. This removes the need for complicated validation processes for banks and other entities.
The issuer can easily update the user's address by revoking the old credential and issuing a new one. 

## How we built it
We use Adnovum's VCMS API to manage and create credentials. Specifically, we define a schema containing the address. From this, we allow credential issuing by the trusted entity (government). The user can then accept a credential, add them to their wallet, and then use this to securely provide their information to other sites. We allow address updates by revoking the previous address, and providing an updated credential. The user has full control of their privacy. In order to illustrate how this works in a intuitive manner, we create a website showing this process.

## Challenges we ran into
There are a couple of limitations we found
- When a schema is created, the tails database is hard coded and cannot be changed
- Connection id is sometimes camelcased or snakecased in API calls
- If a credential verification is rejected by the user, then the status remains "IN_PROGRESS" forever
- To add revocation functionality, a separate server is needed to be set up
- Revocation of a credential is not shown in the mobile app

## Accomplishments that we're proud of
We have achieved a
- Clearly laid out website
- Working backend showing our process
- Showed that our idea works in general can be extended to other use cases

## What we learned
- Adnovum VCMS API
- Details of credential issuing process
- Advanced web development skills

## What's next for DynAddress
Our idea can easily be extended to many other use cases. For example, we can use the same concept for
- Providing phone numbers (credentials can be issued by the phone number providers)
- Email addresses
-  Passport/ID
- Removing the need for painful OAuth2 calls by issuing private public key pairs. This means one is no longer tracked.
