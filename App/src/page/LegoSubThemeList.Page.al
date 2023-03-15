/// <summary>
/// Page "JPO Lego SubTheme List" (ID 60002).
/// </summary>
page 60002 "JPO Lego SubTheme List"
{
    ApplicationArea = All;
    Caption = 'Lego Subthemes';
    CardPageId = "JPO Lego SubTheme Card";
    PageType = List;
    SourceTable = "JPO Lego SubTheme";
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