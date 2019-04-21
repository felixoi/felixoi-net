import {createLocalVue, mount} from '@vue/test-utils'
import Navigation from '@/components/Navigation.vue'
import BootstrapVue from "bootstrap-vue";

const localVue = createLocalVue()

localVue.use(BootstrapVue)

describe('Navigation', () => {
  test('is a Vue instance', () => {
    const wrapper = mount(Navigation, {localVue})
    expect(wrapper.isVueInstance()).toBeTruthy()
  })
})
