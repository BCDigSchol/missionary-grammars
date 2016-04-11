import React from "react";

import { LanguageMetadata } from "./LanguageMetadata.jsx";

export const Metadata = (props) => {
    let text = props.text;

    function is_plural(field) {
        return field.length > 1;
    }

    let labels = {
        author: is_plural(text.authors) ? 'Authors' : 'Author',
        publisher: is_plural(text.publisher) ? 'Publishers' : 'Publisher',
        language: is_plural(text.languages) ? 'Languages' : 'Language'
    };

    let languages = text.languages.map((lang) => (
        <LanguageMetadata key={lang.id + 'langkey'}
                          language={lang}
                          toggleOpenLangs={props.toggleOpenLangs}
                          open_langs={props.open_langs}/>));
    let authors = text.authors.map((author) => (<dd key={author.first+author.last}>{author.first} {author.last}</dd>));
    let publishers = text.publisher.map((publisher) => (<dd key={publisher.name}>{publisher.name}</dd>));

    return (
        <div>
            <dl>
                <dt>{labels.author}</dt>
                {authors}
                <dt>Date</dt>
                <dd>{text.year}</dd>
                <dt>{labels.publisher}</dt>
                {publishers}
                <dt>Place</dt>
                <dd>{text.place}</dd>
                <dt className="language-metadata-label">{labels.language}</dt>
                {languages}
            </dl>
        </div>
    );
};