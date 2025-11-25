@isTest
private class DataGenerationServiceTest {
    @isTest
    static void testGenerateData() {
        Test.startTest();
        DataGenerationService.generateData();
        Test.stopTest();

        // Verify data creation
        System.assertEquals(1, [SELECT Count() FROM Account WHERE Name = 'Wayne Enterprises']);
        System.assertEquals(1, [SELECT Count() FROM City__c WHERE Name = 'Gotham City']);
        System.assertEquals(1, [SELECT Count() FROM Group__c WHERE Name = 'Gotham Vigilantes']);
        System.assertEquals(1, [SELECT Count() FROM Volunteer__c WHERE Name = 'Dick Grayson']);
    }

    @isTest
    static void testController() {
        DataGeneratorController controller = new DataGeneratorController();
        Test.startTest();
        controller.generateData();
        Test.stopTest();

        // Verify data creation (should be idempotent or skipped if already exists)
        System.assertEquals(1, [SELECT Count() FROM Account WHERE Name = 'Wayne Enterprises']);
    }

    @isTest
    static void testPostInstall() {
        PostInstallScript script = new PostInstallScript();
        Test.testInstall(script, null);

        // Verify data creation
        System.assertEquals(1, [SELECT Count() FROM Account WHERE Name = 'Wayne Enterprises']);
    }
}
