import React from "react";

export const LanguageMetadata = ({language,toggleOpenLangs, open_langs}) => {
    let alternates = language.alternate_designations.map((alt) => <li key={alt.designation}>{alt.designation}</li>);

    return <dd className="language-metadata-definition">
        <a
            onClick={() => toggleOpenLangs(language.id)}>
            {language.designation}
            <span className="extended-metadata-control"> {open_langs.indexOf(language.id) > -1 ? '-' : '+'}</span>
        </a>

        <div className="extended-metadata">
            <dl className={open_langs.indexOf(language.id) > -1 ? 'show' : 'hidden'}>
                <dt>ISO</dt>
                <dd>{language.iso}</dd>
                <dt>Alternate designations</dt>
                <dd>
                    <ul>{alternates}</ul>
                </dd>
                <dt>Macro-classification</dt>
                <dd>{language.macro_classification}</dd>
                <dt>Orthography</dt>
                <dd>{language.orthography}</dd>
            </dl>
        </div>
    </dd>
};