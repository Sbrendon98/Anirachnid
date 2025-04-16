import React from 'react';
import ReactDOM from 'react-dom/client'
import { HydratedRouter } from "react-router-dom";
import reactRouterConfig from '../react-router.config';

ReactDOM.hydrateRoot(
    document,
    <React.StrictMode>
        <HydratedRouter />
    </React.StrictMode>
)