/// <summary>
/// Table "JPO Lego SubTheme" (ID 60002).
/// </summary>
table 60002 "JPO Lego SubTheme"
{
    Caption = 'Lego SubTheme';
    DataClassification = CustomerContent;
    DrillDownPageId = "JPO Lego SubTheme List";
    LookupPageId = "JPO Lego SubTheme List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    JPOLegoSetup.Get();
                    NoSeriesManagement.TestManual(JPOLegoSetup."SubTheme Nos.");
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
            TableRelation = "JPO Lego Theme";
        }
        field(4; "Theme Title"; Text[100])
        {
            CalcFormula = lookup("JPO Lego Theme".Title where("No." = field("Theme No.")));
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
            JPOLegoSetup.TestField("SubTheme Nos.");
            NoSeriesManagement.InitSeries(JPOLegoSetup."SubTheme Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        OnAfterOnInsert(Rec, xRec);
    end;

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit() Result: Boolean
    var
        JPOLegoSubTheme: Record "JPO Lego SubTheme";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, xRec, Result, IsHandled);
        if IsHandled then
            exit(Result);

        JPOLegoSubTheme := Rec;
        JPOLegoSetup.Get();
        JPOLegoSetup.TestField("SubTheme Nos.");
        if NoSeriesManagement.SelectSeries(JPOLegoSetup."SubTheme Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesManagement.SetSeries("No.");
            Rec := JPOLegoSubTheme;
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnInsert(Rec: Record "JPO Lego SubTheme"; xRec: Record "JPO Lego SubTheme")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(Rec: Record "JPO Lego SubTheme"; xRec: Record "JPO Lego SubTheme"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsert(Rec: Record "JPO Lego SubTheme"; var IsHandled: Boolean)
    begin
    end;
}