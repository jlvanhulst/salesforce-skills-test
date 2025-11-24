public class DataGenerationService {

    public static void generateData() {
        // Check if data already exists to prevent duplicates
        if ([SELECT Count() FROM Account WHERE Name = 'Wayne Enterprises'] > 0) {
            return;
        }

        // Create Creative Accounts
        List<Account> accounts = new List<Account>();

        Account wayne = new Account(
            Name = 'Wayne Enterprises',
            Industry_Segment__c = 'Enterprise',
            Annual_Contract_Value__c = 5000000,
            Customer_Since__c = Date.newInstance(1939, 5, 1),
            Strategic_Account__c = true,
            Account_Health_Score__c = 95,
            Legacy_System_ID__c = 'BAT-001', // Sneaky Label: Account Priority
            Account_Priority__c = 'High' // Sneaky Label: Legacy ID
        );
        accounts.add(wayne);

        Account stark = new Account(
            Name = 'Stark Industries',
            Industry_Segment__c = 'Enterprise',
            Annual_Contract_Value__c = 10000000,
            Customer_Since__c = Date.newInstance(1963, 3, 1),
            Strategic_Account__c = true,
            Account_Health_Score__c = 88, // Tony is volatile
            Legacy_System_ID__c = 'IRON-002',
            Account_Priority__c = 'High'
        );
        accounts.add(stark);

        Account cyberdyne = new Account(
            Name = 'Cyberdyne Systems',
            Industry_Segment__c = 'Mid-Market',
            Annual_Contract_Value__c = 750000,
            Customer_Since__c = Date.newInstance(1984, 10, 26),
            Strategic_Account__c = false,
            Account_Health_Score__c = 10, // Impending doom
            Legacy_System_ID__c = 'SKY-003',
            Account_Priority__c = 'Low'
        );
        accounts.add(cyberdyne);

        Account dunder = new Account(
            Name = 'Dunder Mifflin',
            Industry_Segment__c = 'SMB',
            Annual_Contract_Value__c = 25000,
            Customer_Since__c = Date.newInstance(2005, 3, 24),
            Strategic_Account__c = false,
            Account_Health_Score__c = 60,
            Legacy_System_ID__c = 'PAPER-004',
            Account_Priority__c = 'Medium'
        );
        accounts.add(dunder);

        insert accounts;

        // Create Contacts
        List<Contact> contacts = new List<Contact>();

        contacts.add(new Contact(FirstName = 'Bruce', LastName = 'Wayne', AccountId = wayne.Id, Email = 'bruce@wayne.com', Preferred_Contact_Method__c = 'Email', Certification_Level__c = 'Expert', Secondary_Work_Email__c = 'batman@justiceleague.org'));
        contacts.add(new Contact(FirstName = 'Lucius', LastName = 'Fox', AccountId = wayne.Id, Email = 'lucius@wayne.com', Preferred_Contact_Method__c = 'Phone', Certification_Level__c = 'Advanced'));

        contacts.add(new Contact(FirstName = 'Tony', LastName = 'Stark', AccountId = stark.Id, Email = 'tony@stark.com', Preferred_Contact_Method__c = 'Video Call', Certification_Level__c = 'Expert', Secondary_Work_Email__c = 'ironman@avengers.com'));
        contacts.add(new Contact(FirstName = 'Pepper', LastName = 'Potts', AccountId = stark.Id, Email = 'pepper@stark.com', Preferred_Contact_Method__c = 'Email', Certification_Level__c = 'Advanced'));

        contacts.add(new Contact(FirstName = 'Miles', LastName = 'Dyson', AccountId = cyberdyne.Id, Email = 'miles@cyberdyne.com', Preferred_Contact_Method__c = 'Email', Certification_Level__c = 'Intermediate'));

        contacts.add(new Contact(FirstName = 'Michael', LastName = 'Scott', AccountId = dunder.Id, Email = 'michael@dundermifflin.com', Preferred_Contact_Method__c = 'Phone', Certification_Level__c = 'Basic', Secondary_Work_Email__c = 'littlekidlover@hotmail.com'));
        contacts.add(new Contact(FirstName = 'Dwight', LastName = 'Schrute', AccountId = dunder.Id, Email = 'dwight@dundermifflin.com', Preferred_Contact_Method__c = 'SMS', Certification_Level__c = 'Intermediate', Secondary_Work_Email__c = 'beets@schrute.com'));

        insert contacts;

        // Create Training Courses
        List<Training_Course__c> courses = new List<Training_Course__c>();
        courses.add(new Training_Course__c(
            Course_Title__c = 'Superhero Ethics 101',
            Course_Description__c = 'Basic principles of being a hero.',
            Duration_Hours__c = 4, // Sneaky: Days
            Max_Participants__c = 50,
            Status__c = 'Open for Registration',
            Course_Date__c = Date.today().addDays(30)
        ));
        courses.add(new Training_Course__c(
            Course_Title__c = 'Advanced Gadgetry',
            Course_Description__c = 'Building suits and batmobiles.',
            Duration_Hours__c = 40,
            Max_Participants__c = 5,
            Status__c = 'Planned',
            Course_Date__c = Date.today().addDays(60)
        ));
        courses.add(new Training_Course__c(
            Course_Title__c = 'Paper Sales Techniques',
            Course_Description__c = 'How to sell paper in a digital world.',
            Duration_Hours__c = 8,
            Max_Participants__c = 20,
            Status__c = 'Completed',
            Course_Date__c = Date.today().addDays(-10)
        ));
        insert courses;

        // Create Certifications
        List<Certification__c> certs = new List<Certification__c>();
        certs.add(new Certification__c(Contact__c = contacts[0].Id, Training_Course__c = courses[1].Id, Certification_Date__c = Date.today().addDays(-365), Expiration_Date__c = Date.today().addDays(365), Score__c = 100, Status__c = 'Active')); // Bruce
        certs.add(new Certification__c(Contact__c = contacts[2].Id, Training_Course__c = courses[1].Id, Certification_Date__c = Date.today().addDays(-200), Expiration_Date__c = Date.today().addDays(165), Score__c = 99.9, Status__c = 'Active')); // Tony
        certs.add(new Certification__c(Contact__c = contacts[6].Id, Training_Course__c = courses[2].Id, Certification_Date__c = Date.today().addDays(-5), Expiration_Date__c = Date.today().addDays(360), Score__c = 85, Status__c = 'Active')); // Dwight

        insert certs;
    }
}
