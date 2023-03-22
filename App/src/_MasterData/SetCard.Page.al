/// <summary>
/// Page "LEGO Set Card" (ID 60006).
/// </summary>
page 60006 "LEGO Set Card"
{
    ApplicationArea = All;
    Caption = 'Lego Set Card';
    PageType = Card;
    SourceTable = "LEGO Set";
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
                field(Number; Rec.Number)
                {
                    ToolTip = 'Specifies the value of the Number field.';
                }
                field(NumberVariant; Rec.NumberVariant)
                {
                    ToolTip = 'Specifies the value of the NumberVariant field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.';
                }
            }
            group(Theme)
            {
                Caption = 'Theme';

                field("Theme No."; Rec."Theme No.")
                {
                    ToolTip = 'Specifies the value of the Theme No. field.';
                }
                field("Theme Title"; Rec."Theme Title")
                {
                    ToolTip = 'Specifies the value of the Theme Title field.';
                }
                field("SubTheme No."; Rec."SubTheme No.")
                {
                    ToolTip = 'Specifies the value of the SubTheme No. field.';
                }
                field("SubTheme Title"; Rec."SubTheme Title")
                {
                    ToolTip = 'Specifies the value of the SubTheme Title field.';
                }
            }
            group(AdditionalInfo)
            {
                Caption = 'Additional Information';
                field(Minifigs; Rec.Minifigs)
                {
                    ToolTip = 'Specifies the value of the Minifigs field.';
                }
                field(Pieces; Rec.Pieces)
                {
                    ToolTip = 'Specifies the value of the Pieces field.';
                }
            }
        }
    }
}