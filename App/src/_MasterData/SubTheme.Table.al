/// <summary>
/// Table "LEGO SubTheme" (ID 60002).
/// </summary>
table 60002 "LEGO SubTheme"
{
    Caption = 'Lego SubTheme';
    DataClassification = CustomerContent;
    DrillDownPageId = "LEGO SubTheme List";
    LookupPageId = "LEGO SubTheme List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    LegoSetup.Get();
                    NoSeriesManagement.TestManual(LegoSetup."SubTheme Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Title; Text[100])
        {
            Caption = 'Title';
        }
        field(3; "Theme No."; Code[20])
        {
            Caption = 'Theme No.';
            TableRelation = "LEGO Theme";
        }
        field(4; "Theme Title"; Text[100])
        {
            CalcFormula = lookup("LEGO Theme".Title where("No." = field("Theme No.")));
            Caption = 'Theme Title';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "No. Series"; Code[20])
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
        fieldgroup(Brick; "No.", "Theme Title", Title) { }
        fieldgroup(DropDown; "No.", "Theme Title", Title) { }
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
            LegoSetup.TestField("SubTheme Nos.");
            NoSeriesManagement.InitSeries(LegoSetup."SubTheme Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        OnAfterOnInsert(Rec, xRec);
    end;

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit() Result: Boolean
    var
        LegoSubTheme: Record "LEGO SubTheme";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, xRec, Result, IsHandled);
        if IsHandled then
            exit(Result);

        LegoSubTheme := Rec;
        LegoSetup.Get();
        LegoSetup.TestField("SubTheme Nos.");
        if NoSeriesManagement.SelectSeries(LegoSetup."SubTheme Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesManagement.SetSeries("No.");
            Rec := LegoSubTheme;
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnInsert(Rec: Record "LEGO SubTheme"; xRec: Record "LEGO SubTheme")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(Rec: Record "LEGO SubTheme"; xRec: Record "LEGO SubTheme"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsert(Rec: Record "LEGO SubTheme"; var IsHandled: Boolean)
    begin
    end;
}