/// <summary>
/// Page "LEGO Theme List" (ID 60001).
/// </summary>
page 60001 "LEGO Theme List"
{
    ApplicationArea = All;
    Caption = 'Lego Theme List';
    CardPageId = "LEGO Theme Card";
    PageType = List;
    SourceTable = "LEGO Theme";
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