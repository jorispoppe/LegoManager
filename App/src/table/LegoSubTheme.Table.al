/// <summary>
/// Table "JPOLegoSubTheme" (ID 60002).
/// </summary>
table 60002 JPOLegoSubTheme
{
    Caption = 'Lego Manager - SubTheme';
    DataClassification = CustomerContent;

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
            TableRelation = JPOLegoTheme;
        }
        field(4; "Theme Title"; Text[100])
        {
            CalcFormula = lookup(JPOLegoTheme.Title where("No." = field("Theme No.")));
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
        JPOLegoSetup: Record JPOLegoSetup;
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            JPOLegoSetup.Get();
            JPOLegoSetup.TestField("SubTheme Nos.");
            NoSeriesManagement.InitSeries(JPOLegoSetup."SubTheme Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit(): Boolean
    var
        JPOLegoSubTheme: Record JPOLegoSubTheme;
    begin
        JPOLegoSubTheme := Rec;
        JPOLegoSetup.Get();
        JPOLegoSetup.TestField("SubTheme Nos.");
        if NoSeriesManagement.SelectSeries(JPOLegoSetup."SubTheme Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesManagement.SetSeries("No.");
            Rec := JPOLegoSubTheme;
            exit(true);
        end;
    end;
}