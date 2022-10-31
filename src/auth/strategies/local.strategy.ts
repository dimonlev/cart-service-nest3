import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';

import { Strategy } from 'passport-local';
import { User } from 'src/users';

import { AuthService } from '../auth.service';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
  constructor(private authService: AuthService) {
    super();
  }

  async validate(user: User): Promise<any> {
    const user1 = this.authService.validateUser(user);

    if (!user1) {
      throw new UnauthorizedException();
    }

    return user1;
  }
}
