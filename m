Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3CC31158A
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603482; cv=none; b=iDW37TgcM3+WnybNzndzA69m0vQyzOdp18sHw9SEUOJ+aPXV5DFOn8Zn11L9zSkEd3mXfSUNBpiT1L6+NtSW+Sni5wFBHyKaRHnuFSd/u4P/FHM1wHGHI7kgR7mO8sUo0/0zZ9D99XHP28iiRZDHS4DqGr6M7WMhi9i7J+y7/UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603482; c=relaxed/simple;
	bh=XaX4bHRiH9ReiVTNHKZXGn1Ygf3lNSmqNcpoEyBFzX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i52PJMM7zq9THN+pKZkPsYTXW+foNDBDBjiBSh7C5/CMeTyT8vPi/A++XnulDvLy0cShyx4WXYU5DxBiDpkswYCInJdl3aEfNzaUaoit75DXDYax5HoY+AvWrq486feV2thUk1H7a1Wv9j7OBH2KRMj+ORMT9rmvWq5qU9txbF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9k4MbnI; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9k4MbnI"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64669a2ecb5so1642590d50.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 00:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767603480; x=1768208280; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfi641MhA/umVLqek5QS9tzsJKJD7eq/LZgECsG3MQM=;
        b=P9k4MbnICl9c+qQQu3r+YZ5HrrRDRlnF1j47ass3sXvYOrhPECYAQdTMxMbZrOiD2J
         uED2otzGZfKqR8An4zQOPOtWwhLxrODHdK+dD5kZN40ys8somsnbu6gl3BMb4TzcjX9S
         +mUe6PtX9KISYf0GJjIjBZdLdh7ArXepk7jO/J9boQEWAxm8Q9dO2OcNHkNghTqw72t4
         wK9XT9WvFR9atzR1PCF6yjwV5wbL3ZVjlQWHbT0UhI2wk7u9iLKG3F74kyVCdtv+s27E
         blTvYEHQWXcAu9ucmD2bZmjuJmwjuBoQjvdpCAg4b9tUr+H6N2nGfipnbIZbp4Pmgomu
         ZRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603480; x=1768208280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfi641MhA/umVLqek5QS9tzsJKJD7eq/LZgECsG3MQM=;
        b=Q4o9+Jpqm9eViSPsfggqSnxt4q6ohdxUVzezpxOkRU4J2/wYZSGfnGRChLR9No6MCt
         FzY5DoKJct2QqQX7IIafKmJS47h2qFH78KFLe/PJ0yvdqPqa5EqK37Guzt4PaPJrYurU
         umuFqSvAi9NUg30E2N+tMI8jPM4hDbzrlLNX92eiy1RYFS5CbJgVOeUTQKtMyD4/OSAK
         Uv10M768QGB3zLk9w0W349Dis9Ywv2srr1om0n54TrlbHvyf9S1Mlj1gZZnDym3N+UxF
         MbM75O00KXKh/NGpmmlvZhzBH05/1Ezsln3Bc4wQwXgcvJkHeqWaHMVyc3xTFy36Krlq
         KSAw==
X-Gm-Message-State: AOJu0Yx5j6O/RaFToDYwRXVS0ChHXTh9ADgNpkOlZoD67g5oUGkp9uPT
	d528MmZCmLu7gq8xwNhH4Od1wcDc1qsGEReKxGALnrtMciSn0jLWdT+OMz9Kodz4BVqPTLXM75m
	b0tLdH0XeSruhkor7YKFaUMDsvBHA8y7MvnU5driL+A==
X-Gm-Gg: AY/fxX6iaHPyOMkULGgBkyqt234szQgNyoECaYzKkAubh/FLju97xIOhRlgo1ZS9Qqo
	ZD/TWXC8S0KbcE9E/5BvYH9kE67BdoD2WOoYpFGIbPnaC6yPSfJQoRwDHGDHrG2GEmcd6jp6qnQ
	qsL5569V5FqmdmnYah3d10kJpb+AoJokOrmt7j/sZV16NyEai5rS2IkDMA6PIqR+XS9pVXpK7VL
	rf5tUds80YhbDW95gRH3WfY/oXibHwBAgWi19aAp89Zwm1TfQXNRuu1R3eomFf+v6wRDz93AJ1D
	Ru9t7x5L8ao=
X-Google-Smtp-Source: AGHT+IGPvme/oa9EmRyX4NQ0cxB52KuQL58ODtWsxH46f6jDOlCmADYOjHWw9FTKJAzaY5s5UT/1HSQDRYK+fDcZT8M=
X-Received: by 2002:a05:690e:120f:b0:63f:b440:7f90 with SMTP id
 956f58d0204a3-646e3347886mr4238085d50.16.1767603480050; Mon, 05 Jan 2026
 00:58:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260105021026.556244-1-sun.jian.kdev@gmail.com>
 <20260105074917.607201-1-sun.jian.kdev@gmail.com> <2026010505-surging-resurface-a7d3@gregkh>
In-Reply-To: <2026010505-surging-resurface-a7d3@gregkh>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 5 Jan 2026 16:57:48 +0800
X-Gm-Features: AQt7F2qTxov-obu2XVbbWDf_xbl8TSMp3O86wKEULY1m2e8OiP1LCqksFz8sQzs
Message-ID: <CABFUUZHRz919=C=fmMqH1sQcURbm+qiQB795xWPCd9Rax_M4ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: sm750fb: fix unused tmp in sw_i2c_wait
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, sudipm.mukherjee@gmail.com, 
	teddy.wang@siliconmotion.com, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Sorry about that =E2=80=94 I mistakenly replied only to you.

As you pointed out, sw_i2c_wait() sits on the bit-banged I2C GPIO
transitions, so changing the delay semantics without hardware validation
is risky. I don't have access to the hardware to validate timing/behavior,
and I can't justify that udelay(1) is equivalent to the existing loop.

Please ignore v2 (and v1). I won't resend a warning-only workaround.

If someone with the hardware can help validate a proper fix (e.g. a
well-justified time-based delay, or reworking this to use a proper I2C
bit-banging helper), I'm happy to revisit.

Thanks,
Sun

On Mon, Jan 5, 2026 at 4:05=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Mon, Jan 05, 2026 at 03:49:17PM +0800, Sun Jian wrote:
> > clang W=3D1 warns that 'tmp' is set but not used in sw_i2c_wait().
> >
> > sw_i2c_wait() provides the delay between bit-banged I2C GPIO transition=
s.
> > Replace the loop-count delay with a time-based udelay(1) to avoid CPU-
> > dependent timing and fix the warning.
>
> Why is udelay(1) the same here?
>
> > Compile-tested with clang W=3D1; no hardware available to validate timi=
ng.
>
> That's going to prevent us from being able to take this, sorry :(
>
>
> >
> > Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> > ---
> > v2:
> > - Replace cpu_relax() delay loop with time-based udelay(1) to avoid
> >   CPU-dependent timing (per Greg's feedback).
> >
> > v1:
> > - Used cpu_relax() in the loop to silence -Wunused-but-set-variable.
> > ---
> >  drivers/staging/sm750fb/ddk750_swi2c.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/s=
m750fb/ddk750_swi2c.c
> > index 0ef8d4ff2ef9..d5843fa69bfa 100644
> > --- a/drivers/staging/sm750fb/ddk750_swi2c.c
> > +++ b/drivers/staging/sm750fb/ddk750_swi2c.c
> > @@ -11,6 +11,7 @@
> >  #include "ddk750_reg.h"
> >  #include "ddk750_swi2c.h"
> >  #include "ddk750_power.h"
> > +#include <linux/delay.h>
>
> Shouldn't this be at the top of the include lines?
>
> >
> >  /*
> >   * I2C Software Master Driver:
> > @@ -92,12 +93,7 @@ static void sw_i2c_wait(void)
> >       * it's more reliable than counter loop ..
> >       * write 0x61 to 0x3ce and read from 0x3cf
> >       */
> > -     int i, tmp;
> > -
> > -     for (i =3D 0; i < 600; i++) {
> > -             tmp =3D i;
> > -             tmp +=3D i;
> > -     }
> > +     udelay(1);
>
> You are ignoring the comments in this function.
>
> Also, if you reduce this to a single call, shouldn't this whole function
> be removed?
>
> thanks,
>
> greg k-h
