FROM rails:onbuild

ENV DWKEYPROD prodkey
ENV DWKEYUAT sandboxkey
ENV DWREDIRECT redirecturi
ENV DWSECPROD prodsecret
ENV DWSECUAT uatsecret
ENV SECRET_KEY_BASE cookiesecret
ENV RAILS_ENV uat
ENV RACK_ENV uat

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

