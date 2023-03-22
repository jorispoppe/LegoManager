/// <summary>
/// Page "LEGO Set List" (ID 60003).
/// </summary>
page 60003 "LEGO Set List"
{
    ApplicationArea = All;
    Caption = 'Lego Set List';
    CardPageId = "LEGO Set Card";
    PageType = List;
    SourceTable = "LEGO Set";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                field(Number; Rec.Number)
                {
                    ToolTip = 'Specifies the value of the Number field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Theme Title"; Rec."Theme Title")
                {
                    ToolTip = 'Specifies the value of the Theme Title field.';
                }
                field("SubTheme Title"; Rec."SubTheme Title")
                {
                    ToolTip = 'Specifies the value of the SubTheme Title field.';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.';
                }
            }
        }
    }
}