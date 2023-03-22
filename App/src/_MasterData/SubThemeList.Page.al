/// <summary>
/// Page "LEGO SubTheme List" (ID 60002).
/// </summary>
page 60002 "LEGO SubTheme List"
{
    ApplicationArea = All;
    Caption = 'Lego Subtheme List';
    CardPageId = "LEGO SubTheme Card";
    PageType = List;
    SourceTable = "LEGO SubTheme";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Theme Title"; Rec."Theme Title")
                {
                    ToolTip = 'Specifies the value of the Theme Title field.';
                }
            }
        }
    }
}