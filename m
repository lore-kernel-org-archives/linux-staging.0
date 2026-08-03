Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED78840099A
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 12:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758977; cv=pass; b=MBAOr+Srxe9adqI1eW9kPxYaxDhY9uPQxvb4gd1gjskvPGxuSmK7SQeLAZj0UD6mihS8MUS8gSm33zDXEWSIzl2GJ0USw2IA4aH6zW19ngU5kSnW/lNvlAlBfRK/VO7egvB1dFPF3+loeZclW8GbHPxtw9MaU/FYHVftFWao4Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758977; c=relaxed/simple;
	bh=GBh7xuyHZSYcri5erZ0fuibf+63TnyENMGP92EyT63g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7N2kW/jSfrkYHHxfJp6wLXSxZ8bjmNRyXVyw+PaPEAqA3HRe6Hg9+ZSn3y9aV3DzEFgptpsSfUiuxvI7XMIeApdIUFM3YkxOEXa99ttRhYwQUBON/JDTYd0/7LbMlb3WZMXkBKVAwqzb8C29myF/356fg4GzXM5REj57p50sWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJQh7r9u; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJQh7r9u"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-44856d185bcso3876122fac.3
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 05:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785758969; cv=none;
        d=google.com; s=arc-20260327;
        b=ZDIGauUFSmt6KZwhnDZ9P3GMqQCPsYyjUE541Ft2iTUsExKKcXh5lyIxPcGpLlEoTD
         JUKwNkHRnuJccqIO/zS2gaD8fCqflDCqzrhCOmwdke0Ty3ReM4C/eGPdEo96QTbHkMD9
         QQUTCB4/ct8CCQ0BTaQ63HJU+/diF/cx1fQrQgzA5tiYvrlPDmFizE/qsQ7DqWeIyiww
         QMQchrceB6Sy60j/LGeHDv0OjNfTeS7bUtzwiIlKuY+ikQWcI3KgAeUB/dJZjBBJXwfP
         RSS/B5nQSRvowZ/4gtIJNandWf65XWK3CtKbwMIKBC9IfZtisf/8Do4qFTGZI4a97cEq
         sQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+eiDhEKEJzv/YlOG+Kaa8MtY0pGCEb7E3JQDfcJnSk=;
        fh=BCpCL1pjDzgyx5tF9KC6vwu5MOWIKIr2pIZm2rV3VwU=;
        b=QENkMd94H5JCWOtzgbzdKWCccNG8kDv398jHlPjld6RFK0QfFZLDkXjhnPrv4m41T6
         2cxDi/akoFnK19RvWPcLIfsNCeDmx/ofdLy7rxi6MUocMJhXrkzssuZM2vdxQe5Yt9V/
         hb07wz7DBioClN6sOFuIs8x6k9eZCStUbA6lwfhGf6k0F2lLloqtoicCY2LwX99rT6zS
         LxJTBENRaKJ7p/YzC7iwrXE/G+T3Ns+HpW4T/7/iPI5ZhpYadiRPu7mIodmSRs/+VEYN
         SNYKR9roS1eVEfnnA8R6zWTodJLcm3nJ+mKtnduDybYB3RWMbRyue6b1ITlr5GskX/Oy
         F2Gw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785758969; x=1786363769; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+eiDhEKEJzv/YlOG+Kaa8MtY0pGCEb7E3JQDfcJnSk=;
        b=dJQh7r9ueq+nGfHZvVuBxk1zGgQmJozFEmaOrmEGHiqz15l0r7BbGcuwMNsnKvBnLL
         wtFxiK+m8oJiJ1uyYqtChok0/pKmsBBmSLM0KE8f256EujDKjkW/WW1tHGh+2DxAtnT6
         RV9bNHBxotBcK38X2zZ7FotFpbvyBk8TnmgoMNYwgtNqs8qhJTo1GWnbXP0WevjpheRE
         KhdzqU4VRHARLkpM7f9q3EqP4FmHy+DzdAvWuYIOAkRtaLQVcB+oOBoxygNTkRLVeDdp
         Du0PzkPOOsHHILrrd1jUs9xv7w9KPphoxtYxsT025vJFZ9UA8LC2iEi95b5bS2OKem4u
         bDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785758969; x=1786363769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+eiDhEKEJzv/YlOG+Kaa8MtY0pGCEb7E3JQDfcJnSk=;
        b=p8qUXXAZstjTeKWBq80VmmOU9CCsaCwXNCroZ+vgibGVSQWSNMd22IncZbffGMPotd
         o/Y0MOO8toDJU7wwcxc6Yf9WaLH4F3GfPp+ZTNjcMT+y2Sc599WmqQ19uIUoH0f2bLF5
         4FLbiMmDKJZ2PmMyrvKyl0g0J3zpvoUFMVksrpjWYIoob0tB8ZNRmyaD+GiP9uSnWHIp
         1lib736hZl5RhzwCw/rIH73stvZD8mHj+QnmrO1cLZbSvI/q5xW3FOU6MU8Wn3HEHcYT
         LJtvcqfCNbvLutSuGbOREs2nICzoxx2XJWXF0yOJmOE44ka/QD8df6MmgUu7E3NT3SdF
         WToA==
X-Forwarded-Encrypted: i=1; AHgh+RrHUBV3qZ1SWe36Q3UZCXlJ5wIXeB4XCixj3HNixbFWg5+4Fqz7HgmTLd7hmTw+qGp5j9Ir1aGxnLkMcd1t@lists.linux.dev
X-Gm-Message-State: AOJu0YzRK1UhRml6Zn7I4oETVSh5badP5wKdc9pMO8TFI3c83vjtKdMy
	CMdoOg/r0UspKP1TqBqWTaNIUnBCRTm/y4VG7EejRwuKsWjvwndZbGHn0rlDdL9H1VZ8KI0Hcv5
	6di1Xd8BDbb22YEtuOIorcC51UodXtkE=
X-Gm-Gg: AR+sD12bmUP04QtbThTLJgXp2DqVNewRcdgg0M27OUMPMe9fyaiWusE+wLp63zW/Atl
	qd7LbmI101G0fdBLll2B8ujjPx9jeE98RkAffy1UjggRdH39+KNDm1mOFwbCT+4j1gfsmlw95R7
	DrPl+hSLWxB8B9w1rd2ncYYusGG1WzlSMxz8596dAMfkayrG9SFN6l/tGZkmdonUsP7i/LFMP2l
	1mkDC+Xq8NEzjnRDdN+vP5A+cHbvAUbZ4ffDWzq/MEmy42AvoTlJVBEsNsUd4Im3Udq1JEzN1v+
	/JZYBWnmW2Q95du7FXueVcxrau9V1PP5mIY6Cv91EcM3UQ==
X-Received: by 2002:a05:6870:4686:b0:451:3852:25a9 with SMTP id
 586e51a60fabf-45905dd7fdfmr14512993fac.21.1785758964094; Mon, 03 Aug 2026
 05:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802113840.17730-1-abdelnasserhussein11@gmail.com>
 <0bde2343-8a70-44d4-9b27-8ce42c099309@baylibre.com> <20260802194738.034382ef@jic23-huawei>
In-Reply-To: <20260802194738.034382ef@jic23-huawei>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Mon, 3 Aug 2026 15:09:13 +0300
X-Gm-Features: AUfX_mxkDdPmJMT43CqX3qldlTS1ZnrEhcdMI7mWW1gOwzvpAJi2bPGzYHMtvfc
Message-ID: <CANpqX3bYkz0GT9H9i2LFfxW3VxoPRAxDv+LMzU3cOXVh_UP1cA@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: ad7816: avoid DMA from stack in spi_read
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, nuno.sa@analog.com, Michael.Hennerich@analog.com, 
	gregkh@linuxfoundation.org, andy@kernel.org, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

Thanks for the review and suggestions.

> Should also mention fixing the "wrong" sizeof() use in the spi_read() cal=
l.
> Probably deserves a Fixes: tag.
> In IIO, we have a special macro for this instead of `____cacheline_aligne=
d`.
> __aligned(IIO_DMA_MINALIGN);

I have applied all these changes. Following Jonathan's advice, I also
added a mutex to protect the SPI read sequence to prevent race
conditions.

I have split these changes into a two-patch v2 series and will send it
to the list shortly.

Best regards,
Abdelnasser

On Sun, Aug 2, 2026 at 9:47=E2=80=AFPM Jonathan Cameron <jic23@kernel.org> =
wrote:
>
> On Sun, 2 Aug 2026 10:31:29 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > On 8/2/26 6:38 AM, Abdelnasser Hussein wrote:
> > > The SPI core may use DMA for transfers. Using a stack-allocated
> > > buffer for DMA is unsafe and can trigger faults when VMAP_STACK is
> > > enabled, since the stack is not guaranteed to be DMA-accessible.
> > >
> > > Move the transfer buffer from the stack into the ad7816_chip_info
> > > structure so it has a stable lifetime suitable for DMA transfers.
> > > Mark the buffer with ____cacheline_aligned to ensure proper alignment
> > > for DMA operations.
> >
> > Should also mention fixing the "wrong" sizeof() use in the spi_read()
> > call. It was the correct size, but the wrong variable was referenced.
> >
> > >
> >
> > Probably deserves a Fixes: tag.
> >
> > > Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> > > ---
> > >  drivers/staging/iio/adc/ad7816.c | 8 +++-----
> > >  1 file changed, 3 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/a=
dc/ad7816.c
> > > index 0e32a2295990..fcaadebff0f4 100644
> > > --- a/drivers/staging/iio/adc/ad7816.c
> > > +++ b/drivers/staging/iio/adc/ad7816.c
> > > @@ -50,6 +50,7 @@ struct ad7816_chip_info {
> > >     u8  oti_data[AD7816_CS_MAX + 1];
> > >     u8  channel_id; /* 0 always be temperature */
> > >     u8  mode;
> > > +   __be16 rx_buf ____cacheline_aligned;
> >
> > In IIO, we have a special macro for this instead of `____cacheline_alig=
ned`.
>
> We've had a couple of these recently.  ____cacheline_aligned is simply
> wrong and I'm curious where that is coming from?  That's the performance
> hint cache line size, typically that of l1 and l2. In some systems other
> caches before the incoherent SPI controllers have larger cacheline sizes
> and we have to align to those.
>
> The correct option if not using the IIO one is __aligned(ARCH_DMA_MINALIG=
N)
>
> For historical reasons IIO has it's own version of that which predates
> all architectures providing ARCH_DMA_MINALIGN.
>
> >
> > __aligned(IIO_DMA_MINALIGN);
> >
> > >  };
> > >
> > >  enum ad7816_type {
> > > @@ -65,7 +66,6 @@ static int ad7816_spi_read(struct ad7816_chip_info =
*chip, u16 *data)
> > >  {
> > >     struct spi_device *spi_dev =3D chip->spi_dev;
> > >     int ret;
> > > -   __be16 buf;
> > >
> > >     gpiod_set_value(chip->rdwr_pin, 1);
> > >     gpiod_set_value(chip->rdwr_pin, 0);
> > > @@ -91,14 +91,12 @@ static int ad7816_spi_read(struct ad7816_chip_inf=
o *chip, u16 *data)
> > >
> > >     gpiod_set_value(chip->rdwr_pin, 0);
> > >     gpiod_set_value(chip->rdwr_pin, 1);
> > > -   ret =3D spi_read(spi_dev, &buf, sizeof(*data));
> > > +   ret =3D spi_read(spi_dev, &chip->rx_buf, sizeof(chip->rx_buf));
> > >     if (ret < 0) {
> > >             dev_err(&spi_dev->dev, "SPI data read error\n");
> > >             return ret;
> > >     }
> > > -
> > > -   *data =3D be16_to_cpu(buf);
> > > -
> > > +   *data =3D be16_to_cpu(chip->rx_buf);
> > >     return ret;
> > >  }
> > >
> >
> >
>
