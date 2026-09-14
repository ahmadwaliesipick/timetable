import { Routes } from '@angular/router';
import { adminGuard, authGuard } from './core/auth.guard';
import { ShellComponent } from './layout/shell.component';

export const routes: Routes = [
  {
    path: 'login',
    loadComponent: () =>
      import('./features/login/login.component').then((m) => m.LoginComponent),
  },
  {
    path: '',
    component: ShellComponent,
    canActivate: [authGuard],
    children: [
      { path: '', pathMatch: 'full', redirectTo: 'daily' },
      {
        path: 'daily',
        loadComponent: () =>
          import('./features/daily-desk/daily-desk.component').then((m) => m.DailyDeskComponent),
      },
      {
        path: 'my-day',
        loadComponent: () =>
          import('./features/my-day/my-day.component').then((m) => m.MyDayComponent),
      },
      {
        path: 'timetable',
        canActivate: [adminGuard],
        loadComponent: () =>
          import('./features/timetable/timetable.component').then((m) => m.TimetableComponent),
      },
      {
        path: 'teachers',
        canActivate: [adminGuard],
        loadComponent: () =>
          import('./features/teachers/teachers.component').then((m) => m.TeachersComponent),
      },
      {
        path: 'classes',
        canActivate: [adminGuard],
        loadComponent: () =>
          import('./features/classes/classes.component').then((m) => m.ClassesComponent),
      },
      {
        path: 'subjects',
        canActivate: [adminGuard],
        loadComponent: () =>
          import('./features/subjects/subjects.component').then((m) => m.SubjectsComponent),
      },
      {
        path: 'periods',
        canActivate: [adminGuard],
        loadComponent: () =>
          import('./features/periods/periods.component').then((m) => m.PeriodsComponent),
      },
      {
        path: 'school',
        canActivate: [adminGuard],
        loadComponent: () =>
          import('./features/school/school.component').then((m) => m.SchoolComponent),
      },
    ],
  },
  { path: '**', redirectTo: 'daily' },
];
