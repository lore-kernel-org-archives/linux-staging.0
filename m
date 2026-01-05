Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725871E7C03
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 17:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632448; cv=none; b=fZmU2sEbTMDiAnh5yVDb1BjuVc8TwCqJN7JA3Uww15y3rw5P3kSiBWCotMr/B86nLFAn6U2vsre+htj/J8Mgf46dwsTfI0X3bCEgRfuF+p4gQLwE7FBa3ovTKT8Uv7imDw4ii72UK2Ip9dDy1fcEX4xcB0YlWYgnhqLDsHV/+GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632448; c=relaxed/simple;
	bh=aS6SnpOQY5vgvKBJl/D9xJKFVUhYpIpD33q2Gjj5JbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUgE2BRwVkv/Tbp0W000KmhburzAMX7oXbdAPzeArgiPqFsufzCZb7886lhMqKf0Pa/pJ4x2TrFy6eGaLMj064TGhb25w5O/vNwAryxGVBDY/DP7YWoctdravr676e4ZKTDd9lXzHGusO6MWCAIWqRI8w6zheneQfcwsmZMLSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACZtY9QY; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACZtY9QY"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6420c08f886so157891d50.3
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767632445; x=1768237245; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8NZXgPadPZEkwzWUBQYb5my2Ym2kpL3eDcs25dhOFE=;
        b=ACZtY9QYNysivRVn9CEcs/dmo2S7+QFKhVuHhi2haFdsgujIbs5yby74gLeD1dkz8Y
         XS9XroFgCpTGaAOena21d0z8vjt14r6Whcp6l9sslJrnVIRX8f4QwOKem2MtOadgNYln
         FGMiq2TSH1L8bTqFV1uaqR4N1dKX2JTyh+5gIsf9mTymXVBqGFDH4UM6qf2h9FyuHRel
         9MIAkAP6byyAOw6hv9GXKKvKQuo9/WSlMpdo0da+7R2vZO+aJYCLTB9Yoo0JMe00+Nq2
         8OVfV0i6AhHJ0K3LphQP2sVn878PZ3Cxt27wt6p0ynomQpslEJZcACUvJtN+kiNhGDnC
         YVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767632445; x=1768237245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G8NZXgPadPZEkwzWUBQYb5my2Ym2kpL3eDcs25dhOFE=;
        b=hvEt0BwfHZHA15yZhAOVs/R4DnqMDXaI0MAyPQe1nh91Qo4OFwe5R6C7rhH2FHRNxC
         KXw99viJMkjvFlZDHqZshAXHENwEWd0h5VYwZyhYUiLTZUHS6r3ujPQLC71uvtdLCVeg
         DU9pEW4clcCXISr3RfRLQkgN4GJA81M5HkBh+eQX1D7LObv+RpjY0z0IfcvZR6hgtxjz
         LRo1jGYxFFHqDDK+wgEe/FcB4wiX5j+fk14sQfOpuRCR2P/CWP/1cmZMlFho0cyDHI6v
         z6FX78yaP2Rkl0NesYN8RfPe8WH9+OC+4pNRp6nDfRlAKQP1ZcbeQ21JhOilGuaGm2Hx
         h4/g==
X-Forwarded-Encrypted: i=1; AJvYcCW6G5tVotn8LdLo01ReX+dGhPML0LeoCM4dTlOOwqfiSWHpnYZT11+CYUou0mR2BMr+2Y1jR8kcJ0MrH/3V@lists.linux.dev
X-Gm-Message-State: AOJu0YzeLEBfOWF0hDMLOocvtSioWWKIOJYtzR9I3T43qu6jEQB6syrs
	8aU11yXbCE/Ohae/jCb9DDRR9Qs6VBgM2pAtdtEDjR26gqnKl7i+KpvSqDXMwgkQHxXD0kzBTtc
	K+X57Jga74rPG2pl++2IoClflAu1NNYM=
X-Gm-Gg: AY/fxX7vvYwkeiZlMXKuQwtDEf+oZF1gIV8pvCyhzvY84qOju7yGLdaOcP+apnkO2Ch
	JFkpssc453t3yqPNU3ZjZr/ub2HNdi3YiBou90nxijLIrN9Var+Ud696C91BM8PPv0+ryYqmZ1l
	xJKGJChZw1EqdJE5R5saOErOu+P+wdOHbmyGcxm6kAlyGVmqvzVD7bACVcjsWa5vjYonLPd5gT/
	BXXqkfG8aUWG2xtoL31ptD1AHz29ORm3/TD+6IlKFEgXmAfBCFIpOjY13ZU+JExD1SeoKTnPAMM
X-Google-Smtp-Source: AGHT+IHIximRz2m2jGs8u0bx0xjsp8Um2C8mOpJTpVvJQsdOx3gGxbnLnp3w4IfsQ+GKL6y/oDU2erq+6ANxO3S6ECE=
X-Received: by 2002:a05:690e:23c6:b0:644:2e1b:c8bb with SMTP id
 956f58d0204a3-6470c8e2d3amr131608d50.59.1767632445026; Mon, 05 Jan 2026
 09:00:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-2-sun.jian.kdev@gmail.com> <aVvmr2qOrFvoEKGV@smile.fi.intel.com>
In-Reply-To: <aVvmr2qOrFvoEKGV@smile.fi.intel.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 6 Jan 2026 01:00:33 +0800
X-Gm-Features: AQt7F2ph6P0Bf8OBdam7XZpIqbRkmM7c3K-cx7qIKWaHmSFeDtSuMjBbQmYOqkw
Message-ID: <CABFUUZFeO51MW5n1uDp0tcwJeJvgxDRxY3rDqkj2Z-6cO23TwA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] staging: fbtft: core: avoid large stack usage in
 DT init parsing
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thanks for the feedback.

You are right: changing the DT init path from write_register() to
fbtft_write_buf_dc() implicitly assumes "cmd byte + payload bytes" and
does not preserve the generic write_register() semantics (e.g. regwidth /
bus-specific handling).I only have clang/arm64 build coverage (no
access to the actual panels),
so I can=E2=80=99t provide runtime validation yet. For the remaining 3 driv=
er-local
patches, all affected drivers have .regwidth =3D 8 and the sequences are
=E2=80=9C1-byte command + N bytes data=E2=80=9D (gamma/LUT). The intent was=
 to avoid the
huge write_reg() varargs call that triggers -Wframe-larger-than=3D1024.

Given the lack of hardware, would you prefer one of the following?

1. Drop the driver changes and instead bump -Wframe-larger-than for these
   specific objects in the Makefile as an exception; or

2. Keep the driver changes but I should provide a detailed test pattern /
   list of tested devices =E2=80=94 if so, what level of detail would be ac=
ceptable
   (exact panel model + wiring/bus type + expected output), and is =E2=80=
=9Cbuild-only=E2=80=9D
   ever sufficient for warning-only changes in fbtft?

Happy to follow the approach you think is appropriate for this staging driv=
er.

Best regards,
Sun Jian

On Tue, Jan 6, 2026 at 12:28=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Sun, Jan 04, 2026 at 07:06:35PM +0800, Sun Jian wrote:
> > Clang reports a large stack frame for fbtft_init_display_from_property(=
)
> > (-Wframe-larger-than=3D1024) when the init sequence is emitted through =
a
> > fixed 64-argument write_register() call.
> >
> > write_reg()/write_register() relies on NUMARGS((int[]){...}) and large
> > varargs which inflates stack usage. Switch the DT "init" path to send t=
he
> > command byte and the payload via fbtft_write_buf_dc() instead.
> >
> > No functional change intended: the same register values are sent in the
> > same order, only the transport is changed.
>
> How did you test this?
>
> ...
>
> >       struct device *dev =3D par->info->device;
> > -     int buf[64], count, index, i, j, ret;
> > +     u8 buf[64];
> > +     int count, index, i, j, ret;
>
> Please, try to preserve reversed xmas tree order.
>
> >       u32 *values;
> >       u32 val;
> >
>
> ...
>
> > -                             buf[i++] =3D val;
> > +                             buf[i++] =3D val & 0xFF;
>
> Unneeded change, I suppose.
>
> ...
>
> > -                     par->fbtftops.write_register(par, i,
> > -                             buf[0], buf[1], buf[2], buf[3],
> > -                             buf[4], buf[5], buf[6], buf[7],
> > -                             buf[8], buf[9], buf[10], buf[11],
> > -                             buf[12], buf[13], buf[14], buf[15],
> > -                             buf[16], buf[17], buf[18], buf[19],
> > -                             buf[20], buf[21], buf[22], buf[23],
> > -                             buf[24], buf[25], buf[26], buf[27],
> > -                             buf[28], buf[29], buf[30], buf[31],
> > -                             buf[32], buf[33], buf[34], buf[35],
> > -                             buf[36], buf[37], buf[38], buf[39],
> > -                             buf[40], buf[41], buf[42], buf[43],
> > -                             buf[44], buf[45], buf[46], buf[47],
> > -                             buf[48], buf[49], buf[50], buf[51],
> > -                             buf[52], buf[53], buf[54], buf[55],
> > -                             buf[56], buf[57], buf[58], buf[59],
> > -                             buf[60], buf[61], buf[62], buf[63]);
> > +                     /* buf[0] is command, buf[1..i-1] is data */
> > +                     ret =3D fbtft_write_buf_dc(par, &buf[0], 1, 0);
> > +                     if (ret < 0)
> > +                             goto out_free;
> > +
> > +                     if (i > 1) {
> > +                             ret =3D fbtft_write_buf_dc(par, &buf[1], =
i - 1, 1);
> > +                             if (ret < 0)
> > +                                     goto out_free;
> > +                     }
>
> I believe this is incorrect change and has not to be applied. write !=3D
> write_register. Without any evidence of testing, definite NAK to it.
> Otherwise, please provide detailed testing pattern and which devices were
> tested.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
