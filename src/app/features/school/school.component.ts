import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { SchoolProfile } from '../../core/models';
import { SchoolStore } from '../../core/school.store';

@Component({
  selector: 'app-school',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './school.component.html',
  styleUrl: './school.component.scss',
})
export class SchoolComponent {
  readonly store = inject(SchoolStore);

  readonly name = signal('');
  readonly shortName = signal('');
  readonly tagline = signal('');
  readonly address = signal('');
  readonly phone = signal('');
  readonly email = signal('');
  readonly website = signal('');
  readonly mapsUrl = signal('');
  readonly affiliation = signal('');
  readonly directorate = signal('');
  readonly establishedYear = signal('');
  readonly about = signal('');
  readonly busy = signal(false);
  readonly message = signal('');

  constructor() {
    this.hydrate(this.store.profile());
    void this.store.loadProfile().then(() => this.hydrate(this.store.profile()));
  }

  private hydrate(p: SchoolProfile): void {
    this.name.set(p.name);
    this.shortName.set(p.shortName);
    this.tagline.set(p.tagline);
    this.address.set(p.address);
    this.phone.set(p.phone);
    this.email.set(p.email);
    this.website.set(p.website);
    this.mapsUrl.set(p.mapsUrl);
    this.affiliation.set(p.affiliation);
    this.directorate.set(p.directorate);
    this.establishedYear.set(p.establishedYear != null ? String(p.establishedYear) : '');
    this.about.set(p.about);
  }

  async save(): Promise<void> {
    if (!this.name().trim() || !this.shortName().trim()) return;
    this.busy.set(true);
    this.message.set('');
    const yearRaw = this.establishedYear().trim();
    try {
      await this.store.saveProfile({
        id: 1,
        name: this.name().trim(),
        shortName: this.shortName().trim(),
        tagline: this.tagline().trim(),
        address: this.address().trim(),
        phone: this.phone().trim(),
        email: this.email().trim(),
        website: this.website().trim(),
        mapsUrl: this.mapsUrl().trim(),
        affiliation: this.affiliation().trim(),
        directorate: this.directorate().trim(),
        establishedYear: yearRaw ? Number(yearRaw) : null,
        about: this.about().trim(),
      });
      this.message.set('School details saved.');
    } catch (e) {
      this.message.set(e instanceof Error ? e.message : 'Could not save school details.');
    } finally {
      this.busy.set(false);
    }
  }
}
