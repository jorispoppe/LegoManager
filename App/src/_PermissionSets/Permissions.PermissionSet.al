/// <summary>
/// Unknown "LEGO Permissions" (ID 60000).
/// </summary>
permissionset 60000 "LEGO Permissions"
{
    Assignable = true;
    Caption = 'Lego PermissionSet', MaxLength = 30;
    Permissions =
        table "LEGO Set" = X,
        tabledata "LEGO Set" = RIMD,
        table "LEGO Setup" = X,
        tabledata "LEGO Setup" = RIMD,
        table "LEGO SubTheme" = X,
        tabledata "LEGO SubTheme" = RIMD,
        table "LEGO Theme" = X,
        tabledata "LEGO Theme" = RIMD,
        codeunit "LEGO Backup CSV" = X,
        codeunit "LEGO Backup JSON" = X,
        codeunit "LEGO Backup XLSX" = X,
        codeunit "LEGO Backup XML" = X,
        page "LEGO Set Card" = X,
        page "LEGO Set List" = X,
        page "LEGO Setup Card" = X,
        page "LEGO SubTheme Card" = X,
        page "LEGO SubTheme List" = X,
        page "LEGO Theme Card" = X,
        page "LEGO Theme List" = X;
}