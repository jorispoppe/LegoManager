/// <summary>
/// Page "JPO Lego Setup Card" (ID 60000).
/// </summary>
page 60000 "JPO Lego Setup Card"
{
    ApplicationArea = All;
    Caption = 'Lego Manager - Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "JPO Lego Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Set Nos."; Rec."Set Nos.")
                {
                    ToolTip = 'Specifies the value of the Set No. Series field.';
                }
                field("Theme Nos."; Rec."Theme Nos.")
                {
                    ToolTip = 'Specifies the value of the Theme No. Series field.';
                }
                field("SubTheme Nos."; Rec."SubTheme Nos.")
                {
                    ToolTip = 'Specifies the value of the SubTheme No. Series field.';
                }
                field("Brickset ApiKey"; Rec."Brickset ApiKey")
                {
                    ToolTip = 'Specifies the value of the Brickset ApiKey field.';
                }
                field("Backup Type"; Rec."Backup Type")
                {
                    ToolTip = 'Specifies the value of the Backup Type field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}