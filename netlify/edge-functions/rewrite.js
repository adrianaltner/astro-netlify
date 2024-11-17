// export default async (request, context) => {
//     const path = context.geo?.country?.code === 'AU' ? '/edge/australia' : '/edge/not-australia';
//     return Response.redirect(new URL(path, request.url));
// };

// export const config = {
//     path: '/edge'
// };

export default async (request, context) => {
    // Hole den Ländercode aus der Geo-Information
    const countryCode = context.geo?.country?.code;

    // Erstelle den Pfad dynamisch basierend auf dem Ländercode oder Standardpfad
    const path = countryCode
        ? `/edge/${countryCode.toUpperCase()}` // Dynamischer Pfad basierend auf dem Ländercode
        : '/edge/not-available';              // Fallback-Pfad, falls kein Ländercode verfügbar ist

    return Response.redirect(new URL(path, request.url));
};

export const config = {
    path: '/edge'
};