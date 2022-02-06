import React from "react";

function Cooks(props) {
    return <div>
        <h1>These  Cooks are from the kitchen.</h1>
        {props.cooks.map((cook) => {
            return <div key={cook.id}> 
                <h2>{cook.title}</h2>
                <p>{cook.body}</p>
            </div>
        })}
    </div>
}

export default Cooks;