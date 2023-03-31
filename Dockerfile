FROM golang:alpine as builder
WORKDIR /build
COPY . .
RUN go build -o /nitter-rss-proxy

FROM alpine
LABEL maintainer="github.com/derat/nitter-rss-proxy"
EXPOSE 8080/tcp
COPY --from=builder /nitter-rss-proxy /nitter-rss-proxy
RUN chmod +x /nitter-rss-proxy
ENTRYPOINT ["/nitter-rss-proxy","-addr","0.0.0.0:8080","-timeout","20","-instances","https://nitter.lacontrevoie.fr,https://nitter.1d4.us,https://nitter.kavin.rocks,https://nitter.unixfox.eu,https://birdsite.xanny.family,https://nitter.moomoo.me,https://twitter.censors.us,https://nitter.grimneko.de,https://twitter.076.ne.jp,https://nitter.fly.dev,https://notabird.site,https://nitter.weiler.rocks,https://nitter.sethforprivacy.com,https://nitter.cutelab.space,https://nitter.nl,https://nitter.mint.lgbt,https://nitter.bus-hit.me,https://nitter.esmailelbob.xyz,https://tw.artemislena.eu,https://nitter.tiekoetter.com,https://nitter.spaceint.fr,https://nitter.privacy.com.de,https://nitter.poast.org,https://nitter.bird.froth.zone,https://nitter.dcs0.hu,https://twitter.dr460nf1r3.org,https://nitter.garudalinux.org,https://twitter.femboy.hu,https://nitter.privacydev.net,https://nitter.kylrth.com,https://nitter.foss.wtf,https://unofficialbird.com,https://nitter.projectsegfau.lt,https://nitter.eu.projectsegfau.lt,https://singapore.unofficialbird.com,https://canada.unofficialbird.com,https://india.unofficialbird.com,https://nederland.unofficialbird.com,https://uk.unofficialbird.com,https://nitter.qwik.space,https://read.whatever.social,https://nitter.rawbit.ninja,https://nitter.privacytools.io,https://nitter.sneed.network,https://n.sneed.network"]
