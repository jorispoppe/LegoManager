/// <summary>
/// Page "LEGO Theme Card" (ID 60004).
/// </summary>
page 60004 "LEGO Theme Card"
{
    ApplicationArea = All;
    Caption = 'Lego Theme Card';
    PageType = Card;
    SourceTable = "LEGO Theme";
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
            }
        }
    }
}