# OmniAuth Azure Active Directory

This is a fork of Microsoft's official ruby gem for Azure Active Directory as an omniauth provider.  Most of this README is taken from Microsoft's original gem, [found here](https://github.com/AzureAD/omniauth-azure-activedirectory), with additions to make it compatible with other providers.

OmniAuth strategy to authenticate to Azure Active Directory via OpenId Connect.

Before starting, set up a tenant and register a Web Application at [https://manage.windowsazure.com](https://manage.windowsazure.com). Note your client id and tenant for later.

# Why this Repo?

While Microsoft's original gem still works, when Azure AD is being used as the only provider for omniauth, it hasn't been updated in a significant amount of time.  When trying to implement this gem in my own projects, I faced the issue of having many runtime dependency conflicts, meaning I either needed to use older versions of other provider gems (not always possible), or update this gem for myself.  This repo is the result of deciding on the latter.

## Samples and Documentation

[Find Microsoft's examples here](https://github.com/AzureADSamples) to help you get started with learning the Azure Identity system. This includes tutorials for native clients such as Windows, Windows Phone, iOS, OSX, Android, and Linux. There you can also find full walkthroughs for authentication flows such as OAuth2, OpenID Connect, Graph API, and other features provided by Microsoft. 

## How to use this SDK

#### Installation

Add to your Gemfile:

```ruby
gem 'omniauth-activedirectory'
```

### Usage

If you are already using OmniAuth, adding AzureAD is as simple as adding a new provider to your `OmniAuth::Builder`. The provider requires your AzureAD client id and your AzureAD tenant.

For example, in Rails you would add this in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :activedirectory, ENV['AAD_CLIENT_ID'], ENV['AAD_TENANT']
  # other providers here
end
```

When you want to authenticate the user, simply redirect them to `/auth/activedirectory`. From there, OmniAuth will takeover. Once the user authenticates (or fails to authenticate), they will be redirected to `/auth/activedirectory/callback`. The authentication result is available in `request.env['omniauth.auth']`.


### Auth Hash

OmniAuth AzureAD tries to be consistent with the auth hash schema recommended by OmniAuth. [https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema](https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema).

Here's an example of an authentication hash available in the callback. You can access this hash as `request.env['omniauth.auth']`.

```
  :provider => "azureactivedirectory",
  :uid => "123456abcdef",
  :info => {
    :name => "John Smith",
    :email => "jsmith@contoso.net",
    :first_name => "John",
    :last_name => "Smith"
  },
  :credentials => {
    :code => "ffdsjap9fdjw893-rt2wj8r9r32jnkdsflaofdsa9"
  },
  :extra => {
    :session_state => '532fgdsgtfera32',
    :raw_info => {
      :id_token => "fjeri9wqrfe98r23.fdsaf121435rt.f42qfdsaf",
      :id_token_claims => {
        "aud" => "fdsafdsa-fdsafd-fdsa-sfdasfds",
        "iss" => "https://sts.windows.net/fdsafdsa-fdsafdsa/",
        "iat" => 53315113,
        "nbf" => 53143215,
        "exp" => 53425123,
        "ver" => "1.0",
        "tid" => "5ffdsa2f-dsafds-sda-sds",
        "oid" => "fdsafdsaafdsa",
        "upn" => "jsmith@contoso.com",
        "sub" => "123456abcdef",
        "nonce" => "fdsaf342rfdsafdsafsads"
      },
      :id_token_header => {
        "typ" => "JWT",
        "alg" => "RS256",
        "x5t" => "fdsafdsafdsafdsa4t4er32",
        "kid" => "tjiofpjd8ap9fgdsa44"
      }
    }
  }
```
