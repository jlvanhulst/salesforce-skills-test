public class DataGenerationService {

    public static void generateData() {
        // Check if data already exists to prevent duplicates
        if ([SELECT Count() FROM Account WHERE Name LIKE 'Test Account%'] > 0) {
            return;
        }

        // Create Accounts
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<5; i++) {
            accounts.add(new Account(
                Name = 'Test Account ' + i,
                Industry_Segment__c = 'SMB',
                Annual_Contract_Value__c = 10000 * (i+1),
                Customer_Since__c = Date.today().addDays(-365),
                Strategic_Account__c = Math.mod(i, 2) == 0,
                Account_Health_Score__c = 80 + i,
                Legacy_System_ID__c = 'LEGACY-' + i, // Sneaky Label: Account Priority
                Account_Priority__c = 'High' // Sneaky Label: Legacy ID
            ));
        }
        insert accounts;

        // Create Contacts
        List<Contact> contacts = new List<Contact>();
        for(Account acc : accounts) {
            for(Integer j=0; j<2; j++) {
                contacts.add(new Contact(
                    FirstName = 'Test',
                    LastName = 'Contact ' + j + ' for ' + acc.Name,
                    AccountId = acc.Id,
                    Email = 'test' + j + '@' + acc.Name.replaceAll('\\s+', '') + '.com',
                    Preferred_Contact_Method__c = 'Email',
                    Certification_Level__c = 'Basic',
                    Secondary_Work_Email__c = 'personal' + j + '@gmail.com' // Sneaky Label: Personal Email
                ));
            }
        }
        insert contacts;

        // Create Training Courses
        List<Training_Course__c> courses = new List<Training_Course__c>();
        courses.add(new Training_Course__c(
            Course_Title__c = 'Salesforce Fundamentals',
            Course_Description__c = 'Introduction to Salesforce',
            Duration_Hours__c = 8, // Sneaky Label: Duration (Days)
            Max_Participants__c = 20,
            Status__c = 'Open for Registration',
            Course_Date__c = Date.today().addDays(30)
        ));
        courses.add(new Training_Course__c(
            Course_Title__c = 'Advanced Apex',
            Course_Description__c = 'Deep dive into Apex',
            Duration_Hours__c = 16,
            Max_Participants__c = 10,
            Status__c = 'Planned',
            Course_Date__c = Date.today().addDays(60)
        ));
        insert courses;

        // Create Certifications
        List<Certification__c> certs = new List<Certification__c>();
        for(Contact c : contacts) {
            if(Math.mod(contacts.indexOf(c), 2) == 0) {
                certs.add(new Certification__c(
                    Contact__c = c.Id,
                    Training_Course__c = courses[0].Id,
                    Certification_Date__c = Date.today().addDays(-30),
                    Expiration_Date__c = Date.today().addDays(335),
                    Score__c = 85.5,
                    Status__c = 'Active'
                ));
            }
        }
        insert certs;
    }
}
