import React, { PropTypes } from "react";

export const ReadBox = (props) => {
    function pad(num, size) {
        var s = num + "";
        while (s.length < size) s = "0" + s;
        return s;
    }

    var img_src = "/img/texts/" + props.text_id + "/" + pad(props.page, 4) + ".jpg";

    return (
        <div id="img-holder">
            <img src={img_src}/>
            <div className="img-page-num">{props.page}</div>
        </div>
    );
};