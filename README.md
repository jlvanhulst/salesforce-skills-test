# Salesforce Skills Assessment Package

This unmanaged package is designed to test Salesforce development and administration skills. It contains a set of custom objects, fields, and record types that simulate a real-world scenario with some intentional "quirks" to test attention to detail.

## Package Contents

### Custom Objects
- **Training Course** (`Training_Course__c`): Tracks training sessions.
- **Certification** (`Certification__c`): Tracks certifications earned by contacts.

### Standard Object Extensions
- **Account**: Custom fields for segmentation and health scoring. Record types for Customer, Prospect, and Partner.
- **Contact**: Custom fields for training and certification tracking.

### User Interface
- **Custom App**: "Salesforce Skills Test" app with a simplified menu (Accounts, Contacts, Training Courses, Certifications, Reports).
- **Account Page**: Custom Lightning Record Page highlighting related lists.

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

5.  **Generate Sample Data (Optional):**
    If you deployed via CLI (or if the post-install script didn't run), you can generate sample data by running this anonymous Apex:
    ```bash
    sfdx force:apex:execute -u TestOrg -f scripts/apex/generate_data.apex
    ```
    *Note: You'll need to create the file `scripts/apex/generate_data.apex` with the content: `DataGenerationService.generateData();`*

## Exercises

### Exercise 1: Data Modeling & Validation
1.  Review the `Training_Course__c` object. Notice anything odd about the "Duration" field? Fix it so the label matches the API name unit, or update the help text to clarify.
2.  Create a Validation Rule on `Certification__c` to ensure `Expiration_Date__c` is after `Certification_Date__c`.

### Exercise 2: Record Types & Page Layouts
1.  Assign the new Account Record Types to your profile.
2.  Create a Page Layout for the "Partner" record type that hides the "Account Health Score" field.

### Exercise 3: "Sneaky" Field Cleanup
There are some fields with misleading labels. Find them and correct them:
- Check Account fields for mismatches between Label and API Name.
- Check Contact fields for similar issues.

### Exercise 4: Automation
1.  Create a Flow that automatically sets the `Status__c` of a `Certification__c` to "Expired" if the `Expiration_Date__c` is passed.

## "Sneaky" Features Key (For Interviewer)
- **Account**:
    - `Legacy_System_ID__c` is labeled "Account Priority".
    - `Account_Priority__c` is labeled "Legacy ID".
- **Contact**:
    - `Secondary_Work_Email__c` is labeled "Personal Email".
- **Training Course**:
    - `Duration_Hours__c` is labeled "Duration (Days)".
