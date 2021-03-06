/*-
 * Copyright (c) 2018 Tudor Plugaru (https://github.com/PlugaruT/vectorxpress)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
 *
 * Authored by: Tudor Plugaru <plugaru.tudor@gmail.com>
 */

namespace VectorXpress {
    public class VectorXpressApp : Gtk.Application {
        public VectorXpressApp () {
            Object (application_id: "com.github.plugarut.vectorxpress",
                    flags : ApplicationFlags.FLAGS_NONE);
        }


        protected override void activate () {
            var app_window = new MainWindow (this);
            app_window.show_all ();

            var quit_action = new SimpleAction ("quit", null);

            add_action (quit_action);
            add_accelerator ("Escape", "app.quit", null);

            quit_action.activate.connect (() => {
                                              if (app_window != null) {
                                                  app_window.destroy ();
                                              }
                                          });
        }


        private static int main (string[] args) {
            Gtk.init (ref args);

            var app = new VectorXpressApp ();
            return app.run (args);
        }
    }
}
