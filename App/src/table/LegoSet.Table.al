/// <summary>
/// Table "JPO Lego Set" (ID 60003).
/// </summary>
table 60003 "JPO Lego Set"
{
    Caption = 'Lego Set';
    DataClassification = CustomerContent;
    DrillDownPageId = "JPO Lego Set List";
    LookupPageId = "JPO Lego Set List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    JPOLegoSetup.Get();
                    NoSeriesManagement.TestManual(JPOLegoSetup."Set Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Number; Text[20])
        {
            Caption = 'Number';
        }
        field(3; NumberVariant; Integer)
        {
            Caption = 'NumberVariant';
        }
        field(4; Name; Text[150])
        {
            Caption = 'Name';
        }
        field(5; "Theme No."; Code[20])
        {
            Caption = 'Theme No.';
            TableRelation = "JPO Lego Theme";

            trigger OnValidate()
            begin
                CalcFields("Theme Title");
            end;
        }
        field(6; "Theme Title"; Text[100])
        {
            CalcFormula = lookup("JPO Lego Theme".Title where("No." = field("Theme No.")));
            Caption = 'Theme Title';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "SubTheme No."; Code[20])
        {
            Caption = 'SubTheme No.';
            TableRelation = "JPO Lego SubTheme" where("Theme No." = field("Theme No."));

            trigger OnValidate()
            begin
                CalcFields("SubTheme Title");
            end;
        }
        field(8; "SubTheme Title"; Text[100])
        {
            CalcFormula = lookup("JPO Lego SubTheme".Title where("No." = field("SubTheme No.")));
            Caption = 'SubTheme Title';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; Year; Integer)
        {
            Caption = 'Year';
        }
        field(10; Pieces; Integer)
        {
            Caption = 'Pieces';
        }
        field(11; Minifigs; Integer)
        {
            Caption = 'Minifigs';
        }
        field(12; Thumbnail; Media)
        {
            Caption = 'Thumbnail';
            ExtendedDatatype = None;
        }
        field(13; "No. Series"; Code[20])
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
        fieldgroup(Brick; "No.", Name, "Theme Title", "SubTheme Title", Thumbnail) { }
        fieldgroup(DropDown; "No.", Name, "Theme Title", "SubTheme Title") { }
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
            JPOLegoSetup.TestField("Set Nos.");
            NoSeriesManagement.InitSeries(JPOLegoSetup."Set Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        OnAfterOnInsert(Rec, xRec);
    end;

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit() Result: Boolean
    var
        JPOLegoSet: Record "JPO Lego Set";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, xRec, Result, IsHandled);
        if IsHandled then
            exit(Result);

        JPOLegoSet := Rec;
        JPOLegoSetup.Get();
        JPOLegoSetup.TestField("Set Nos.");
        if NoSeriesManagement.SelectSeries(JPOLegoSetup."Set Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesManagement.SetSeries("No.");
            Rec := JPOLegoSet;
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnInsert(Rec: Record "JPO Lego Set"; xRec: Record "JPO Lego Set")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(Rec: Record "JPO Lego Set"; xRec: Record "JPO Lego Set"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsert(Rec: Record "JPO Lego Set"; var IsHandled: Boolean)
    begin
    end;
}