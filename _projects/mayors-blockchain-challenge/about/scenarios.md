---
title: Info for Participants
position: 1
---

You don’t have to wait until the 28th to start working on your solution! Use the info and resources below to start now. Make sure your build can handle all the points in each scenario, as well as these general requirements:

**Your solution should be able to handle:**
* Bulk document uploads
* Notation of assets that are verified in real life
* Smart contracts
* An opt-in/consent process
* Built on a private blockchain
* Non-transferable assets

Want to discuss, collaborate, or join a team? [Join the Mayor's Blockchain Challenge Slack Channel!](https://join.slack.com/t/atx-mbc/shared_invite/enQtNDAyODg1Nzg4NDE2LWM0ZDllYzc1ZjUzYzEyNjk2NzczM2NiZjZjM2MzNTBiMGQ5ZTcwYzFhNmEyZjYxNDYzMjQyN2FlMDIwYjJhZDk)

## The Big Idea
We hope the blockchain-based solutions we test at the Challenge will help:

**People experiencing homelessness:**
* Increase their agency to achieve their own goals, and complete tasks that improve their chances of accessing vital services.
* Increase their motivation to take the next steps in self care.
* Overcome barriers to accessing vital health and human services.
* Control their own information and records.

**Homelessness service providers:**

* Eliminate miscommunication and missed opportunities.
* Get more complete and accurate health information from individuals and other service providers.
* Compile and manage complex combinations of records that individuals must submit to receive services.
* If approved by the individual, provide important records to other service providers almost seamlessly.

**We’ll consider the Challenge a success if the solutions we create together:**

* Provide easier access to homeless services
* Enable people who are experiencing homelessness to control their own records
* Can manage complex combinations of documents
* Connect currently disconnected sources and providers, and 
* Provide seamless access to records

### Our Goals for the Weekend
Here are the four goals for the Challenge weekend:
1. Prove or disprove that blockchain technology is better than a traditional shared database for validating identity and enabling access to information that will in turn make it easier to access homelessness services. [Here are the assessment guidelines](https://blockchain-working-group.github.io/blockchain-playbook/phases/1/) that we’ll use to test this hypothesis.

2. Demonstrate a minimal viable product that lets people experiencing homelessness easily store documents that help them access services. A low-friction user experience is critical for a successful MVP. [Here's some great blockchain design advice.](https://media.consensys.net/designing-for-blockchain-whats-different-and-what-s-at-stake-b867eeade1c9)
3. Help develop a body of evidence that we’ll use to submit for the Mayors Challenge grant application from Bloomberg Philanthropies. If successful, the City of Austin could win $1 million or $5 million to continue pursuing these solutions. Specifically, we need demonstrate:
    * Evidence that the idea can have the desired impact
    * What are the the most important metrics we’ll be able to generate
    * Key roadmap elements required for successful full-scale implementation
    * The biggest risks to successful implementation, and mitigation strategies
4. Build awareness and community around the potential use of blockchain for civic and social good, and how technology in general can help end homelessness.


###  What’s the weekend worth?
* Help prove the usefulness of blockchain technologies for the civic and social sectors.
* A chance at winning $2,000 for the winning submission or $1,000 for the runner-up.
* Build evidence for our grant application to Bloomberg Philanthropies. [See the grant details here.](https://mayorschallenge.bloomberg.org/2018-champion-cities/)
* Test your solutions with real people, get advice and critique by blockchain experts, service providers, and community members.
* Get credit for being awesome!

### Getting On the Same Page
The American Council for Technology (ACT) and Industry Advisory Council (IAC) has put out a [Blockchain Playbook for Government](https://blockchain-working-group.github.io/blockchain-playbook/phases/2/). In it, they recommend a framework-based design that will establish guidelines that are modular, reusable, and extendible.

We've taken a stab at such a framework, understanding that projects built today will have to be reworked or re- implemented onto the eventual leading platforms in the future. Here’s [the framework and vocabulary we’re using in this project](https://airtable.com/invite/l?inviteId=invw73mTVNd8ruDFt&inviteToken=77bf2b0fe9dd2ae224642e81f0fb417f7c2250c69f4ce19b6f914c5d98c39775) - we’re focused on the document as the unit of measure. Yours might be different - but at least you can connect to us, and let us know where you disagree or need to deviate.
 

### Putting Technical Design Decisions in Context
You’re the tech experts, and you know best. What we in the public sector know is that certain decisions will likely be better suited for the current reality of government. If you want to get into the government head-space on this technology, the OECD has a great document about [blockchain in the public sector](https://www.oecd-ilibrary.org/governance/blockchains-unchained_3c32c429-en). And here’s more from ACT-IAC on [evaluation criteria for blockchain in the public sector](https://blockchain-working-group.github.io/blockchain-playbook/phases/1/).

## What You'll Devleop

There are several service packages available to people within the homeless community in Austin, such as basic medical insurance, disability benefits, and housing. Applying for each of these service packages requires several documents (assets) from different sources or service providers (entities), and each needs to be certified at a different level. In some cases, a self-uploaded asset (uncertified) is sufficient. 

For the Challenge, **your submission must facilitate at least 2 of the 3 service packages described below, and demonstrate the following functions:**

* At least (1) primary asset received from the source
* At least (1) asset verified through a transaction
* At least (1) self-upload
* At least (1) smart contract
* Transact with at least (5) entities in your overall solution

Additionally, you should incorporate the following constraint: *non-transferability*. What do we mean by this?

* Once an asset is certified, it’s owner should not be able to send (transfer) it to anyone else. Correct ownership is required to certify an asset as “verified” or “validated”.
* Assets used to obtain services should be shared (and appended to revoke when they expire) instead of transferred to service providers.

## Service Packages and Requirements

Your solution should address at least 2 of these 3 service packages.

### 1) Medical Access Provider (MAP) card
This is the most basic and easily accessible type of medical insurance available to a person experiencing homelessness. The card is provided by Central Health through an in-person assessment. With a MAP card, you have access to clinics, can get necessary medicine, and are able to receive emergency care.
* With this service package, your solution needs at least:
    * (2) entities:
        * Central Health needs access the user’s documentation, and issues the MAP card
        * DPS is the source of a Texas ID card to prove identity
    * (1) smart contract that can show:
        * Expiry of the MAP card, which expires after 6 months, or immediately if the card holder receives a Medicaid card
        * The service package’s level of completion (expressed as a percentage)

**[Airtable](https://airtable.com/shrJymkil7qIkGhDR) tab:** MAP Card Package

**Current application requirements** (for reference): https://www.medicalaccessprogram.net/do-i-qualify/documents-to-bring/

### 2) Housing application
People can apply for supportive housing in Austin through several service providers, but applicants must also complete a coordinated assessment. In order to qualify for this housing package, a user must prove identity and a disability, and a case worker must attest to the user’s homelessness status.
* With this service package, your solution needs at least:
    * (3) entities:
        * DPS is the source of a Texas ID card for proof of identity
        * Central Health can attest to disability through medical records
        * Austin Community Court provides case workers for people experiencing homelessness. They are the source for the case manager letter required to prove homelessness.
    * (1) smart contract that can show:
        * The service package’s level of completion (expressed as a percentage)

**[Airtable](https://airtable.com/shrJymkil7qIkGhDR) tab:** Housing Package

** Current application requirements** (for reference): https://www.thn.org/wp-content/uploads/2018/03/7.-TxBoSCoC_PSH_Eligibility-Packet-V3.pdf

### 3) SOAR/Expedited disability application
The goal of SOAR is to expedite access to critical services for people in danger of or currently experiencing homelessness who have a documented disability. A case worker completes the SOAR application on behalf of a user, and the completed application is ultimately submitted to the Social Security Administration.
* With this service package, your solution needs at least:
    * (2) entities:
        *  representative: A case worker with either the Sunrise Community Church or Trinity Center organizations. This entity needs access to the user’s documentation, and will submit the SOAR application on behalf of the user.
        * User: has all self-uploads and documentation, and will need to share (not send) assets with their personal representative.
    * Self-uploads:
        * Most documentation for this package is self-uploaded, including the form to assign a personal representative (which the personal representative needs to also sign)

**[Airtable](https://airtable.com/shrJymkil7qIkGhDR) tab:** SOAR Package

**Current application requirements** (for reference): https://soarworks.prainc.com/article/complete-application-soar-packet

 

## Build Scenario - Released 07/13/2018

### The Setup
Steven Smith has been homeless on and off for the past decade since experiencing major health issues. He is currently living in an encampment in South Austin and regularly checks in at Sunrise Community Church with Maggie, one of their staff members who helps people experiencing homelessness navigate the complexity of receiving services.
 
Today, Steven walks into Sunrise and overhears a conversation about this new technology that allows you to have a digital copy of your ID, so if you lose your ID (or it’s stolen), you still have a form of valid identification.
 
He grabs a cup of coffee and finds Maggie to ask her about the platform. He has his Texas driver’s license but is nervous that it will be stolen like his phone was last week. Can she help get him on the system and create a trusted copy of his ID?

### Build requirements
* At least two entities, one for Steven and one for Maggie. Maggie's entity should also belong to a parent entity, Sunrise Community Church.
* At least one asset with an image of the Texas driver's license attached.
* Final state of a validated and verified ID asset on Steven's profile that cannot be reassigned.
* Please also include a flow diagram of how your solution works.
* In order for an ID to be valid, it needs to be both *validated* as an actual ID and *verified* that it belongs to the person claiming it. This must be done by a person of established authority and not Steven (the person claiming the ID).

### [Resources](https://drive.google.com/open?id=1vDnShoZ-ZzkdlLXzaE_F4p_LVUkdRIhQ)
* UI interface prototypes*
* Steven Smith persona
* Maggie Yun persona
* Texas driver's license image file
* myPass branding standards

<sub>&#42;This is meant to illustrate only one possibility of how the Steven and Maggie might experience the interaction.</sub>

### Things to keep in mind
* How will you show that this ID is validated and verified?
* How will it be accessed to read or use?
* How would you use blockchain to solve this scenario?
* How else might you solve it?
* Is blockchain better? Why/why not?

#### [Answer these questions about Scenario 1!](https://airtable.com/shrJQ0hLxsC4LCIB3)
