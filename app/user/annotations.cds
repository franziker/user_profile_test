using UserService as service from '../../srv/services';
annotate service.User with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>FullName}',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Email}',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Value : profilePicture.image,
                Label : '{i18n>ProfilePicture}',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>LanguagePreferences}',
            ID : 'LanguagePrecerences',
            Target : '@UI.FieldGroup#LanguagePrecerences',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>FullName}',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Email}',
            Value : email,
        },
    ],
    UI.FieldGroup #LanguagePrecerences : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : userlanguage.languageDescription,
                Label : '{i18n>UserLanguage}',
            },
            {
                $Type : 'UI.DataField',
                Value : systemlanguage.languageDescription,
                Label : '{i18n>SystemLanguage}',
            },
        ],
    },
);

annotate service.User with {
    systemlanguage @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'language',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : systemlanguage_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'languageCode',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'languageDescription',
            },
        ],
    }
};

annotate service.User with {
    userlanguage @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'language',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : userlanguage_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'languageCode',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'languageDescription',
            },
        ],
    }
};

annotate service.User with {
    profilePicture @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'image',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : profilePicture_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'image',
            },
        ],
    }
};

annotate service.User with {
    name @Common.FieldControl : #ReadOnly
};

annotate service.User with {
    email @Common.FieldControl : #ReadOnly
};

annotate service.User with {
    ID @Common.FieldControl : #ReadOnly
};

annotate service.language with {
    languageDescription @(
        Common.Text : languageCode,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'language',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : languageDescription,
                    ValueListProperty : 'languageCode',
                },
            ],
            Label : '{i18n>UserLanguage}',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.language with {
    languageCode @Common.Text : languageDescription
};

