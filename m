Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F203F789B
	for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782481296; cv=none; b=FmWcgqS+57feGvUEvqKZavMoReLXAwQHr8URxI7+tSIfUTCRvSPnX9Orty4xHmdKiv6j9MDis9lVyFpm5NrKyqNhj2QpnbkYJEYVw+EWQmRkin73+YflSpcxtOBDTSMCKX4gxPnGSaKL+Uz+gRdCWpPJDiQhVZxNZH9HOjYcKXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782481296; c=relaxed/simple;
	bh=YXrVrVYcp68EEcS0zryKhbW8e+jMsX4pF+5qgEERs3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gymVSEgwTfQTqOHsUO7mqPHLXhPgi/dBW0CVuz8paBOd3T9BtPy+SvHI6NgJHaY2/fW6KIJN81ByBNXLhlOt00ImviNzJEFkWrjiUmvk1WT2RM+5Tiz0penLBmZJm28f8/dzgqHM8vPgpgqWmrccfkeXP1/6GjpfaBEv8HotKf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYOqIuCZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYOqIuCZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so15289175e9.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 06:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782481292; x=1783086092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inH5gHgw2GQJ8Jf/udrV2wKYoIHtRnRBi3E4+pGgxJ8=;
        b=IYOqIuCZIpFRgSWg+lqxrm/dm78cRzGnyGs+H33UhYTQgWC2DvrS5pw5NbapJ4bUjW
         8n3ShoD1BoWDCjhMtx1lAK3Idg4U8gXwAU5kFqoSGd1mrexIOHiwlGXoJjcT/vmd78qz
         dJ2ms4G6nDyt6fTuTJp+yiYthWGvaHFJXzRau0ygpWsxqpS6ZsIcAY84kA8YKXFuYsJj
         ArIh1aBCXMvkBqYcOXH0cfJ3pn0d8TvDMgesz1djD2VSARNuMoTiAFzie67SJzvy3NdB
         bouQKtCLbxQygRjiDAn7OHLHCbtmA9TDCiUSQ9U2NVAmQyj5XMPga5gEP5FTR7PPigNj
         wHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782481292; x=1783086092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=inH5gHgw2GQJ8Jf/udrV2wKYoIHtRnRBi3E4+pGgxJ8=;
        b=JhoJSMTDyeAhb5hKv4eUg5NmOlUqxuCwGU/K5D5q63yMoCFfzGeRsYrjDweOP4d5Oi
         q4i4MuQyW0JSVmBTUNK1EAEMFco4/VbLt914cXhR0qF2+wY4K40DY+3aHeny3JbSDXHp
         1W63sMH8Z72ih1C2nZhi4sVFSMIIX8p7/dLzlpMntQfg47BnthKAg6fydnDTVVdpG6v0
         F09Hv5e0WSADT5vz8ZLk+Pu8BIGfRa6adijop3CpOi6GiWOsm7ff635jsV7Zyz13fWbu
         QvQ9a5HPfpkpFXvC2mE1XOH9B/K26GVz5a4WwL7W4qD1Up3lXELQYoBx246fvyOx4i/u
         o6rg==
X-Forwarded-Encrypted: i=1; AFNElJ9FPcMzlscFS1m8jpRtT87WUlqZ8+xVveOXDaadEJ6KiRZkn5EnqY1m2ErKAzebfpSNtgm9biht8zgQfN5U@lists.linux.dev
X-Gm-Message-State: AOJu0YxhwPogxs18649E//Ffji+xOKQtEsMypxwNnH9DDlaPC7BoFixV
	dG+vdGO36F1ocqmbQhG6CWKAHDct/5uuc63v3Ws9WBd8HrH0hjBvzauB
X-Gm-Gg: AfdE7cmPmlDHNh0oqbmEL8DDqfWBhS7uFwTThg4zBLrinNbER3C2dtBUf5LDMoMBfsY
	2Hhbi/VBHFngesYNIYa/BLEBwUNPg5fdayNGSgzl++hIU8MWgSPK6RWBoMSKuR6lmEQHbPvp3za
	zsiIwXlaHqSQIk37stNU4pO9xFeksYoBQ+btqKltmw85Y8143Z1XPW1JjLSCKHCUNoVY5Zy0vil
	I61KwOUWUG66+k3irfz2q8CGqKmjO+S4pEY3sMU3mz+jiySCXLtu9T/yU4CrTOwtDorAF7/GLPY
	6yLcIsWHcaF/KJyU3Fm+YXHEvDZ7lhQeZ5cfHw+uZLPsqBvOAuNp16wKudp1+Kbjczga4fDLrGe
	vDYpwp9opNFQXthkwSEwIVN+JyNB4KzOcaeBGQQzuNLzTdOqx4LsSFUlhYXyrq/2XAXco5qRg22
	X9lbGrChuHs4fP5y6ANLlvcwcceDAmILJFLJRMTzYkxsBysGVPnw==
X-Received: by 2002:a05:600c:8519:b0:492:4889:3d18 with SMTP id 5b1f17b1804b1-4926641a911mr83146765e9.9.1782481291771;
        Fri, 26 Jun 2026 06:41:31 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268f7670bsm79114415e9.0.2026.06.26.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 06:41:31 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:41:30 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Joyeta Modak <joyetamdk@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: use ARRAY_SIZE() in NUMARGS macro
Message-ID: <20260626144130.6e3c924e@pumpkin>
In-Reply-To: <CAN3JnUCem3Mw17e5D9b-aX58_ZaAvC6GZ-sBPEQfTTTP=o-WHA@mail.gmail.com>
References: <20260624073804.4391-1-joyetamdk@gmail.com>
	<ajvAGK-0kCfkThcs@ashevche-desk.local>
	<CAN3JnUCem3Mw17e5D9b-aX58_ZaAvC6GZ-sBPEQfTTTP=o-WHA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jun 2026 14:27:25 +0530
Joyeta Modak <joyetamdk@gmail.com> wrote:

> Thank you for the feedback and the question.
>=20
> I checked every write_reg() across all fbtft drivers and found that
> the largest number of arguments is 129 in write_reg(par,
> MIPI_DCS_WRITE_LUT,...)
> As COUNT_ARGS() in args.h only supports up to 15, it is not a safe fit he=
re.

That is also a pretty horrid way to write that message out.
The function call itself uses well over 512 bytes of stack.
Then there is all the code to push the arguments.

It really shouldn't be too hard to pass the address of a const u8[]
all the way through to the code that copies the data to the hardware.

I tried to follow the code earlier. The 'common functions' that pretty
much just call back through per-driver functions with names the 'write'
really don't make it easy.

	David

>=20
> However, the kernel test robot reported a problem with my
> implementation as the __must_be_array() check in ARRAY_SIZE() requires
> the array to be a compile time constant expression and thus breaks the
> call at several places.(example par->bgr)
>=20
> I tried to reproduce this locally on my system using both GCC and
> Clang with ARCH=3Dum on x86_64 but could not reproduce the build
> failure.
>=20
> Since the original sizeof() based approach had no such errors flagged,
> I am thinking of dropping the ARRAY_SIZE() approach.
>=20
> Any other feedback is appreciated. Thanks again.
>=20
> On Wed, Jun 24, 2026 at 5:01=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > On Wed, Jun 24, 2026 at 01:08:04PM +0530, Joyeta Modak wrote: =20
> > > NUMARGS() computes the number of arguments by dividing the size of a
> > > temporary int array by sizeof(int). Using the standard ARRAY_SIZE()
> > > macro is the correct way to count array elements in the kernel, and
> > > ARRAY_SIZE() also provides a __must_be_array() compile time check. Th=
ere
> > > are no functional changes. =20
> >
> > ...
> > =20
> > > -#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
> > > +#define NUMARGS(...)  ARRAY_SIZE(((int[]){__VA_ARGS__}))
> > >
> > >  #define write_reg(par, ...)                                         =
   \
> > >       ((par)->fbtftops.write_register(par, NUMARGS(__VA_ARGS__), __VA=
_ARGS__)) =20
> >
> > What is the maximum parameters .write_register() takes in practice in t=
he
> > fbtft drivers? If it's less than or equal to 15, we may use args.h inst=
ead.
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> > =20
>=20
>=20

