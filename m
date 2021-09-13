Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4518F3FD0
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 23:43:13 +0000 (UTC)
Date: Mon, 13 Sep 2021 23:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail; t=1631576581;
	bh=XX4N+dD43FqDtNWZ+Y9OiIIuX7aACcGRhQqGpdYZRRc=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=pKrFLwsYETPNjpMkp9fOZL305a/OS+qI/FiSdeQMtNHU8iDCp+Hs5V7NIK0kV+YDF
	 0wc++Tds/I61l1DzkdXPzLNXgXARvT+43GE1QvlrEYGWkFr/vP8waaGMAAifuEFUU+
	 jWhRVHJ7riT1ka+lj3at18KaOWp2fYxSTjIm+/vpWHots9b3zN8HEomwaB6zg64TZl
	 BNXm+zRuziaIFzsBxUeP947KQIkZhxfA6XMJQs4oPQJ6OtiN/AtB25uhmUpFkF7owO
	 OTSkONFRlii0Vf9/4NJBiCYVfyPqNcwJwivWpVk9nsEmYx35xMTfk2yYgYnGQlQlYu
	 XNaRxlK+AtGrQ==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: Re: [PATCH] staging: rtl8723bs: define wowlan_stub only when CONFIG_PM is enabled
Message-ID: <20210913234247.ptqjjbilrtkzc4id@h510>
In-Reply-To: <YT97lJVU8cx3wxwN@kroah.com>
References: <20210913140937.1490133-1-hello@bryanbrattlof.com> <YT97lJVU8cx3wxwN@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

On this day, September 13, 2021, thus sayeth Greg Kroah-Hartman:
> On Mon, Sep 13, 2021 at 02:10:12PM +0000, Bryan Brattlof wrote:
> > The wake-on-lan stub is needed only when the device power management
> > functionality is enabled in the kernel. Conditionally define
> > wowlan_stub to avoid potential unused object warnings.
> >
> > Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
> > ---
> >  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/driver=
s/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > index 34da8a569709..f4a9b4b7c97e 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > @@ -47,6 +47,7 @@ static const u32 rtw_cipher_suites[] =3D {
> >   * Moreover wowlan has to be enabled via a the nl80211_set_wowlan call=
back.
> >   * (from user space, e.g. iw phy0 wowlan enable)
> >   */
> > +#if defined(CONFIG_PM)
> >  static const struct wiphy_wowlan_support wowlan_stub =3D {
> >  =09.flags =3D WIPHY_WOWLAN_ANY,
> >  =09.n_patterns =3D 0,
> > @@ -54,6 +55,7 @@ static const struct wiphy_wowlan_support wowlan_stub =
=3D {
> >  =09.pattern_min_len =3D 0,
> >  =09.max_pkt_offset =3D 0,
> >  };
> > +#endif
> >
> >  static struct ieee80211_rate rtw_rates[] =3D {
> >  =09RATETAB_ENT(10,  0x1,   0),
> > --
> > 2.30.2
> >
> >
>
> Do you get a build warning with the code as-is?
>
> Having #if in .c files is generally a bad idea, are you sure there is no
> other way to solve this?
>

Hi Greg,

Turns out I should have played with the CONFIG_PM setting more before I
sent you this patch. All of this can be ripped out.  :)

This is the warning I get with staging-next being where it is now:

  CC [M]  drivers/staging/rtl8723bs/os_dep/xmit_linux.o
drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:50:42: warning: =E2=80=
=98wowlan_stub=E2=80=99 defined but not used [-Wunused-const-variable=3D]
   50 | static const struct wiphy_wowlan_support wowlan_stub =3D {
      |                                          ^~~~~~~~~~~

I'm using tinyconfig plus the rtl8723bs driver and it's dependencies to
build a microscopic buildroot image for an Intel Compute Stick I managed
to get my hands on recently.

I assumed disabling the power management parts of the kernel produced it
and didn't think twice. :/

I'll be back with a v2 that rips all of this out.

Thanks again Greg,
~Bryan

