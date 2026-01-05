Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473C922578D
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 15:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625805; cv=none; b=We6d8wzV/zk1kkye2cuD03Fe/GAfxm/BhTNpmccmdJGKsrcZcMzq8xkOFYSw8ycd3z1/Q+t2Yu6ueE6LLsnbfnnZ7zHwd98qBkOCsRkqw0zMfyffL8o6iSl7srS/3ZGWe1ln38vxKopqQJd925d5H9KirRqGo6Xs/t9NNnTeySE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625805; c=relaxed/simple;
	bh=qbkIUQxXn+yUKbjDX552tLsPC9KZIoC+f14OufuUoI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzKcGyU3IXoTp0zosml8u8PPLYs8tcvORypEg0izsHjrOV34vjiE+xHqzbAqzg943yn1P3QKwHw5bXiIeYvGqiglaXRb0g7DoV0hLsTW5UTaWkL/oTB/8YZga3uyu7qZF0WYoE2f4P1kYQew0lszNTFDJe2mYfnAUsNn6BVkQsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAMk3EMD; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAMk3EMD"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fb9a67b06so583907b3.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 07:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767625803; x=1768230603; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjgKkI960mta53SMy3Cx/puUXrH0qsBk8eh+vG4/oMQ=;
        b=cAMk3EMDe9PKYsWnG/oQaAUtEY6NG2x1bMjeRWmee/2gRG0voQ4JX+DoIylXxk3fs5
         Yn0nzuWndTNmAgzPoZkhGnAodw5N/P41FOeiLmDHUr5f4ueG5bWomLMgGlvys4wIvmym
         VEo7XC7xbZmVwZZCoXZEF9g1WdnH+SbUZE8uehDl2tMmNVvbqGfPcxvwDeIHlmM/a77f
         kuExa6y+AHa/VJIRIs+FKq2VfVoaqNg3lW29jUKS5ZA9u0SkHlyY5bYLHEQbQbSQ1J2x
         ozw/+cOaUUkcgdDV9MPOUzDm1QEyLfY1+8PMdJUcG115PenyGe7qAGsMXuQzkvwJF+fb
         N5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625803; x=1768230603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BjgKkI960mta53SMy3Cx/puUXrH0qsBk8eh+vG4/oMQ=;
        b=ifq0TOqA+vxO7Spn38yaDN/A2DukpPL0iVZzrqOEBjYDf7WFNl2bnLcvmw2O8ICeaQ
         o3miiFu7d5xm+EmsU+uJsX+t1o61pxYlEy1df7W3tcpBFDSZifUVDdMhimALGPWzG6Ce
         nmJnVJlTaenyckHb2mzAKXm2mPs/fKWXUSMsKANl949KETZ/mLtUPowvX0+kRRqucnfz
         Ebw+jlqRc80+lkqqj5sVnBacTQh2x9Wmut6ARLIj8S1sluR1jVM2vpNGfAdUkw4105pJ
         0WI+6rukHIWgtzZfhOgmDO1tYdvjVa6IoO0Zqjxzs8a3w9G+o1XUL7nTF604BZvYMEwE
         Yy/w==
X-Forwarded-Encrypted: i=1; AJvYcCUMpBztU7OBpT1ECZ7YK1WWs+6Zs7rOhNDqNywZmc0ImVBSbeJDpVhGx9woIqsXNZqi/qChPdMW2tuCZ3wa@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5iR8Nu+jKTiuiX9VQ9H/2t/lYVeyv0RnIEhuQoiiAX4/hFKP6
	tcpqIjY241VAnret5bJ83QVYZQfx2cAz4RhLQp7VCRPoEwBzpp99v6k8xeAVA2rVwkQuEVunMQ5
	EvcQDsP+W9WZ+/ToWDTDqa7DwRK8D+zc=
X-Gm-Gg: AY/fxX6eP3g2ZbRiiQP8seQukvIaV4N0IJgOoXx/6gq9V/kzNUe+MLxu/8sX/4unKhJ
	hD6gVSOd0LbmY5gw6GUVA163YGJZovCuEXuaI4E/V5bGAyREIN0aPvpb+2rOp4w4QsMlLNESQu9
	3kfEROQR6bYyUzvimkKugL+GheM7ChljSd8nmsW/ZlzykvTP8ZaSHqzlWzH0F1XA0fXtD9591WL
	rVU7Wa4ewB99d+xGl2jVz2y0M0CQ4mSnub3gl/wDTgnZIzVHKOKsLCy0BQ1YjZ3q00wffRhiC9j
X-Google-Smtp-Source: AGHT+IEd4FoOYeV2bi6QTaTAdIjXmnqph1DvLN+wvfaAUUzyAym8Y4JISBI1VyDvskcD09yI/QPbCHBE8WjooHM5BLQ=
X-Received: by 2002:a05:690c:7484:b0:78f:984b:4bb9 with SMTP id
 00721157ae682-78fb405d23cmr421841917b3.56.1767625801687; Mon, 05 Jan 2026
 07:10:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-3-sun.jian.kdev@gmail.com> <aVvNJV93mprLcZwy@stanley.mountain>
In-Reply-To: <aVvNJV93mprLcZwy@stanley.mountain>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 5 Jan 2026 23:09:50 +0800
X-Gm-Features: AQt7F2pZF6GavYIHt7cH5Iy0vK4sqA7M4pPH0NYIVOmEsaNlJo1jShKyDDs3_nw
Message-ID: <CABFUUZErGq8tApjtDadG_gMnouJ0WTHXe10WyRHRAy5EWutijw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] staging: fbtft: ssd1351: send gamma table via fbtft_write_buf_dc()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thanks. Agreed.

For v2 I=E2=80=99ll keep this patch minimal: only switch from write_reg() v=
arargs
to fbtft_write_buf_dc() and reduce the stack usage, without other changes.

Any follow-up cleanups (if needed) will be sent as a separate patch.

Thanks,
Sun Jian

On Mon, Jan 5, 2026 at 10:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sun, Jan 04, 2026 at 07:06:36PM +0800, Sun Jian wrote:
> > Clang reports a large stack frame in set_gamma() (-Wframe-larger-than=
=3D1024)
> > due to the large write_reg() call emitting 63 gamma bytes via varargs.
> >
> > Send the command byte (0xB8) and the gamma payload using
> > fbtft_write_buf_dc() to avoid the varargs/NUMARGS stack blow-up.
> >
> > No functional change intended.
> >
> > Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> > ---
> >  drivers/staging/fbtft/fb_ssd1351.c | 35 +++++++++++++-----------------
> >  1 file changed, 15 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft=
/fb_ssd1351.c
> > index 6736b09b2f45..b4ab2c81e528 100644
> > --- a/drivers/staging/fbtft/fb_ssd1351.c
> > +++ b/drivers/staging/fbtft/fb_ssd1351.c
> > @@ -119,43 +119,38 @@ static int set_var(struct fbtft_par *par)
> >   */
> >  static int set_gamma(struct fbtft_par *par, u32 *curves)
> >  {
> > -     unsigned long tmp[GAMMA_NUM * GAMMA_LEN];
> > +     u8 data[GAMMA_LEN];
>
> Ugh...  GAMMA_NUM is 1 so this is an annoying calculation.  So what
> this does is it changes the type from unsigned long to u8 and renames
> the variable.  I am fine with renaming the variable it's unrelated and
> makes the review harder.
>
> > +     u8 cmd =3D 0xB8;
> >       int i, acc =3D 0;
> > +     int ret;
> >
> > -     for (i =3D 0; i < 63; i++) {
> > +     for (i =3D 0; i < GAMMA_LEN; i++) {
>
> GAMMA_LEN is 63.  So this looks like a change, but it's an unrelated
> cleanup.
>
> >               if (i > 0 && curves[i] < 2) {
> >                       dev_err(par->info->device,
> >                               "Illegal value in Grayscale Lookup Table =
at index %d : %d. Must be greater than 1\n",
> >                               i, curves[i]);
> >                       return -EINVAL;
> >               }
> > +
>
> This is an unrelated white space change.
>
> >               acc +=3D curves[i];
> > -             tmp[i] =3D acc;
> > +
> >               if (acc > 180) {
> >                       dev_err(par->info->device,
> >                               "Illegal value(s) in Grayscale Lookup Tab=
le. At index=3D%d : %d, the accumulated value has exceeded 180\n",
> >                               i, acc);
> >                       return -EINVAL;
> >               }
> > +
> > +             data[i] =3D acc;
>
> Here we move the acc assignment after the sanity check, but it's just
> an unrelated cleanup.
>
> >       }
> >
> > -     write_reg(par, 0xB8,
> > -               tmp[0],  tmp[1],  tmp[2],  tmp[3],
> > -               tmp[4],  tmp[5],  tmp[6],  tmp[7],
> > -               tmp[8],  tmp[9],  tmp[10], tmp[11],
> > -               tmp[12], tmp[13], tmp[14], tmp[15],
> > -               tmp[16], tmp[17], tmp[18], tmp[19],
> > -               tmp[20], tmp[21], tmp[22], tmp[23],
> > -               tmp[24], tmp[25], tmp[26], tmp[27],
> > -               tmp[28], tmp[29], tmp[30], tmp[31],
> > -               tmp[32], tmp[33], tmp[34], tmp[35],
> > -               tmp[36], tmp[37], tmp[38], tmp[39],
> > -               tmp[40], tmp[41], tmp[42], tmp[43],
> > -               tmp[44], tmp[45], tmp[46], tmp[47],
> > -               tmp[48], tmp[49], tmp[50], tmp[51],
> > -               tmp[52], tmp[53], tmp[54], tmp[55],
> > -               tmp[56], tmp[57], tmp[58], tmp[59],
> > -               tmp[60], tmp[61], tmp[62]);
> > +     ret =3D fbtft_write_buf_dc(par, &cmd, 1, 0);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D fbtft_write_buf_dc(par, data, sizeof(data), 1);
> > +     if (ret < 0)
> > +             return ret;
>
> These are good changes.  Just change the type from unsigned long to u8
> and use fbtft_write_buf_dc() instead of write_reg().  Then do the other
> changes in a separate patch.
>
> Same for the other patches.
>
> regards,
> dan carpenter
>
> >
> >       return 0;
> >  }
> > --
> > 2.43.0
> >
