Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20152206A9;
	Thu, 24 Apr 2025 22:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745533565; cv=none; b=UoA+jNjJVtrkPSc01oW3og6jJArZqavJ4HfT1zBg0wCRQYD+sE23n3ckFnm0iPM81jUgq4l+1kvv05sZKVDK2yiLImH7GodtRpCgDtwjfsdMdVwb8fYUutJNx+Kzh3/e5ZC8nkomn1kiBU0Qac/d7tk4rAvMdHrpeGo8ORFv9tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745533565; c=relaxed/simple;
	bh=x1JeXYDycyPhhRDzf9nOC3JYpKenBeAbMMf4ArIJVw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssPKGEdFT4wdwWF+T6I4gfnZBGODv54wMc0bDGqv3Y96IB9lPONkSIRvi3wZY2w5yUuJQIJZOJwiXMny/gQM1ZIjs5u8xVgJ8TZMBQUSS11lBsqZ5kN+0MY1iWfwFswbSrRJ25OEZqGwtB4shLFQpmQYrNYAhgt4wx0DNkke/bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eP9h7fso; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eP9h7fso"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47663aeff1bso15547991cf.0;
        Thu, 24 Apr 2025 15:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745533563; x=1746138363; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hskQ1ynJFkhkNXvLvezLv/sYveihSvby6bDVtKjx3Vg=;
        b=eP9h7fsoTTOfstDx/zJY4tzBcmB1eWioMLBlKdE2hgTsS1JbLS9M1YY5rLMjOoaue3
         DdfJwGibRmuuAnEMnQmBTk6qwMiACAzciKJaz9k0QtobxxoQGXWKuxt3/EK/+gOJl8bH
         QMB2jYIPj02GzIb1HNhVMmvaDFZY7k/dwkQ+2I41XXomcYgCtt8IwDD6jf5njVUf9Rqp
         /6b+PaDZGKCyJ/jX7pL89YW8IEKWW0Jd+efUfAm0FkUqGpGQkpFHcHMkULyUYATFgWvb
         GmGviKdJ0mGFUGStOuKhg0brq536ovQH5qu1Cw8q91Vsy9v8iELJVfbD+KF/uGRAkcm8
         qh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745533563; x=1746138363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hskQ1ynJFkhkNXvLvezLv/sYveihSvby6bDVtKjx3Vg=;
        b=lTa7s+C2hdMnYJHqOsxq06KWkLjjrjUpCvhFf6VMpCHzJyzESpcmsrI3TxiW/XqEBO
         D8EjBIKlqIg8/xCYJL8aX3aoXSAIVHdLwiao76gI/cIYykArvN8dRYDFru45OedrmQjU
         3q3f++jm+AG/z49busoxTwbS4F5YjXaQrxR676T8iZS1yFh4efjG8O17cM7lP6wJSfRG
         hWjKEZ5odGcFrSIYGu2iBFWZIEhE6AnFuCcpvCElZYKZJdzsWqQepaQMZ+H6IeKJ329V
         YefhjFlBf8RtbWOvzi11Ui+KK1sVu4jEFirAnwpyJnY7Fej1vK8hfEDCli4NeEb/j67w
         zeow==
X-Forwarded-Encrypted: i=1; AJvYcCU6Um/y0ihUbTPUyQx215ol2Kkb47pUMWX1kLHWMqCQEEUYTW2HuvUiWgPBI1q3sWp/uF1YipG1j5E6qdGx7RDxH+CjRA==@lists.linux.dev, AJvYcCXRaaMxcLs373lT9It1SEsY776kORlsPCgeJmEDgkkQIiA69CgGLbS6+F/SCBPQ6m1RiiHPI4Dx6iYxWPp1TQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiqG5Owlo8AZ+rq4ORhddnE/MJ3rSHcXh5hOA4RPfW6LGQobZ6
	8lgIgX3lblRq4sAA15kfsW7mTFW1LhLUIcB3FhdDHQLvo11qiRqubqifYtbIR8D+rMyMJUqU4RJ
	kPtwBOs9bL3LytVfkJdGITaovyGU=
X-Gm-Gg: ASbGncsqLxw72J3vqpujffPHkgak/haKwpa9yNRpzz4jxOfYl0qKIrVYDN+INb30YHn
	oLCzTNKfvLHHCgA3xUC4vDOKBCuypVQNMr0oiA8bn7T7i7g0vhckZUggyEXBY+eg3dw1Yz5IW8+
	oBMmjmCMxD5pNzAwvtDXgbz0pYB+wYbUQ0t5vaSZXTmOsgWmpfHHYIAg==
X-Google-Smtp-Source: AGHT+IFjSFl/xi4ItiZrw0T45ArRRtekfyoiPWNkdF1dxtevOLykqT+7muP77ZbSHM73ktdY/vnuknex42pfIFNB9Lg=
X-Received: by 2002:a05:622a:203:b0:477:64dd:575b with SMTP id
 d75a77b69052e-4801eada7b1mr1841381cf.45.1745533562732; Thu, 24 Apr 2025
 15:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420175419.889544-1-gshahrouzi@gmail.com> <20250420175419.889544-3-gshahrouzi@gmail.com>
 <20250421123728.1564039d@jic23-huawei>
In-Reply-To: <20250421123728.1564039d@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Thu, 24 Apr 2025 18:25:51 -0400
X-Gm-Features: ATxdqUFwcTzPdHn9XuiewQEmXMXyqrRqiIsLo1lnCsCOfLX_uZgjCo5No3ZV5uc
Message-ID: <CAKUZ0zKXg4KLpHPLtpkywPLp8+xxwAMSpNAgUmP34pfVZDv7Aw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] staging: iio: ad9832: Refactor powerdown control
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 7:37=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sun, 20 Apr 2025 13:54:18 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > Replace custom implementation with out_altvoltage_powerdown ABI. The
> > attribute's logic is inverted (1 now enables powerdown) to match the
> > standard. Modernize driver by using the standard IIO interface.
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> >  drivers/staging/iio/frequency/ad9832.c | 44 ++++++++++++++++++--------
> >  1 file changed, 30 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/i=
io/frequency/ad9832.c
> > index 0872ff4ec4896..a8fc20379efed 100644
> > --- a/drivers/staging/iio/frequency/ad9832.c
> > +++ b/drivers/staging/iio/frequency/ad9832.c
> > @@ -167,6 +167,34 @@ static int ad9832_write_phase(struct ad9832_state =
*st,
> >       return spi_sync(st->spi, &st->phase_msg);
> >  }
> >
> > +static ssize_t ad9832_write_powerdown(struct device *dev, struct devic=
e_attribute *attr,
> > +                                   const char *buf, size_t len)
> > +{
> > +     struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> > +     struct ad9832_state *st =3D iio_priv(indio_dev);
> > +     int ret;
> > +     unsigned long val;
> > +
> > +     ret =3D kstrtoul(buf, 10, &val);
> > +     if (ret)
> > +             goto error_ret;
> > +
> > +     mutex_lock(&st->lock);
>
> Look at how guard(mutex)(&st->lock);
> can be used in this driver to simplify things considerably.
Noted, added into new version.
> May make sense to do that before introducing this new code.
Not sure whether to have made it its own patch or not. I grouped it
together with the new code since it also uses locking.
>
> > +     if (val)
> > +             st->ctrl_src |=3D AD9832_SLEEP;
> > +     else
> > +             st->ctrl_src &=3D ~(AD9832_RESET | AD9832_SLEEP |
> > +                              AD9832_CLR);
> > +
> > +     st->data =3D cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
> > +                             st->ctrl_src);
> > +     ret =3D spi_sync(st->spi, &st->msg);
> > +     mutex_unlock(&st->lock);
> > +
> > +error_ret:
> > +     return ret ? ret : len;
> > +}
> > +
> >  static ssize_t ad9832_write(struct device *dev, struct device_attribut=
e *attr,
> >                           const char *buf, size_t len)
> >  {
> > @@ -227,17 +255,6 @@ static ssize_t ad9832_write(struct device *dev, st=
ruct device_attribute *attr,
> >                                       st->ctrl_fp);
> >               ret =3D spi_sync(st->spi, &st->msg);
> >               break;
> > -     case AD9832_OUTPUT_EN:
> > -             if (val)
> > -                     st->ctrl_src &=3D ~(AD9832_RESET | AD9832_SLEEP |
> > -                                     AD9832_CLR);
> > -             else
> > -                     st->ctrl_src |=3D AD9832_SLEEP;
> > -
> > -             st->data =3D cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_S=
HIFT) |
> > -                                     st->ctrl_src);
> > -             ret =3D spi_sync(st->spi, &st->msg);
> > -             break;
> >       default:
> >               ret =3D -ENODEV;
> >       }
> > @@ -266,8 +283,7 @@ static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"=
); /* 2PI/2^12 rad*/
> >
> >  static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
> >                               ad9832_write, AD9832_PINCTRL_EN);
> > -static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL,
> > -                             ad9832_write, AD9832_OUTPUT_EN);
> > +static IIO_DEVICE_ATTR(out_altvoltage_powerdown, 0200, NULL, ad9832_wr=
ite_powerdown, 0);
>
> Take a look at the use of extended attributes used for this like we see
> in ad5064.c
> That will need an actual channel though so is a more significant rework.
Got it.
>
> >
> >  static struct attribute *ad9832_attributes[] =3D {
> >       &iio_dev_attr_out_altvoltage0_frequency0.dev_attr.attr,
> > @@ -281,7 +297,7 @@ static struct attribute *ad9832_attributes[] =3D {
> >       &iio_dev_attr_out_altvoltage0_pincontrol_en.dev_attr.attr,
> >       &iio_dev_attr_out_altvoltage0_frequencysymbol.dev_attr.attr,
> >       &iio_dev_attr_out_altvoltage0_phasesymbol.dev_attr.attr,
> > -     &iio_dev_attr_out_altvoltage0_out_enable.dev_attr.attr,
> > +     &iio_dev_attr_out_altvoltage_powerdown.dev_attr.attr,
> >       NULL,
> >  };
> >
>
