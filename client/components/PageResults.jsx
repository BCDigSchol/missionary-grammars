import React from "react";

export const PageResults = ({pages, handleUpdate}) => {

    console.log('here')
    console.log(pages)

    return (
        <ul>
            {pages.map((page) => (<li>
                <a onClick={() => {
                    handleUpdate(page.number)
                }}>
                    <span dangerouslySetInnerHTML={{__html: page.text}}></span>
                </a>
            </li>))}
        </ul>
    );
};