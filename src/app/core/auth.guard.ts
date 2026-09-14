import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from './auth.service';

async function waitUntilReady(auth: AuthService): Promise<void> {
  if (auth.ready()) return;
  await new Promise<void>((resolve) => {
    const started = Date.now();
    const tick = () => {
      if (auth.ready() || Date.now() - started > 8000) resolve();
      else requestAnimationFrame(tick);
    };
    tick();
  });
}

export const authGuard: CanActivateFn = async () => {
  const auth = inject(AuthService);
  const router = inject(Router);
  await waitUntilReady(auth);
  if (auth.isLoggedIn()) return true;
  return router.createUrlTree(['/login']);
};

export const adminGuard: CanActivateFn = async () => {
  const auth = inject(AuthService);
  const router = inject(Router);
  await waitUntilReady(auth);
  if (auth.isAdmin()) return true;
  return router.createUrlTree(['/daily']);
};
