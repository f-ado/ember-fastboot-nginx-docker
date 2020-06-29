import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';
import fetch from 'fetch';

export default Route.extend({
  fastboot: service(),

  async model() {
    const { shoebox, isFastBoot } = this.fastboot;
    let shoeboxStore = shoebox.retrieve('test-store');

    let result = null;
    if (isFastBoot) {
      const response = await fetch('https://reqres.in/api/users', { method: 'GET' });
      result = await response.json();
      if (!shoeboxStore) {
        shoeboxStore = {};
        shoebox.put('test-store', shoeboxStore);
      }
      shoeboxStore.users = result;
      return { users: result };
    } else {
      return { users: shoeboxStore.users };
    }
  },
});
