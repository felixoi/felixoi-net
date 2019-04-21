<template>
  <div>
    <b-navbar id="layout-nav" variant="light" type="light" class="mb-4">
      <b-navbar-brand to="/">
        <img src="~assets/img/logo.svg" alt="felixoi.net" />
      </b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav class="ml-auto">
          <b-nav-item to="/sponge-theme-preview">
            Sponge Theme Preview
          </b-nav-item>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>
