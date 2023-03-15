/// <summary>
/// Unknown "JPO Lego Permissions" (ID 60000).
/// </summary>
permissionset 60000 "JPO Lego Permissions"
{
    Assignable = true;
    Caption = 'Lego PermissionSet', MaxLength = 30;
    Permissions =
        table "JPO Lego Set" = X,
        tabledata "JPO Lego Set" = RIMD,
        table "JPO Lego Setup" = X,
        tabledata "JPO Lego Setup" = RIMD,
        table "JPO Lego SubTheme" = X,
        tabledata "JPO Lego SubTheme" = RIMD,
        table "JPO Lego Theme" = X,
        tabledata "JPO Lego Theme" = RIMD,
        codeunit "JPO Lego Backup CSV" = X,
        codeunit "JPO Lego Backup JSON" = X,
        codeunit "JPO Lego Backup XLSX" = X,
        codeunit "JPO Lego Backup XML" = X,
        page "JPO Lego Set Card" = X,
        page "JPO Lego Set List" = X,
        page "JPO Lego Setup Card" = X,
        page "JPO Lego SubTheme Card" = X,
        page "JPO Lego SubTheme List" = X,
        page "JPO Lego Theme Card" = X,
        page "JPO Lego Theme List" = X;
}