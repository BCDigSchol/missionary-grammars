import React from "react";

/**
 * Language Metadata component
 *
 * Displays a list of language metadata that can be expanded or collapsed.
 *
 * @param language the language object
 * @param toggleOpenLangs a function to open the language dropdown
 * @param open_langs an array of ids of expanded languages
 * @returns {XML}
 * @constructor
 */
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
                <dt>Alternate designations</dt>
                <dd>
                    <ul>{alternates}</ul>
                </dd>

                <dt>Macro-classification</dt>
                <dd>{language.macro_classification}</dd>

                <dt>ISO 639-3</dt>
                <dd>{language.iso}</dd>

                <dt>Glottolog</dt>
                <dd>{language.glottocode}</dd>

                <dt>Status</dt>
                <dd>{language.status}</dd>

                <dt>Orthography</dt>
                <dd>{language.orthography}</dd>

                <dt>Location</dt>
                <dd>{language.location}</dd>

                <dt>Coordinates</dt>
                <dd>{language.latitude}°, {language.longitude}°</dd>
            </dl>
        </div>
    </dd>
};