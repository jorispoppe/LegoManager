/// <summary>
/// Enum "LEGO BackupType" (ID 60000) implements Interface "LEGO BackupInterface".
/// </summary>
enum 60000 "LEGO BackupType" implements "LEGO BackupInterface"
{
    Extensible = true;

    value(0; CSV)
    {
        Caption = 'CSV';
        Implementation = "LEGO BackupInterface" = "LEGO Backup CSV";
    }
    value(1; XSLX)
    {
        Caption = 'XSLX';
        Implementation = "LEGO BackupInterface" = "LEGO Backup JSON";
    }
    value(2; JSON)
    {
        Caption = 'JSON';
        Implementation = "LEGO BackupInterface" = "LEGO Backup XLSX";
    }
    value(3; XML)
    {
        Caption = 'XML';
        Implementation = "LEGO BackupInterface" = "LEGO Backup XML";
    }
}