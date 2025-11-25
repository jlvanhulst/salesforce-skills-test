# Salesforce Skills Assessment Package

This unmanaged package is designed to test Salesforce development and administration skills. It contains a set of custom objects, fields, and record types that simulate a real-world Volunteer Management scenario.
It is meant to be installed in a new, empty Developer Edition or Scratch Org.

**Do not install this in a production environment or an org with existing data/metadata, as it may cause conflicts.

## Package Contents

### Custom Objects
- **City** (`City__c`): Tracks cities where the organization operates.
- **Group** (`Group__c`): Tracks volunteer groups within a city.
- **Volunteer** (`Volunteer__c`): Tracks individual volunteers.
- **Volunteer Hours** (`Volunteer_Hours__c`): Tracks hours logged by volunteers.

### Standard Object Extensions
- **Account**: Custom fields for segmentation and health scoring. Record types for Customer, Prospect, and Partner.
- **Contact**: Custom fields for additional contact details.

### User Interface
- **Custom App**: "Salesforce Skills Test" app with tabs for Cities, Groups, Volunteers, and Volunteer Hours.

## Deployment Options

You can deploy this package using either the "One-Click" method or manually via the Salesforce CLI.

## Deployment

**IMPORTANT: This package is designed to be installed in a NEW, EMPTY Developer Edition or Scratch Org. Do not install this in a production environment or an org with existing data/metadata, as it may cause conflicts.**

### Recommended: One-Click Deploy

1.  **Create a new Developer Edition Org** (or use a fresh Scratch Org). [Sign up for a free Developer Edition here](https://www.salesforce.com/form/developer-signup/?d=pb).
2.  Log in to your new org. (Don't forget that your email is not your username - I always keep forgetting that. The username looks like an email)
3.  Click the button below to deploy the package directly to your org.

<a href="https://githubsfdeploy.herokuapp.com?owner=jlvanhulst&repo=salesforce-skills-test&ref=main">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

### Post-Deployment

**Generate Sample Data:**
1.  Open the **Salesforce Skills Test** App.
2.  Click on the **Data Generator** tab.
3.  Click the **Generate Sample Data** button.

## Challenges

We have prepared a list of challenges to test your skills, ranging from basic configuration to advanced integrations and AI solutions.

👉 **[View the Challenges Roadmap](CHALLENGES.md)**

If you have any questions or need assistance, please don't hesitate to ask jlvanhulst at gmail dot com.