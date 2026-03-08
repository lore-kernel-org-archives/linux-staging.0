Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9966E33D4E8
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 23:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013428; cv=pass; b=XqQNb2zijbTC5uYGaBrI+H8Xzqj4G3we/0Nm6F6ppSLqvHsEAgr8bN4kmq1ldIxJHIBeLgmZmGeLZthkK2pQx25THUWfpNBBaIpBm9ZdlX8zZMKzsvSgN8f6fABrDsS95upj/lQwghK8I0ZN9q5OXXTjyyTPpQEFeq2MZVB29xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013428; c=relaxed/simple;
	bh=mO9egZPc39bIeivAm6ugtFpUZ4b3UPOruuWcUpwUVsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJ+9mraa0LiRjltwilTyrT6KKJdk9kraLrPvowROIjilCtgQOnoiHPwWK+OQjjR7Ng0esznhuNzWrZdp6uVrIu0og8nmc4rTaroEKxC5wSSg1TYI3ufvojnlZZuYHkR8gKRUXKRRg3HiESlJJQ+4a7XbAuTNMpT2mjVuFhTsCzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3YiLSRP; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3YiLSRP"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-40429b1d8baso2433035fac.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 16:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773013424; cv=none;
        d=google.com; s=arc-20240605;
        b=WajKjcAptypdzJ2Zk48jtP+JkqFM+vXY5BO8Lxc4VAyTB5O+LoWFrE6tpsVeeA8MeD
         bfdDtGXuKREYNVXj5jGOgC847+KERoIaAVl9c9QzfXZOamjP1euMvcf/kC1623PWHkLg
         DTes9gwUu/Hd0Qj1yUXU0AF35PJgNGA42k1Mh/J4fIQreez3T7bKKxDrOqaLKOEn/7i7
         92Ld5BbVmlX/76Tl9n8ZBrYu3jgZBOOJiWoYXe/fw6lYjmddPhOsto7JYM9w3UFaQ5BS
         kaJBmEC+pdZqwxZ84kyZcOLGlBTQ6cx1kJoRp5vxVONjajwWpdCqi7rc112AGBk+4xcU
         80Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wAUWhB4TVkbfeP6po54EnVam8EjOU5e/pgEIJtiarYk=;
        fh=EQg+zEciH48cQnRUFsxnKCG+tA+X06KSJD7R62W0lts=;
        b=PYYByQTJtbjWusJ1ffnVGsvsCRqjYTvMFhvDdGR1gHXZM4p4oF0kgDjyhkv3p3W+vL
         hLcftp/dRCREeSSyonCZCqwU3iRAvutKYaStRFIt99d26osquEIwPIwLixyxI/Grnd78
         TU/6NKyEfoKz0WB3Sj9N7WiPFQ19Pt5xYPjtitxCsMoQZ3Vw5QVRaFFiOxKYYzuduc4O
         WWfHfsNu+eSfJnmA+Vg0ZDANI3P6G2xGynUb62S6PJ6rCgTMJB66L8x+lYH2l+/ELy8v
         peIhKyOsJ6CLGYQr1BkcYqUQK0gYHJp17meVf3DNqN90/4Rb8v+aRK8cMp6oKL8rfjtx
         o0vQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773013424; x=1773618224; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAUWhB4TVkbfeP6po54EnVam8EjOU5e/pgEIJtiarYk=;
        b=X3YiLSRPARtZFaJj8/7ZhBxGZ9AIIWQQfaPl7sO04BFnfXRIgKJFsHi2CWerefhzfG
         GGKRw8eLno4JlLPXhYhjdLqq77+l9x+zx7IWRT+sBiLBtibygnQ4aC/69fqBqgVEX9NC
         EH1FQWvfH8iJKDPCV+wJrMTlBi2cLU9UkuC4Et8dheEGOvAZds2hVjRBPgfcVn89Rb4m
         bIqghQz03NB15kpKMx9VceejiXcicA4U9s+Gk1tzWhp4FgSXApPQxOV1NnJKKuuDmhly
         mDf/YilM9r+E9qyeI96AzFBoY0dK/qjiuOuZ52nUjP4mdlDZmxDmQebdkjelsu4SKkpN
         gwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773013424; x=1773618224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAUWhB4TVkbfeP6po54EnVam8EjOU5e/pgEIJtiarYk=;
        b=vQDHpha4mwCTVmSp9iPrLPNWXnwUnoNShlfuDLUm/PmL/SOkiwwyl3Hpa4vREjOgzY
         lCyV2cpAXS4GLvPaaeVZY2ZmFSKQJaa4UoTfAX4afNVx3dtQfCipZNkvLUdFKpFWauS6
         8b1PnZwciodcSmmQzV/PSv0T47dNRYa8Cobb9rB4MqJDg+ZLHqT3YeGN8AY1h+TdhzbW
         axpjq85U8l1DiZgZKB6hoFxFVbcewYahtxTCmml2fAr0e9wgBkjalbDzYOouF+bZ70eT
         1fRVHfanpsIEXlgpkQlDnPPP3LCkvtwENX460exI6T5wdogaj1ypXhI/AWiCuQ9mJqOH
         r3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUS4qu19dkKjIVTaIy7VNiv9A2mY0/rpxQqHBmx4N7kegg31F2fh3ay1kWEHRypwyTzGqENNIh0S7cusFKU@lists.linux.dev
X-Gm-Message-State: AOJu0YyEsDRrjM7NG0epb7Q8lfvlEl1V4PYCTlkUqKs/d5Ljd+NyKT3G
	y3RojY9Y/hld6+NERaU1uMUmC/HPUzqlC7DXss1vui1AZoYke4GT9drQ2xoUtxU6D/EdTeEIgXf
	OZIXkxjPnka/ymV4v7Oqyyvr1krEbP60=
X-Gm-Gg: ATEYQzxFzu1vV04bz4kV5BU2EWUOtgyrJ0uF74BcSThvTDR1XsVGb6nkBWp1iU22CAp
	4jcGptV2Cq6Uyq3ddNeahrhqddnQG1xz5fn+8oIubUgCl5JF1SKNrDbPFdhtuHJEzzORk+BNxuJ
	k6qGbTRUA2EgGnhFVaSflDjkK5QfAYdLLFwrhicd2UGZCVCr7C0X3SPZs0JnqH7534BVuE6BbXi
	DzqZTRecWy+pYUQiVkTWSzbcirjla/A48e7D/tDHSdaiJHNAWPP7Tm7nsLvDUpThtrGA87ObcnE
	SaKUv1eff4880dYIw4PntTTX96PM8fdYtevBOb2FQA==
X-Received: by 2002:a05:6808:14cf:b0:463:ab56:9ec4 with SMTP id
 5614622812f47-466dca06157mr4779336b6e.17.1773013424425; Sun, 08 Mar 2026
 16:43:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260305210347.120446-1-rougueprince47@gmail.com> <aayTAmJ4x5_965Gg@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <aayTAmJ4x5_965Gg@debian-BULLSEYE-live-builder-AMD64>
From: Bhargav Joshi <rougueprince47@gmail.com>
Date: Mon, 9 Mar 2026 05:14:13 +0530
X-Gm-Features: AaiRm50DXReo14CJ8lZtmdJxFXv9aM9_tT8zvdh3c4rp65IDJ3v8pKMuPA_7Xpk
Message-ID: <CAPC4XCR73qKypR0p7iKfuxgujRJTsUwsMbShvfoLZXjDH6BAuw@mail.gmail.com>
Subject: Re: [RFC PATCH] staging: iio: ad9832: modernize ABI and remove dds.h dependency
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, tomasborquez13@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Marcelo,

Thank you for the review and feedback.

On Sun, Mar 8, 2026 at 2:34=E2=80=AFAM Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> Hello Bhargav,
>
> On 03/06, Bhargav Joshi wrote:
> > The AD9832 driver currently relies on legacy custom IIO macros defined
> > in dds.h. This triggers checkpatch.pl warnings (NON_OCTAL_PERMISSIONS)
> > and, more importantly, exposes a non-standard sysfs ABI (e.g.,
> > frequency0, frequency1, phase0-3) directly to user space.
> >
> > This patch removes the custom macros and migrates the driver to standar=
d
> > IIO API mechanisms:
> > - Standard attributes (frequency, phase) now use info_mask_separate.
> > - Non standard specific toggles (frequencysymbol, phasesymbol,
> >   pincontrol) have been migrated to an ext_info array.
> > - Remove dds.h header dependency.
> > - Pointless frequency_scale and phase_scale attributes are dropped as
> >   suggested by Jonathan in
> >   https://lore.kernel.org/linux-iio/20251231180939.422e9e62@jic23-huawe=
i/
> >
> > NOTE: This patch introduces an intentional ABI changes. The non-standar=
d
> > attributes (out_altvoltage0_frequency0, etc.) have been removed. They
> > are replaced by standard attributes (out_altvoltage0_frequency and
> > out_altvoltage0_phase). Routing to correct register while writing is
> > handled by checking currently active frequencysymbol or phasesymbol.
> >
> > Testing: This patch has been strictly compile-tested. I do not have
> > access to physical AD9832 hardware. I am submitting this as an RFC to
> > see if these changes are acceptable, and to ask if someone with physica=
l
> > hardware could test thisg and provide a Tested-by tag.
> >
> > Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
> > ---
> > This patch is heavily inspired from discussions in following
> > thread.
> > https://lore.kernel.org/linux-iio/20251215190806.11003-1-tomasborquez13=
@gmail.com/
>
> Thanks for making that clear. Still, a change log highlighting the main
> differences between yours and Tomas' patches would have been appreciated.

Understood. I will include a detailed changelog in the cover letter for v2,

>
> By the way, I'm assuming Tomas is fine with you caring on the driver upda=
te?
>

Tomas's thread went stale, so I picked it up. Tomas please let me know if
you are still working on this or fine with me picking this up.

> More comments inline.
> >
> > Since this is an RFC please let me know if these changes are acceptable=
.
> >
> >  drivers/staging/iio/frequency/ad9832.c | 135 +++++++++++++++----------
> >  1 file changed, 80 insertions(+), 55 deletions(-)
> >
> > diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/i=
io/frequency/ad9832.c
> > index b87ea1781b27..066a1b9ee8d5 100644
> > --- a/drivers/staging/iio/frequency/ad9832.c
> > +++ b/drivers/staging/iio/frequency/ad9832.c
> ...
> > -/*
> > - * see dds.h for further information
> > - */
> > +#define AD9832_EXT_INFO(_name, _ident) { \
> > +     .name =3D _name, \
> > +     .write =3D ad9832_write_ext_info, \
> Why no .read procedure? I think at least for the
> out_enable/out_altcurrent0_enable attribute we would want a read function=
.
>

Yeah, I will add it in a separate patch in v2.

> > +     .private =3D _ident, \
> > +     .shared =3D IIO_SEPARATE, \
> > +}
> >
> > -static IIO_DEV_ATTR_FREQ(0, 0, 0200, NULL, ad9832_write, AD9832_FREQ0H=
M);
> > -static IIO_DEV_ATTR_FREQ(0, 1, 0200, NULL, ad9832_write, AD9832_FREQ1H=
M);
> > -static IIO_DEV_ATTR_FREQSYMBOL(0, 0200, NULL, ad9832_write, AD9832_FRE=
Q_SYM);
> > -static IIO_CONST_ATTR_FREQ_SCALE(0, "1"); /* 1Hz */
> > -
> > -static IIO_DEV_ATTR_PHASE(0, 0, 0200, NULL, ad9832_write, AD9832_PHASE=
0H);
> > -static IIO_DEV_ATTR_PHASE(0, 1, 0200, NULL, ad9832_write, AD9832_PHASE=
1H);
> > -static IIO_DEV_ATTR_PHASE(0, 2, 0200, NULL, ad9832_write, AD9832_PHASE=
2H);
> > -static IIO_DEV_ATTR_PHASE(0, 3, 0200, NULL, ad9832_write, AD9832_PHASE=
3H);
> > -static IIO_DEV_ATTR_PHASESYMBOL(0, 0200, NULL,
> > -                             ad9832_write, AD9832_PHASE_SYM);
> > -static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"); /* 2PI/2^12 rad*=
/
> > -
> > -static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
> > -                             ad9832_write, AD9832_PINCTRL_EN);
> > -static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL,
> > -                             ad9832_write, AD9832_OUTPUT_EN);
> > -
> > -static struct attribute *ad9832_attributes[] =3D {
> > -     &iio_dev_attr_out_altvoltage0_frequency0.dev_attr.attr,
> > -     &iio_dev_attr_out_altvoltage0_frequency1.dev_attr.attr,
> > -     &iio_const_attr_out_altvoltage0_frequency_scale.dev_attr.attr,
> > -     &iio_dev_attr_out_altvoltage0_phase0.dev_attr.attr,
> > -     &iio_dev_attr_out_altvoltage0_phase1.dev_attr.attr,
> > -     &iio_dev_attr_out_altvoltage0_phase2.dev_attr.attr,
> > -     &iio_dev_attr_out_altvoltage0_phase3.dev_attr.attr,
> I'd try to split this patch into smaller ones.
> One for updating the frequency and phase channels.
>

got it we will split these up in v2.

> > -     &iio_const_attr_out_altvoltage0_phase_scale.dev_attr.attr,
> One patch for dropping the _scale attributes.
>
> > -     &iio_dev_attr_out_altvoltage0_pincontrol_en.dev_attr.attr,
> > -     &iio_dev_attr_out_altvoltage0_frequencysymbol.dev_attr.attr,
> > -     &iio_dev_attr_out_altvoltage0_phasesymbol.dev_attr.attr,
> > -     &iio_dev_attr_out_altvoltage0_out_enable.dev_attr.attr,
> > -     NULL,
> > +static const struct iio_chan_spec_ext_info ad9832_ext_info[] =3D {
> > +     AD9832_EXT_INFO("pincontrol_en", AD9832_PINCTRL_EN),
> Why did you drop the comment about making pincontrol_en a DT property?
> Nevertheless, pincontrol_en is another piece I'd put in a separate patch.
>

Actually I didn't copy any of the code from Tomas's patches so I missed thi=
s.
I will add this as well in v2.

> > +     AD9832_EXT_INFO("frequencysymbol", AD9832_FREQ_SYM),
> > +     AD9832_EXT_INFO("phasesymbol", AD9832_PHASE_SYM),
> Maybe I'm missing something but this doesn't seem to follow the suggested=
 ABI.
> https://lore.kernel.org/linux-iio/20251221194358.3284acb4@jic23-huawei/
> Why did you chose this particular naming for the ABI?
>

 I will review that and update the attribute names in v2 to strictly
follow the suggested ABI

> > +     AD9832_EXT_INFO("out_enable", AD9832_OUTPUT_EN),
> I think it is okay to change the enable from device attribute to channel
> attribute in this case since it's staging and this device has only one ch=
annel.
> Though, I believe we should call it out_altcurrent0_enable, as proposed o=
n
> Tomas' set. I'd also set this on a separate patch.
>

I will drop this from ext_info entirely and instead use
BIT(IIO_CHAN_INFO_ENABLE).

> > +     { }
> >  };
> >
> > -static const struct attribute_group ad9832_attribute_group =3D {
> > -     .attrs =3D ad9832_attributes,
> > +static const struct iio_chan_spec ad9832_channels[] =3D {
> > +     {
> > +             .type =3D IIO_ALTVOLTAGE,
> Maybe I've missed something. Didn't the previous review reached the concl=
usion
> that the channels should be IIO_ALTCURRENT? The datasheet it documents IO=
UT as
> current output.
>

Apologies I missed this from that thread. I will correct this to
IIO_ALTCURRENT in v2.

> > +             .indexed =3D 1,
> > +             .channel =3D 0,
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_FREQUENCY) |
> > +                                   BIT(IIO_CHAN_INFO_PHASE),
> > +             .ext_info =3D ad9832_ext_info,
> > +     },
> >  };
> >
> >  static const struct iio_info ad9832_info =3D {
> > -     .attrs =3D &ad9832_attribute_group,
> > +     .write_raw =3D ad9832_write_raw,
> No .read_raw ?

I will implement .read_raw in a separate patch in v2.

>
> >  };

Thanks again!

Best regards,
Bhargav
