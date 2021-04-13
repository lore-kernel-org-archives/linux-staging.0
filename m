Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AFC71
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 13:12:05 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id ba6so19341477edb.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JgdFlcjKU9PU1av9/ApHGEGIWSg0KENF/Em1dnUWYKA=;
        b=OJLF5WhrD/4VIOG76yBUebbn3H0fOwnYI0rMe8tkdMX28ZiUwh7j6/242zpXDxxbWi
         HNR378B3E0FEEBK320AujAfmXL+NxAQWBHfD+wYOl4y1hXQP2KQN6Vb4s1wsIEB6W0sC
         H3uQ/OvY9PuOEYVX6WnACc6RuO8pkgpWaJ4g/hFAMVIoazf5tzlrohf+jh660et0q0BH
         TaIpLxUHPJJoratG/3CzPBHSc7yqBLaCkcE+icUwbLg/Q/8C2OjbZ5cLq1L+fxk+Ha5m
         lfiJNZnK8LTQ+E1gCMmhEUobEZmeNW/sKZrxqs+jZ983J2SkimAbl+H040slCR0b2Miq
         eTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JgdFlcjKU9PU1av9/ApHGEGIWSg0KENF/Em1dnUWYKA=;
        b=Z6mmyLMQiAkW91klCdSBYMq3t/VlRf512nF+lqDH6NNzsE4QKn/5XQh5kp9D/hWjx+
         VwBoGFKIzwEEw0d/0xRNczHvNIQ4GIC13/gKA9fvAjhBM6ZPKgrvT7k1dLAC54HsaB3g
         K1UwUxneHrREoTGXMVyT4/jyqHM2VYHQ7W24SZwVrcwrG2d3qnL2cyPy1uLIZiJGJ/so
         VpSUX8kD41d7hFBuHSSDObbIIV3LQxH4ooiQk2g3SJQaN29VdDqCqyz1LZrfu2qsy8ok
         Xgbi9H7P54jFKeEW9mHZcxCFIOyXDpFVCoSV4ANpHOk2fH7bcji8ChKMPjO6hq8aqsR5
         mqPg==
X-Gm-Message-State: AOAM5300TSkpp+FvyzrThgbFxS97b3jn2i9tcjTJX2UDHqFWt1NAu05E
	cUVlrebgFyjmlFHlMWp1TlpuSNS9dc+N9Ua3
X-Google-Smtp-Source: ABdhPJyH+SpOOo0GQ1Svz6FgNJziJxDyrEqAFB2235ohGId9mNVMErtOJZdxkG0DfDCAhJ/PuPTZdw==
X-Received: by 2002:a05:6402:30ae:: with SMTP id df14mr34370981edb.97.1618319524139;
        Tue, 13 Apr 2021 06:12:04 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id hs26sm3655477ejc.23.2021.04.13.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 06:12:03 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8192u: ieee80211: Replaced strncpy() with strscpy()
Date: Tue, 13 Apr 2021 15:12:02 +0200
Message-ID: <4666289.4L6Ep8XSK1@linux.local>
In-Reply-To: <YHWVsahY4nfo9xF/@kroah.com>
References: <20210413123041.24260-1-fmdefrancesco@gmail.com> <YHWVsahY4nfo9xF/@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, April 13, 2021 2:59:29 PM CEST Greg Kroah-Hartman wrote:
> On Tue, Apr 13, 2021 at 02:30:41PM +0200, Fabio M. De Francesco wrote:
> > Replaced strncpy() with strscpy() because of compilation time warnings
> > about possible truncation of output [-Wstringop-truncation].
>=20
> build warnings?  What build warnings?
>
drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c:1388:5: warning:=20
=E2=80=98strncpy=E2=80=99 output may be truncated copying 32 bytes from a s=
tring of length=20
32 [-Wstringop-truncation]
 1388 |     strncpy(tmp_ssid, ieee->current_network.ssid,=20
IW_ESSID_MAX_SIZE);
>=20
> > Furthermore, according to the Linux official documentation, strscpy()
> > is
> > preferred to strncpy.
> >=20
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >=20
> >  drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> > b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c index
> > 25ea8e1b6b65..aa58eedf5e86 100644
> > --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> > +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> > @@ -1385,12 +1385,12 @@ inline void ieee80211_softmac_new_net(struct
> > ieee80211_device *ieee, struct ieee>=20
> >  			 * essid provided by the user.
> >  			 */
> >  		=09
> >  			if (!ssidbroad) {
> >=20
> > -				strncpy(tmp_ssid, ieee-
>current_network.ssid, IW_ESSID_MAX_SIZE);
> > +				strscpy(tmp_ssid, ieee-
>current_network.ssid, IW_ESSID_MAX_SIZE);
>=20
> Are you sure you can just replace this like this?
>
I surely was... but now I'm not anymore, since your review :)

Maybe you mean I have to check possible return of -E2BIG?
Did you mean something else?
May you please elaborate further?

Thanks,

=46abio
>=20
> >  				tmp_ssid_len =3D ieee-
>current_network.ssid_len;
> >  		=09
> >  			}
> >  			memcpy(&ieee->current_network, net,=20
sizeof(struct
> >  			ieee80211_network));
> >=20
> > -			strncpy(ieee->current_network.ssid,=20
tmp_ssid, IW_ESSID_MAX_SIZE);
> > +			strscpy(ieee->current_network.ssid,=20
tmp_ssid, IW_ESSID_MAX_SIZE);
>=20
> Same here, are you sure?
>=20
> thanks,
>=20
> greg k-h




