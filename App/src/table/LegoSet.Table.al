/// <summary>
/// Table "JPOLegoSet" (ID 60003).
/// </summary>
table 60003 JPOLegoSet
{
    Caption = 'Lego Manager - Set';
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
            TableRelation = JPOLegoTheme;
        }
        field(6; "Theme Title"; Text[100])
        {
            CalcFormula = lookup(JPOLegoTheme.Title where("No." = field("Theme No.")));
            Caption = 'Theme Title';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "SubTheme No."; Code[20])
        {
            Caption = 'SubTheme No.';
            TableRelation = JPOLegoSubTheme where("Theme No." = field("Theme No."));
        }
        field(8; "SubTheme Title"; Text[100])
        {
            CalcFormula = lookup(JPOLegoSubTheme.Title where("No." = field("SubTheme No.")));
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
        JPOLegoSetup: Record JPOLegoSetup;
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            JPOLegoSetup.Get();
            JPOLegoSetup.TestField("Set Nos.");
            NoSeriesManagement.InitSeries(JPOLegoSetup."Set Nos.", xRec."No. Series", 0D, "No.", "No. Series");
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
        JPOLegoSet: Record JPOLegoSet;
    begin
        JPOLegoSet := Rec;
        JPOLegoSetup.Get();
        JPOLegoSetup.TestField("Set Nos.");
        if NoSeriesManagement.SelectSeries(JPOLegoSetup."Set Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesManagement.SetSeries("No.");
            Rec := JPOLegoSet;
            exit(true);
        end;
    end;
}