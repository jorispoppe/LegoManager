/// <summary>
/// Page "JPO Lego SubTheme Card" (ID 60005).
/// </summary>
page 60005 "JPO Lego SubTheme Card"
{
    ApplicationArea = All;
    Caption = 'JPO Lego SubTheme Card';
    PageType = Card;
    SourceTable = "JPO Lego SubTheme";
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Theme No."; Rec."Theme No.")
                {
                    ToolTip = 'Specifies the value of the Theme No. field.';
                }
                field("Theme Title"; Rec."Theme Title")
                {
                    ToolTip = 'Specifies the value of the Theme Title field.';
                }
            }
        }
    }
}