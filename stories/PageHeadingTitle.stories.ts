import type { Meta, StoryObj } from '@storybook/vue3'
import PageHeadingTitle from '~/components/common/PageHeadingTitle.vue'

const meta: Meta<typeof PageHeadingTitle> = {
  title: 'Common/PageHeadingTitle',
  component: PageHeadingTitle,
  tags: ['autodocs'],
  argTypes: {
    type: {
      control: 'select',
      options: ['default', 'small', 'section'],
    },
    animate: {
      control: 'boolean',
    },
  },
}

export default meta
type Story = StoryObj<typeof PageHeadingTitle>

export const Default: Story = {
  args: {
    type: 'default',
    animate: false,
  },
  render: (args) => ({
    components: { PageHeadingTitle },
    setup() {
      return { args }
    },
    template: '<PageHeadingTitle v-bind="args">페이지 제목</PageHeadingTitle>',
  }),
}

export const Small: Story = {
  args: {
    type: 'small',
    animate: false,
  },
  render: (args) => ({
    components: { PageHeadingTitle },
    setup() {
      return { args }
    },
    template: '<PageHeadingTitle v-bind="args">작은 제목</PageHeadingTitle>',
  }),
}

export const Section: Story = {
  args: {
    type: 'section',
    animate: false,
  },
  render: (args) => ({
    components: { PageHeadingTitle },
    setup() {
      return { args }
    },
    template: '<PageHeadingTitle v-bind="args">섹션 제목</PageHeadingTitle>',
  }),
}
