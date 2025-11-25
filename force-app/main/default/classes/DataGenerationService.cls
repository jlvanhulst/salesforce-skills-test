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

        // Create Cities
        List<City__c> cities = new List<City__c>();
        City__c gotham = new City__c(Name = 'Gotham City');
        cities.add(gotham);
        City__c metropolis = new City__c(Name = 'Metropolis');
        cities.add(metropolis);
        City__c starCity = new City__c(Name = 'Star City');
        cities.add(starCity);
        insert cities;

        // Create Groups
        List<Group__c> groups = new List<Group__c>();
        groups.add(new Group__c(Name = 'Gotham Vigilantes', City__c = gotham.Id));
        groups.add(new Group__c(Name = 'Wayne Foundation Volunteers', City__c = gotham.Id));
        groups.add(new Group__c(Name = 'Daily Planet Reporters', City__c = metropolis.Id));
        groups.add(new Group__c(Name = 'Queen Consolidated Helpers', City__c = starCity.Id));
        insert groups;

        // Create Volunteers
        List<Volunteer__c> volunteers = new List<Volunteer__c>();
        volunteers.add(new Volunteer__c(Name = 'Dick Grayson', Group__c = groups[0].Id, Email__c = 'robin@gotham.com', Phone__c = '555-0101', Status__c = 'Active'));
        volunteers.add(new Volunteer__c(Name = 'Barbara Gordon', Group__c = groups[0].Id, Email__c = 'oracle@gotham.com', Phone__c = '555-0102', Status__c = 'Active'));
        volunteers.add(new Volunteer__c(Name = 'Clark Kent', Group__c = groups[2].Id, Email__c = 'ckent@dailyplanet.com', Phone__c = '555-0201', Status__c = 'Active'));
        volunteers.add(new Volunteer__c(Name = 'Oliver Queen', Group__c = groups[3].Id, Email__c = 'oqueen@queencons.com', Phone__c = '555-0301', Status__c = 'Inactive'));
        insert volunteers;

        // Create Volunteer Hours
        List<Volunteer_Hours__c> hours = new List<Volunteer_Hours__c>();
        hours.add(new Volunteer_Hours__c(Volunteer__c = volunteers[0].Id, Date__c = Date.today().addDays(-1), Description__c = 'Patrolling the streets', Hours__c = 4));
        hours.add(new Volunteer_Hours__c(Volunteer__c = volunteers[0].Id, Date__c = Date.today().addDays(-2), Description__c = 'Training session', Hours__c = 2));
        hours.add(new Volunteer_Hours__c(Volunteer__c = volunteers[1].Id, Date__c = Date.today().addDays(-1), Description__c = 'Computer systems maintenance', Hours__c = 5));
        hours.add(new Volunteer_Hours__c(Volunteer__c = volunteers[2].Id, Date__c = Date.today().addDays(-5), Description__c = 'Reporting on local events', Hours__c = 8));
        insert hours;
    }
}
