FROM golang:alpine as builder
WORKDIR /build
COPY . .
RUN go build -o /nitter-rss-proxy

FROM alpine
LABEL maintainer="github.com/derat/nitter-rss-proxy"
EXPOSE 8080/tcp
COPY --from=builder /nitter-rss-proxy /nitter-rss-proxy
RUN chmod +x /nitter-rss-proxy
ENTRYPOINT ["/nitter-rss-proxy","-addr","0.0.0.0:8080","-timeout","20","-instances","https://nitter.lacontrevoie.fr,https://nitter.1d4.us,https://nitter.kavin.rocks,https://birdsite.xanny.family,https://nitter.moomoo.me,https://nitter.grimneko.de,https://twitter.076.ne.jp,https://nitter.fly.dev,https://nitter.weiler.rocks,https://nitter.sethforprivacy.com,https://nitter.cutelab.space,https://nitter.mint.lgbt,https://nitter.esmailelbob.xyz,https://nitter.esmailelbob.xyz,https://tw.artemislena.eu,https://nitter.poast.org,https://nitter.bird.froth.zone,https://nitter.dcs0.hu,https://nitter.privacydev.net,https://nitter.kylrth.com,https://unofficialbird.com,https://singapore.unofficialbird.com,https://canada.unofficialbird.com,https://india.unofficialbird.com,https://nederland.unofficialbird.com,https://uk.unofficialbird.com,https://read.whatever.social,https://nitter.rawbit.ninja,https://nitter.sneed.network,https://nitter.smnz.de,https://nitter.twei.space,https://nitter.inpt.fr,https://nitter.d420.de,https://nitter.caioalonso.com,https://nitter.at,https://nitter.pw,https://nitter.nicfab.eu,https://bird.habedieeh.re,https://nitter.hostux.net,https://nitter.platypush.tech,https://nitter.pufe.org,https://nitter.us.projectsegfau.lt,https://nitter.arcticfoxes.net,https://t.com.sb,https://nitter.kling.gg,https://nitter.ktachibana.party,https://nitter.riverside.rocks,https://ntr.odyssey346.dev,https://nitter.freedit.eu,https://nitter.librenode.org,https://n.opnxng.com,https://nitter.plus.st,https://nitter.tux.pizza,https://t.floss.media,https://twit.hell.rodeo,https://nitter.edist.ro,https://nitter.nachtalb.io,https://n.quadtr.ee,https://jote.lile.cl,https://nitter.one"]
