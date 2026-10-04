# 📓 AuraNotes

A clean, minimal note-taking web application built with **Ruby on Rails 8**. AuraNotes lets you create, organize, and manage your personal notes with color-coded cards — all behind a secure authentication system.

---

## ✨ Features

- 🔐 **User Authentication** — Secure sign up, sign in & sign out powered by Devise
- 📝 **Notes CRUD** — Create, view, edit and delete your personal notes
- 🎨 **Color-coded Cards** — Assign a custom color to each note for easy visual organization
- 🏠 **Smart Home Page** — Shows your notes dashboard when logged in, landing page for guests
- 🔔 **Flash Notifications** — Clean toast-style alerts for all actions (login, logout, note changes)
- 📱 **Responsive UI** — Mobile-friendly layout built with Tailwind CSS v4

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Ruby on Rails 8.1 |
| Language | Ruby 3.4 |
| Database | PostgreSQL |
| Authentication | Devise 4.9+ |
| Styling | Tailwind CSS v4 (via tailwindcss-rails) |
| Frontend | Hotwire (Turbo + Stimulus) + Importmap |
| Asset Pipeline | Propshaft |
| Web Server | Puma |
| Process Manager | Foreman |

---

## 📋 Prerequisites

Before you begin, make sure you have the following installed:

- **Ruby** `3.4+`
- **Rails** `8.1+`
- **PostgreSQL** `14+`
- **Node.js** *(for Tailwind CSS build)*
- **Bundler** `gem install bundler`

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/auranotes.git
cd auranotes
```

### 2. Install dependencies

```bash
bundle install
```

### 3. Configure the database

Copy and edit your database credentials if needed in `config/database.yml`, then create and migrate the database:

```bash
bin/rails db:create
bin/rails db:migrate
```

### 4. Start the development server

```bash
bin/dev
```

This starts both the **Rails server** and the **Tailwind CSS watcher** together via Foreman.

Open your browser at **[http://localhost:3000](http://localhost:3000)**

---

## 📁 Project Structure

```
auranotes/
├── app/
│   ├── assets/
│   │   └── tailwind/
│   │       └── application.css     # Tailwind v4 entry + color safelist
│   ├── controllers/
│   │   ├── home_controller.rb      # Root page (dashboard / landing)
│   │   └── notes_controller.rb     # Notes CRUD
│   ├── models/
│   │   ├── note.rb                 # belongs_to :user
│   │   └── user.rb                 # Devise user model
│   └── views/
│       ├── devise/                 # Auth pages (login, signup, etc.)
│       ├── home/                   # Landing page & notes dashboard
│       ├── layouts/
│       │   ├── _flash.html.erb     # Global flash notifications partial
│       │   └── _header.html.erb    # Navigation header
│       └── notes/                  # Note views (show, new, edit)
├── config/
│   └── routes.rb                   # Routes config
├── db/
│   └── schema.rb                   # Database schema
├── Procfile.dev                    # Foreman: Rails + Tailwind watcher
└── Gemfile
```

---

## 🗄️ Database Schema

### `users`
| Column | Type |
|--------|------|
| `email` | string (unique) |
| `encrypted_password` | string |
| `reset_password_token` | string |
| `created_at` | datetime |
| `updated_at` | datetime |

### `notes`
| Column | Type | Description |
|--------|------|-------------|
| `title` | string | Note title |
| `description` | string | Note body/content |
| `color` | string | Tailwind color name (e.g. `red`, `blue`) |
| `user_id` | bigint (FK) | Belongs to a user |
| `created_at` | datetime | |
| `updated_at` | datetime | |

---

## 🎨 Note Colors

Notes support dynamic color-coded borders. When creating/editing a note, enter a Tailwind color name in the **Color** field:

```
red | orange | amber | yellow | lime | green | emerald
teal | cyan | sky | blue | indigo | violet | purple
fuchsia | pink | rose
```

Example: entering `blue` gives the note card a blue top border (`border-t-blue-500`).

---

## 🧰 Useful Commands

```bash
# Start development server (Rails + Tailwind watcher)
bin/dev

# Run database migrations
bin/rails db:migrate

# Rebuild Tailwind CSS manually
bin/rails tailwindcss:build

# Open Rails console
bin/rails console

# Run security audit
bundle exec brakeman

# Check gem vulnerabilities
bundle exec bundler-audit
```

---

## 🔒 Authentication

Authentication is handled by **Devise**. The following routes are available:

| Action | Path |
|--------|------|
| Sign Up | `/users/sign_up` |
| Sign In | `/users/sign_in` |
| Sign Out | `DELETE /users/sign_out` |
| Edit Profile | `/users/edit` |
| Forgot Password | `/users/password/new` |

> The header is hidden on auth pages (login, signup, password reset) for a cleaner UI.

---

## 📦 Deployment

This app is Docker-ready via **Kamal**. To deploy:

```bash
# Configure your server details in config/deploy.yml
kamal setup
kamal deploy
```

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
