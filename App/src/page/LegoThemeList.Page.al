/// <summary>
/// Page "JPO Lego Theme List" (ID 60001).
/// </summary>
page 60001 "JPO Lego Theme List"
{
    ApplicationArea = All;
    Caption = 'Lego Themes';
    CardPageId = "JPO Lego Theme Card";
    PageType = List;
    SourceTable = "JPO Lego Theme";
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
            }
        }
    }
}