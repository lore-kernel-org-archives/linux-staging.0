Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28C4111AD
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 02:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729133260; cv=none; b=FiXwihuILtuu9wiU9/taRTX2sasoJ95svbNbjZk6ishR+cCRFD04mbkl349NRlAtG1bCepzJgDQZwo6vqeU9ItsFA8dv277GzgXEvaode9BPxipm5B0Y2Jfdd7umR5BtG/MbJW+yWYCbWF5I/HDwlmqnzGb8QGPY9JgRlkMxbJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729133260; c=relaxed/simple;
	bh=CQI8bmkxSA9JvIEYFak6LDBwpyVIW2iviPeQ89uleC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6IQDDiXVV4LWkR4MLp4ODXG0DDWchLqtzTMfooN3+slwQm+hjyU4oi9ioahKkZI6H0hXiGcEMwiROGwYGYZ10AdEsGVtX2/ZF8MyVsECDyHXwNY/mf0IxDXDUNOYAHRw9dkbWT8Msv9JAoOMwdIYRaRY9rAdJNomFvGLkjsZos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=03deS4MA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="03deS4MA"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so695250a12.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 19:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729133253; x=1729738053; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61NRy7JLQSBc8GJNSzFFlgHXb8XOPpLuVXW5zR0xav0=;
        b=03deS4MA2oQbB6SlHc3sy2iZW6w4+rNkYVY/L/sJ6SmwSz2qtMtI/n3R5tKK+NfJM0
         lqEO6l2KTN0E/dDpP+wkxMoGa0S33Kz0EHQzSBsfoq0k0eS2e6ak5wMRvdrZSc1OB+B5
         ZYBWF6y8G15L2IeYoIcAVS7lSUJY2bHgEKpz2wt0wu47CMTgH7XBD47P+Z0xN2FKFgUr
         mRsLsZZrDnZG6ZteJhlC2+jwGaCodX+pHGQTIdC80qLZ3/gbHFvqmFlPc+rTACEZNxYN
         ZLTfTer/5tH2Y28ImJGOCD+ZKqLrGnNW3VD23vHjAFAINGeue+v8YtgL+IAMmpJahTVd
         SA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729133253; x=1729738053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61NRy7JLQSBc8GJNSzFFlgHXb8XOPpLuVXW5zR0xav0=;
        b=H56vJxOoLoQ3HAcR9agO89xXHrsgLDzun6sGomK7JTVMisbWXg/hmONp4hNUuwhS7F
         yu2fmwa6xQl6JRe3+ajh+UHEbKj2QOjlnA5VVKjtNSL5/ZRd8tT+hedmDdZoeWg+rhwJ
         qdb7aUqAZHyNtVmFEEyVw3+eTi7vA1S+3s4PY74g1hhaCw3PvaUW06C+h1qJAdUIuaIX
         YOEBs3Cb5JTd1z0BK7K2ZIG83LFs3IWJ6NKvMrrhsx80lUdrHd+c10rFo04CM7PHD+Or
         1mpCadU3dMqCDNNwf3a3/eo1xg1uX8WZ5Yj0PMdWQMSZfDvbtKG4xmBg3cXVS/8HZcnW
         S44w==
X-Forwarded-Encrypted: i=1; AJvYcCU6xcL/63slVZ5pVvusTZkAEjL2JGNGRyfg28wdXx1IMyIgZpyCNifLO7a+2cHhCMOA8qgebw7vSiLrkHf3@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh7WolgXFnloB/gcNeyEFcF73BITD+tX60b6w7RheAy5CllvmP
	ikEgp6Tkg2bGXY0d4S8Wk5lhRfwecMHZFuHAV5EMFcUlN0VzaeKnqYmZy3l906TmZ396nHwi/zP
	NQb/Axvp/ZjLuehKy5DXS32zabIB86t9wwC1NkA==
X-Google-Smtp-Source: AGHT+IG9CJZF+U0YZJ9TtWDocpngxRCnjAdYuq0lxGMzr2c/UE2pswOjcS9hrxQKpuQohovg+UuP+JxeeUwVLBtn6QQ=
X-Received: by 2002:a05:6402:2804:b0:5c9:29f3:fba3 with SMTP id
 4fb4d7f45d1cf-5c948cca98bmr17920735a12.20.1729133253025; Wed, 16 Oct 2024
 19:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241016075319.4092-1-everestkc@everestkc.com.np>
 <2024101654-jasmine-ransack-7190@gregkh> <CAEO-vhGuJUdbBhchbga33TNWvZXTXHWbd4=M8xeWkHAi1rnw2g@mail.gmail.com>
 <f3fdd6b8-53bb-4e9d-bb32-3816035d4d52@stanley.mountain>
In-Reply-To: <f3fdd6b8-53bb-4e9d-bb32-3816035d4d52@stanley.mountain>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 16 Oct 2024 20:47:21 -0600
Message-ID: <CAEO-vhFAb=xfc2sZiezW7Zn0dWNQ4axVxE6GErayKs76NtG1bg@mail.gmail.com>
Subject: Re: [PATCH V2] staging: gpib: Remove a dead condition in if statement
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, dpenkler@gmail.com, 
	skhan@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 9:00=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Wed, Oct 16, 2024 at 06:54:00AM -0600, Everest K.C. wrote:
> > > > diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/s=
taging/gpib/eastwood/fluke_gpib.c
> > > > index f9f149db222d..51b4f9891a34 100644
> > > > --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
> > > > +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
> > > > @@ -644,7 +644,7 @@ static int fluke_dma_read(gpib_board_t *board, =
uint8_t *buffer,
> > > >        */
> > > >       usleep_range(10, 15);
> > > >       residue =3D fluke_get_dma_residue(e_priv->dma_channel, dma_co=
okie);
> > > > -     if (WARN_ON_ONCE(residue > length || residue < 0))
> > > > +     if (WARN_ON_ONCE(residue > length))
> > >
> > > No, this is incorrect, now we never notice is the call to
> > > fluke_get_dma_residue() has failed.  Please fix that bug instead (hin=
t,
> > > Covertity is giving you a pointer to where something might be wrong, =
but
> > > this change is NOT how to fix it.)
> > I need a little guidance here.
> > My best guess to fix the bug would be to make fluke_get_dma_residue()
> > return an int instead of unsigned int or size_t. But theoretically the
> > maximum value of residue can be UINT_MAX, and casting it to int will
> > result in a negative number, which in turn will cause  the error check
> > condition to evaluate to true.
> > The best solution I see would be to make fluke_get_dma_residue() return
> > an int (-1 for error and 0 for success). Then pass the address of resid=
ue
> > reference to fluke_get_dma_residue() to be updated.
> > Am I on the right track ?
>
> Functions shouldn't return -1 on error, they should return proper error c=
odes.
Noted.
> >
> > Also,I searched for the functions with names that match get_dma_residue
> > in the kernel source code and found that they return unsigned int. I al=
so
> > noticed that no error checks have been made to check if get_dma_residue
> > was successful.
>
> $ git grep get_dma_residue | grep static | grep -v gpib
>
> arch/alpha/include/asm/dma.h:static __inline__ int get_dma_residue(unsign=
ed int dmanr)
> arch/arm/mach-footbridge/dma-isa.c:static int isa_get_dma_residue(unsigne=
d int chan, dma_t *dma)
> arch/m68k/include/asm/floppy.h:static int vdma_get_dma_residue(unsigned i=
nt dummy)
> arch/mips/include/asm/dma.h:static __inline__ int get_dma_residue(unsigne=
d int dmanr)
> arch/mips/include/asm/mach-au1x00/au1000_dma.h:static inline int get_dma_=
residue(unsigned int dmanr)
> arch/mips/include/asm/mach-generic/floppy.h:static inline int fd_get_dma_=
residue(void)
> arch/mips/include/asm/mach-jazz/floppy.h:static inline int fd_get_dma_res=
idue(void)
> arch/parisc/include/asm/dma.h:static __inline__ int get_dma_residue(unsig=
ned int dmanr)
> arch/parisc/include/asm/floppy.h:static int vdma_get_dma_residue(unsigned=
 int dummy)
> arch/powerpc/include/asm/dma.h:static __inline__ int get_dma_residue(unsi=
gned int dmanr)
> arch/powerpc/include/asm/floppy.h:static int vdma_get_dma_residue(unsigne=
d int dummy)
> arch/sh/drivers/dma/dma-pvr2.c:static int pvr2_get_dma_residue(struct dma=
_channel *chan)
> arch/sh/drivers/dma/dma-sh.c:static int sh_dmac_get_dma_residue(struct dm=
a_channel *chan)
> arch/sparc/include/asm/floppy_64.h:static unsigned int sun_get_dma_residu=
e(void)
> arch/sparc/include/asm/floppy_64.h:static unsigned int sun_pci_get_dma_re=
sidue(void)
> arch/sparc/include/asm/parport_64.h:static inline unsigned int get_dma_re=
sidue(unsigned int dmanr)
> arch/x86/include/asm/dma.h:static inline int get_dma_residue(unsigned int=
 dmanr)
> arch/x86/include/asm/floppy.h:static int vdma_get_dma_residue(unsigned in=
t dummy)
>
> Only the Sparc functions return unsigned int.  The rest return int.
Why is it so ? Are there any resources I could go through to
understand it better?
> The return value is going to be between 0 and priv->dma_buffer_size (0x7f=
f).
> It's set in fluke_allocate_private().
Thank you for pointing it out.
> Just make the return value an int.
Noted.

> regards,
> dan carpenter
Thanks,
Everest K.C.
