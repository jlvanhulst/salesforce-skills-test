public class DataGeneratorController {
    public PageReference generateData() {
        try {
            DataGenerationService.generateData();
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Success! Sample data has been generated.'));
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error: ' + e.getMessage()));
        }
        return null;
    }
}
