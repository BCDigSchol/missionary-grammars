import React from "react";

export const Paratexts = (flags) => {
    let flag_to_paratext = {
        addenda: 'addenda/errata',
        alphabet: 'alphabet',
        appendix: 'appendice',
        bulletin: 'bulletin',
        by_same_author: 'ouvrages du même auteur',
        contents: 'table de matières',
        foreward: 'avertissement',
        grammar_summary: false,
        grammatical_sketch: false,
        introduction: 'introduction',
        notize: 'notize (on pronunciation)',
        observations: 'observations',
        orthography: 'orthographe',
        orthography_and_pronunciation: 'orthographe et pronunciation',
        phrase_collection: 'recueil de phrases usuelles',
        preface: 'préface',
        proper_names: 'liste of principaux noms propers',
        prounciation: 'sa pronunciation',
        rules_of_language: false,
        signs_and_abbreviations: 'signes et abbréviations du dictionnaire',
        sodality: 'notes on the sodality',
        table_of_prefixes: 'table des préfixes et des accords'
    };

    let paratext_display_values = Object.keys(flags.flags).map(function (key) {
        if (flag_to_paratext[key] && flags.flags[key]) {
            return flag_to_paratext[key]
        } else {
            return false
        }
    });

    /* Remove blank entries */
    paratext_display_values = paratext_display_values.sort().filter(function (value) {
        return value
    });

    let paratexts = paratext_display_values.map((paratext)=>(<li>{paratext}</li>));


    return <ul className="paratext-list">
        {paratexts}
    </ul>
};