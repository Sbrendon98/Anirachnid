import {
    type RouteConfig,
    route
} from '@react-router/dev/routes'

export default [
    route("/", "./pages/Home.tsx"),
    route('/about', "./pages/About.tsx")
] satisfies RouteConfig