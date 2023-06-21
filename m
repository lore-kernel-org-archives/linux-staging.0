Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC712595
	for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 19:03:10 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5195c85fbb2so7765682a12.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 12:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687374189; x=1689966189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2qJpK3KoDKaGdMPnFBYoOsKrBkC97FAcba3H7MKp0D0=;
        b=nh5zxwadRpoXTQ3BUgU/1BLF6SQhW3sLu/FN0MPW28V6gNaXWgcdK9UVdz0HOC+gPc
         4S5UiiNr7ZAvadn4n7T1ZS5zKHmkKpwJxk22rtwOlcjoups6t2HLOvPnhWnoHX8JLr39
         E8weSpizuP2wRFAhj4DV9xzwN1V8M6lmGWEL0qRE+9Z/FuqeUhwNE1dmiE4o/FJUeeuc
         Pdp9KyY0ekOl4O57j/VZmXeGNCkmRYg8HZr17rzARcWLbg0bMg/aEAK/p0gKdyHsK/kH
         Xmhdbh8wRqYFVkttif54yoWDlDFKcZM0dNugSMrJV31P7SUZqT2ELH9RNLO9iUAB3R78
         2Yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687374189; x=1689966189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qJpK3KoDKaGdMPnFBYoOsKrBkC97FAcba3H7MKp0D0=;
        b=dokDOK5NYuUjp8+G6T5rQfUILgeZP7GkT0TA7h/jaeFM6Gi+JJhMUQGUMeX9Ob6BoA
         xGySwK1SF814uKbrkiSQ3Kp9jH30HIT8o8As7HfaqYti8qtqHmgGwX9sqXJ0rvzGsc4c
         8IMtl7y1S4SsVWoG/LkX49HdsnjPcKQlFb/0kic6FfDfpC1Lwb53ikwyIL8uR9pbVn+m
         i7LauZtC8zDXCDJ2qxD3NDFKYIfn7bPlwaTHvBNGqFZt/iBP//vBjZLM6df4CaNiX+s9
         6FJSY15B0V0vqEw7slBQNGDnrLrY3kPFdmqZulFnrOz34SyFgVPnb7mb6hEmM1x8zLf5
         FePg==
X-Gm-Message-State: AC+VfDzlYMEd9XTpyPMA/T9J+gNhMPD3y2E8rL7zPUbUela4Q2myYzWx
	9qsoAgxg68qimfIpWOvqXGcaMczKADSE7U6EKGY=
X-Google-Smtp-Source: ACHHUZ7SypqJEY5XWqBQ5BLPLUT82ZBr/MF6PmEhc6Gkt+Akzrao0BrYO+qjY7IUaWCiWD14akrvvIqkCPpk3J1W6Wc=
X-Received: by 2002:a17:907:783:b0:982:79fa:4532 with SMTP id
 xd3-20020a170907078300b0098279fa4532mr14816708ejb.53.1687374188952; Wed, 21
 Jun 2023 12:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230619175703.18826-1-franziska.naepelt@gmail.com>
 <20230619180753.18998-1-franziska.naepelt@gmail.com> <2023062012-regain-vintage-2c6d@gregkh>
In-Reply-To: <2023062012-regain-vintage-2c6d@gregkh>
From: =?UTF-8?Q?Franziska_N=C3=A4pelt?= <franziska.naepelt@googlemail.com>
Date: Wed, 21 Jun 2023 21:02:56 +0200
Message-ID: <CAAUT3iN6r2KHxMO=mF0AjV_7eGvm8ecq3tahvB_yDB+0HQ1Xpg@mail.gmail.com>
Subject: Re: [PATCH 2/5] staging: rtl8723bs: Fix space issues
To: Greg KH <gregkh@linuxfoundation.org>
Cc: eperi1024@gmail.com, hdegoede@redhat.com, johannes.berg@intel.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	quic_vjakkam@quicinc.com, tegongkang@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Am Di., 20. Juni 2023 um 16:12 Uhr schrieb Greg KH <gregkh@linuxfoundation.org>:
>
> On Mon, Jun 19, 2023 at 08:07:53PM +0200, Franziska Naepelt wrote:
> > Fix the following checkpatch space issues:
> > - CHECK: spaces preferred around that '*' (ctx:VxV)
> > - CHECK: spaces preferred around that '+' (ctx:VxV)
> > - CHECK: spaces preferred around that '-' (ctx:VxV)
> > - CHECK: spaces preferred around that '|' (ctx:VxV)
> > - CHECK: No space is necessary after a cast
> > - WARNING: please, no spaces at the start of a line
> >
> > Signed-off-by: Franziska Naepelt <franziska.naepelt@gmail.com>
> > ---
> >  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 77 +++++++++----------
> >  1 file changed, 38 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > index 1afd1a93bcee..abda4e0f0bf5 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > @@ -95,14 +95,14 @@ static struct ieee80211_channel rtw_2ghz_channels[] = {
> >  static void rtw_2g_channels_init(struct ieee80211_channel *channels)
> >  {
> >       memcpy((void *)channels, (void *)rtw_2ghz_channels,
> > -             sizeof(struct ieee80211_channel)*RTW_2G_CHANNELS_NUM
> > +             sizeof(struct ieee80211_channel) * RTW_2G_CHANNELS_NUM
> >       );
> >  }
> >
> >  static void rtw_2g_rates_init(struct ieee80211_rate *rates)
> >  {
> >       memcpy(rates, rtw_g_rates,
> > -             sizeof(struct ieee80211_rate)*RTW_G_RATES_NUM
> > +             sizeof(struct ieee80211_rate) * RTW_G_RATES_NUM
> >       );
> >  }
> >
> > @@ -126,8 +126,8 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
> >       if (!spt_band)
> >               goto exit;
> >
> > -     spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band)+sizeof(struct ieee80211_supported_band));
> > -     spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels)+sizeof(struct ieee80211_channel)*n_channels);
> > +     spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) + sizeof(struct ieee80211_supported_band));
> > +     spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + sizeof(struct ieee80211_channel) * n_channels);
> >       spt_band->band = band;
> >       spt_band->n_channels = n_channels;
> >       spt_band->n_bitrates = n_bitrates;
> > @@ -247,10 +247,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
> >               u32 wpsielen = 0;
> >               u8 *wpsie = NULL;
> >
> > -             wpsie = rtw_get_wps_ie(pnetwork->network.ies+_FIXED_IE_LENGTH_, pnetwork->network.ie_length-_FIXED_IE_LENGTH_, NULL, &wpsielen);
> > +             wpsie = rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wpsielen);
> >
> >               if (wpsie && wpsielen > 0)
> > -                     psr = rtw_get_wps_attr_content(wpsie,  wpsielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
> > +                     psr = rtw_get_wps_attr_content(wpsie, wpsielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
> >
> >               if (sr != 0) {
> >                       /* it means under processing WPS */
> > @@ -266,7 +266,6 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
> >       }
> >       /* spin_unlock_bh(&pwdev_priv->scan_req_lock); */
> >
> > -
>
> This was an extra blank line issue that you did not mention in the
> changelog :(
>
> Please be more careful.
>
> thanks,
>
> greg k-h

Thanks for the heads up, it's fixed in v2.
https://lore.kernel.org/linux-staging/20230621184635.25064-1-franziska.naepelt@gmail.com/

---
Franziska
