/// <summary>
/// Table "LEGO Theme" (ID 60001).
/// </summary>
table 60001 "LEGO Theme"
{
    Caption = 'Lego Theme';
    DataClassification = CustomerContent;
    DrillDownPageId = "LEGO Theme List";
    LookupPageId = "LEGO Theme List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    LegoSetup.Get();
                    NoSeriesManagement.TestManual(LegoSetup."Theme Nos.");
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
        LegoSetup: Record "LEGO Setup";
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
            LegoSetup.Get();
            LegoSetup.TestField("Theme Nos.");
            NoSeriesManagement.InitSeries(LegoSetup."Theme Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        OnAfterOnInsert(Rec, xRec);
    end;

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit() Result: Boolean
    var
        LegoTheme: Record "LEGO Theme";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, xRec, Result, IsHandled);
        if IsHandled then
            exit(Result);

        LegoTheme := Rec;
        LegoSetup.Get();
        LegoSetup.TestField("Theme Nos.");
        if NoSeriesManagement.SelectSeries(LegoSetup."Theme Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesManagement.SetSeries("No.");
            Rec := LegoTheme;
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnInsert(Rec: Record "LEGO Theme"; xRec: Record "LEGO Theme")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(Rec: Record "LEGO Theme"; xRec: Record "LEGO Theme"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsert(Rec: Record "LEGO Theme"; var IsHandled: Boolean)
    begin
    end;
}