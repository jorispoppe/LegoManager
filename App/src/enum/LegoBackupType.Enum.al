/// <summary>
/// Enum "JPOLegoBackupType" (ID 60000) implements Interface JPOLegoBackupInterface.
/// </summary>
enum 60000 JPOLegoBackupType implements JPOLegoBackupInterface
{
    Extensible = true;

    value(0; CSV)
    {
        Caption = 'CSV';
        Implementation = JPOLegoBackupInterface = JPOLegoBackupCSV;
    }
    value(1; XSLX)
    {
        Caption = 'XSLX';
        Implementation = JPOLegoBackupInterface = JPOLegoBackupJSON;
    }
    value(2; JSON)
    {
        Caption = 'JSON';
        Implementation = JPOLegoBackupInterface = JPOLegoBackupXLSX;
    }
    value(3; XML)
    {
        Caption = 'XML';
        Implementation = JPOLegoBackupInterface = JPOLegoBackupXML;
    }
}