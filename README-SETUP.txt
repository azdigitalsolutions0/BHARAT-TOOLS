M/S BHARAT TOOLS — PRO E-COMMERCE STARTER

WHAT'S INCLUDED
- Responsive storefront with premium black / yellow / ivory design
- Product categories, search, sorting, cart quantity controls
- Animated add-to-cart interaction
- WhatsApp order enquiry flow
- Customer sign-up / sign-in (Supabase)
- Separate Admin dashboard: product create/edit/delete, stock and price management, order status management
- Supabase SQL schema with Row Level Security policies
- Original Bharat Tools logo in assets/logo.png

IMPORTANT: TWO MODES
1) Preview mode: upload the files and open index.html / GitHub Pages. Browsing, sample catalogue, cart and WhatsApp enquiry work. Sample prices/products are placeholders.
2) Live mode: create a Supabase project and configure config.js. This enables real customer authentication, shared product database, orders and admin dashboard.

SETUP FOR LIVE MODE
1. Create a Supabase project at https://supabase.com/
2. Open SQL Editor and run the complete schema.sql file.
3. In Project Settings > API, copy Project URL and anon/public key.
4. Paste them into config.js:
   supabaseUrl: "https://YOURPROJECT.supabase.co",
   supabaseAnonKey: "YOUR_ANON_OR_PUBLISHABLE_KEY"
   Never paste service_role/secret key into frontend.
5. In Supabase Authentication > Providers, enable Email. Configure email confirmation and site URL / redirect URLs for your deployed site.
6. Sign up your own account through the storefront Account button.
7. In Supabase Dashboard > Authentication > Users, copy your user UUID.
8. In SQL Editor, run:
   insert into public.user_roles(user_id, role) values ('PASTE-USER-UUID', 'admin');
9. Open /admin.html and sign in using that same account. Admin access is checked against the user_roles table and enforced by database RLS.
10. Add real products, accurate prices and stock in Admin. Remove or replace sample catalogue before public launch.

GITHUB PAGES DEPLOY
- Put index.html, admin.html, style.css, app.js, admin.js, config.js, schema.sql, README-SETUP.txt and assets/ in the repository root.
- Settings > Pages > Deploy from branch > main > /(root).
- Storefront: https://USERNAME.github.io/REPOSITORY/
- Admin: https://USERNAME.github.io/REPOSITORY/admin.html

BUSINESS DETAILS CURRENTLY SHOWN
M/S BHARAT TOOLS
Aditya Complex, Main Road, Mehsi, East Champaran, Bihar – 845412
Call: 7492091123
WhatsApp: 7870339786
Website by AZ Digital Solutions

PLEASE VERIFY ADDRESS/PIN AND ALL CONTACT DETAILS BEFORE PRINTING OR LAUNCHING.

PRODUCTION CHECKLIST
- Replace sample products, descriptions, prices and stock with actual catalogue.
- Add real product photos (this build uses typographic/emoji visual placeholders).
- Configure Supabase Auth email templates and allowed redirect URLs.
- Test customer signup, sign-in, admin role, product CRUD, order creation and order status.
- Add privacy policy, terms, shipping/returns policy if relevant.
- Configure custom domain and HTTPS if required.
- For online card/UPI payment, integrate a payment provider with server-side order/payment verification. This starter does NOT collect online payments.
- Do not store customer passwords yourself. Supabase Auth handles credentials.
- GitHub Pages is static hosting; Supabase provides the backend.

PREMIUM DESIGN NOTE
The storefront hero is now product-led and does not use the logo as a large pasted hero image. The original logo remains unchanged in the header/footer. Replace placeholder visual areas with actual product photography before public marketing.

REAL CATALOGUE STARTER
The initial catalogue uses product models and product photos from STANLEY's official Asia product catalogue/pages. These are reference listings only, NOT confirmation that M/S Bharat Tools stocks these exact products or is an authorized STANLEY dealer. Prices are intentionally set to Contact for Price. Confirm with the shop and suppliers before publishing as available stock. Product image URLs are hosted by STANLEY and may change; for reliability, obtain permission and host approved images in your own assets folder.
Current image/product references: https://asia.stanleytools.global/products/power-tools
Do not imply brand authorization or stock availability without confirmation.
