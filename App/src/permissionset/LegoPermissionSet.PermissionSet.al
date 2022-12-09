/// <summary>
/// Unknown "JPOLegoPermissionSet" (ID 60000).
/// </summary>
permissionset 60000 JPOLegoPermissionSet
{
    Assignable = true;
    Caption = 'Lego Manager - PermissionSet', MaxLength = 30;
    Permissions =
        table JPOLegoSet = X,
        tabledata JPOLegoSet = RMID,
        table JPOLegoSetup = X,
        tabledata JPOLegoSetup = RMID,
        table JPOLegoSubTheme = X,
        tabledata JPOLegoSubTheme = RMID,
        table JPOLegoTheme = X,
        tabledata JPOLegoTheme = RMID,
        codeunit JPOLegoBackupCSV = X,
        codeunit JPOLegoBackupJSON = X,
        codeunit JPOLegoBackupXLSX = X,
        codeunit JPOLegoBackupXML = X,
        page JPOLegoSetupCard = X;
}