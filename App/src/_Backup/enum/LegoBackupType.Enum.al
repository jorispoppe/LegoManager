/// <summary>
/// Enum "JPO Lego BackupType" (ID 60000) implements Interface "JPO Lego BackupInterface".
/// </summary>
enum 60000 "JPO Lego BackupType" implements "JPO Lego BackupInterface"
{
    Extensible = true;

    value(0; CSV)
    {
        Caption = 'CSV';
        Implementation = "JPO Lego BackupInterface" = "JPO Lego Backup CSV";
    }
    value(1; XSLX)
    {
        Caption = 'XSLX';
        Implementation = "JPO Lego BackupInterface" = "JPO Lego Backup JSON";
    }
    value(2; JSON)
    {
        Caption = 'JSON';
        Implementation = "JPO Lego BackupInterface" = "JPO Lego Backup XLSX";
    }
    value(3; XML)
    {
        Caption = 'XML';
        Implementation = "JPO Lego BackupInterface" = "JPO Lego Backup XML";
    }
}