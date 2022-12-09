/// <summary>
/// Table "JPOLegoTheme" (ID 60001).
/// </summary>
table 60001 JPOLegoTheme
{
    Caption = 'Lego Manager - Theme';
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
        JPOLegoSetup: Record JPOLegoSetup;
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            JPOLegoSetup.Get();
            JPOLegoSetup.TestField("Theme Nos.");
            NoSeriesManagement.InitSeries(JPOLegoSetup."Theme Nos.", xRec."No. Series", 0D, "No.", "No. Series");
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
        JPOLegoTheme: Record JPOLegoTheme;
    begin
        JPOLegoTheme := Rec;
        JPOLegoSetup.Get();
        JPOLegoSetup.TestField("Theme Nos.");
        if NoSeriesManagement.SelectSeries(JPOLegoSetup."Theme Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesManagement.SetSeries("No.");
            Rec := JPOLegoTheme;
            exit(true);
        end;
    end;
}