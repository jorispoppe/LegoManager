/// <summary>
/// Table "JPO Lego Theme" (ID 60001).
/// </summary>
table 60001 "JPO Lego Theme"
{
    Caption = 'Lego Theme';
    DataClassification = CustomerContent;
    DrillDownPageId = "JPO Lego Theme List";
    LookupPageId = "JPO Lego Theme List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    JPOLegoSetup.Get();
                    NoSeriesManagement.TestManual(JPOLegoSetup."Theme Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Title; Text[100])
        {
            Caption = 'Title';
        }
        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; "No.", Title) { }
        fieldgroup(DropDown; "No.", Title) { }
    }

    var
        JPOLegoSetup: Record "JPO Lego Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeInsert(Rec, IsHandled);
        if IsHandled then
            exit;

        if "No." = '' then begin
            JPOLegoSetup.Get();
            JPOLegoSetup.TestField("Theme Nos.");
            NoSeriesManagement.InitSeries(JPOLegoSetup."Theme Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        OnAfterOnInsert(Rec, xRec);
    end;

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit() Result: Boolean
    var
        JPOLegoTheme: Record "JPO Lego Theme";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, xRec, Result, IsHandled);
        if IsHandled then
            exit(Result);

        JPOLegoTheme := Rec;
        JPOLegoSetup.Get();
        JPOLegoSetup.TestField("Theme Nos.");
        if NoSeriesManagement.SelectSeries(JPOLegoSetup."Theme Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesManagement.SetSeries("No.");
            Rec := JPOLegoTheme;
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnInsert(Rec: Record "JPO Lego Theme"; xRec: Record "JPO Lego Theme")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(Rec: Record "JPO Lego Theme"; xRec: Record "JPO Lego Theme"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsert(Rec: Record "JPO Lego Theme"; var IsHandled: Boolean)
    begin
    end;
}