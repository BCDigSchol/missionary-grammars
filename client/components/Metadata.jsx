import React from "react";

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

    return (
        <div id="img-holder">
            <dl>
                <dt>{labels.author}</dt>
                {text.authors.map((author) => (<dd>{author.first} {author.last}</dd>))}
                <dt>Date</dt>
                <dd>{text.year}</dd>
                <dt>{labels.publisher}</dt>
                {text.publisher.map((publisher) => (<dd>{publisher.name}</dd>))}
                <dt>Place</dt>
                <dd>{text.place}</dd>
                <dt>{labels.language}</dt>
                {text.languages.map((language) => (<dd>{language.designation}</dd>))}
            </dl>
        </div>
    );
};