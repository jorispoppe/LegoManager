/// <summary>
/// Table "JPOLegoSetup" (ID 60000).
/// </summary>
table 60000 JPOLegoSetup
{
    Caption = 'Lego Manager - Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Set Nos."; Code[20])
        {
            Caption = 'Set No. Series';
            TableRelation = "No. Series";
        }
        field(3; "Theme Nos."; Code[20])
        {
            Caption = 'Theme No. Series';
            TableRelation = "No. Series";
        }
        field(4; "SubTheme Nos."; Code[20])
        {
            Caption = 'SubTheme No. Series';
            TableRelation = "No. Series";
        }
        field(5; "Brickset ApiKey"; Text[50])
        {
            Caption = 'Brickset ApiKey';
        }
        field(6; "Backup Type"; enum JPOLegoBackupType)
        {
            Caption = 'Backup Type';
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; "Set Nos.", "Theme Nos.", "SubTheme Nos.", "Brickset ApiKey") { }
        fieldgroup(DropDown; "Set Nos.", "Theme Nos.", "SubTheme Nos.", "Brickset ApiKey") { }
    }
}