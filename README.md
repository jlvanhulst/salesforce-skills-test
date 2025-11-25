# Salesforce Skills Assessment Package

This unmanaged package is designed to test Salesforce development and administration skills. It contains a set of custom objects, fields, and record types that simulate a real-world Volunteer Management scenario.

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

### Option 1: One-Click Deploy (Recommended for Quick Testing)

<a href="https://githubsfdeploy.herokuapp.com?owner=jlvanhulst&repo=salesforce-skills-test&ref=main">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

*Note: This button requires the repository to be hosted on GitHub.*

### Option 2: Manual Deployment (CLI)

Use this method to test your SFDX skills or if you want to modify the code before deploying.

1.  **Clone the repository:**
    ```bash
    git clone <repo-url>
    cd salesforce-test
    ```

2.  **Authorize your Dev Hub (if not already done):**
    ```bash
    sfdx auth:web:login -d -a MyDevHub
    ```

3.  **Create a Scratch Org:**
    ```bash
    sfdx force:org:create -f config/project-scratch-def.json -a TestOrg -s -d 30
    ```
    *Note: You may need to create the `config/project-scratch-def.json` file if it doesn't exist, or deploy to a developer edition org.*

4.  **Deploy the Source:**
    ```bash
    sfdx force:source:deploy -p force-app -u TestOrg
    ```

5.  **Generate Sample Data:**
    *   Open the **Salesforce Skills Test** App.
    *   Click on the **Data Generator** tab.
    *   Click the **Generate Sample Data** button.
    *   *Alternatively, you can run this anonymous Apex: `DataGenerationService.generateData();`*

## Challenges

We have prepared a list of challenges to test your skills, ranging from basic configuration to advanced integrations and AI solutions.

👉 **[View the Challenges Roadmap](CHALLENGES.md)**
