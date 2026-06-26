Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF9C3E7159
	for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782464285; cv=pass; b=lwc+Hzxxy6CAKtwnzvzHB0vOpA0MUKe5eM0rr9cPUHnGOd01fQGRrr+hB5n/jBs5xpAYRrXXXIlMHEuyFZvuwoIJus/N7C/QcXXW7yLwRSZVmLCJaNzJOZ+DC+Z61NrAQ45KmKtElH3ChzQdO+6QvEK1PkhxStqZ0qd/CZlj8m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782464285; c=relaxed/simple;
	bh=eXPcTw6phZ3ErZ9f/k0W/VATMdFxJLWfecMrfpJUEZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lT0UtXeOyHbozQK3Jg+Nj3iQtgfVJcwsvXru7qclQ6+Wnv3BPWfPiFW9I14VbYxguf6IY1RHggl4Xtyh7imgGXw+zSTBy57EKlMzzAIRVX/eNOyuqXJuZOOexKX06H1l8X1nXQgrQ35X6xUyVOVTtxLir5K4djzoi1J5dUbR6+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmD6/gZK; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmD6/gZK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b613a17bso6767025e9.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 01:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782464282; cv=none;
        d=google.com; s=arc-20260327;
        b=k3kWB0Dn8rEQS4B2tKJP1zTozCPaB529UhfcboyWDiKp1vkvCn7+4Um9jBXmbyGW85
         Bcy/lww7MOr9gF2w9KpdsnTgzB+7volTyspI0jeItTNUFenIHXy78jPqSAiLYFQUc8jr
         H6oqoK/NalCZXv9MrYZyT/3DoByS79Ad+alDScKSZA88M4fhqU2Tfm4TzCO/6A5HhTmd
         Dm0mgFF/IM/dOrnO58BWvsTbB7cmwhmxlFrM+SLnEOfDp/ShfuQVidZcmF7CM5X7ztTc
         /UKQzfGhJFpBJBTyVgKyQg68JI30VKvq4Pu+tAyMF7nYQ25LF0gXURhqm1OLacnlLLpd
         q4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8mr5BrX28M83c3h69JR5BGflOmg3dbIBV6JMrnAWs44=;
        fh=V82Mu3SEyhAOrFUs3nL4xgtmorButOnVDZ6V3iamv6U=;
        b=OPDejIW8gKR9jbI7PE99hml/Q6KQk2zjQwBI0WglnIGZgZmNwXco2TYq3tOMiiDm3J
         v9x1VttTbaahzPlMExPnCgZskTMPiAYRuKVSdUNdIIoZb+72gEBIwKyPyVgXfHMqLUzc
         TkA+v+XCSV3wa0esVsjVxHRK7w+FyzlEqkrtQXC5ZJvBzEl90Qe+MAMTC33nyZhFcQaE
         tR3VuGN3bK2Us+ojO+Noqor/XNil1nyj+T+oW4bPYvSuZCFafR3aXopn2Ad6GzXDiZ3M
         UtHWDUfA4tLJXFdEN39Jrij1GyRMgL9qiVH4OQca/IQyvx9ZrWSO+HN//cIZJDi/1kD3
         OVYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782464282; x=1783069082; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mr5BrX28M83c3h69JR5BGflOmg3dbIBV6JMrnAWs44=;
        b=AmD6/gZKEGhdaJsuLoER9QhYcnOHetHQpiqthFM87lxPuXTO0hlQykgHr9YJoAqq5n
         LqmAJ94wT0uhdTAsL2V3WqvaI2GeFTS+2hAS5iS4B0R7zpQF/PvMbrv3QLnVymScYsTj
         yNmSju/9UmttCriJPDoDNolkNdZJQOs65KM9pHCdB03I1/yry1ayYNlrBsISx6zS5OCa
         aRs5QOPXMWpmq0AS/3bjjHEuFQ1boBzSHefl0QjRdRD2gN615eJpO0OL3Jmq7Ovb1u7f
         leenhb6YTvQ2cMlSUx1AZc1cgoxxtpkik+My0z1BQ6A+Xh2faCHsuw+Ric1vZKP9oVUj
         BuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782464282; x=1783069082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8mr5BrX28M83c3h69JR5BGflOmg3dbIBV6JMrnAWs44=;
        b=aKiAAD5iHkio1rMc9P7Fj+eblaizHXZ2Q8WLtT5CRnWNwjUyHtKBPOxtOCF8yOd3u0
         BTcj3O+4I7tqzHx596bWshAIgukamnWxyXzts2PuPyyBXZnqPKkEPT3AFbnZGVcCNKYq
         iLTNkkSalbJllkP50tPbmjBSWjj0i3cNflcR5EAuFDGAyHwDxbTXAdFLJ3AKiY5hxhPe
         HIt/SNMs1SfLWXyvzjM3l2FV8bV8oHoTjhJl1gNI4drD5zd8nP4JMLmfaUGlLII9WV9E
         qHBTbup0D+j8+r09zmzlvZW51drFGxK8aFSe6BwVEJ5XcR1UfP+OfghDKFY/7xZIkbF/
         qE3g==
X-Forwarded-Encrypted: i=1; AFNElJ+Cspy8rFH3RVItGcyG8zKZUwf+jPLY/bxIiSZMJ7mlvg1LHr/Q4H54vI4Xlgw4FvpD3OT2FH9tknvySMiW@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkxr4SLiGocfnN4sR5nEix0IXD6ZIXPjPgq2IAMKCnlDOUKyZm
	2c0AS4vDPFE0A4kJQ6T6qeXvuOW4qc4YgiFfVvxA9N2HQlGpIC3qJZbLvXdZpn+Dp2kNixnwgWx
	sleUmmIGCpFEvCJGQXQ0JmwJHI7WWYEI=
X-Gm-Gg: AfdE7clPsqgCadu6QR2eHCy4w6BNcFtBR7MaOL4VTEw71kwTee5pkBgBIX4Y4c9j00W
	o5j6bo8PmkO06WVBxoMrhoJHA25uF3FlgL+IiLQqxUb8BZYbBCmyrK3MvA5qW74KpRnLgKRlgOE
	uOgQ0XPJKL0FLRaYQXtJFbaGDL33uzOTmu7X4DYr6qgPIeskcygIQFVdaKfF2VXqgasWpfdHqpz
	9ayK4AK/rPTZHAt+q0uyaH9iehHJ+T3Q6L1Selyzoty70cYUOhJAjffzG8pGVsAmnriHIy6/g==
X-Received: by 2002:a05:600c:8115:b0:492:6df7:942a with SMTP id
 5b1f17b1804b1-4926df7967dmr10375035e9.11.1782464282163; Fri, 26 Jun 2026
 01:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624073804.4391-1-joyetamdk@gmail.com> <ajvAGK-0kCfkThcs@ashevche-desk.local>
In-Reply-To: <ajvAGK-0kCfkThcs@ashevche-desk.local>
From: Joyeta Modak <joyetamdk@gmail.com>
Date: Fri, 26 Jun 2026 14:27:25 +0530
X-Gm-Features: AVVi8CewQ_sfNVDDCLAMxVIytH13-ftRD2ntaqkp8BztMQTvv7FNCKdpjmypRE4
Message-ID: <CAN3JnUCem3Mw17e5D9b-aX58_ZaAvC6GZ-sBPEQfTTTP=o-WHA@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: use ARRAY_SIZE() in NUMARGS macro
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the feedback and the question.

I checked every write_reg() across all fbtft drivers and found that
the largest number of arguments is 129 in write_reg(par,
MIPI_DCS_WRITE_LUT,...)
As COUNT_ARGS() in args.h only supports up to 15, it is not a safe fit here=
.

However, the kernel test robot reported a problem with my
implementation as the __must_be_array() check in ARRAY_SIZE() requires
the array to be a compile time constant expression and thus breaks the
call at several places.(example par->bgr)

I tried to reproduce this locally on my system using both GCC and
Clang with ARCH=3Dum on x86_64 but could not reproduce the build
failure.

Since the original sizeof() based approach had no such errors flagged,
I am thinking of dropping the ARRAY_SIZE() approach.

Any other feedback is appreciated. Thanks again.

On Wed, Jun 24, 2026 at 5:01=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Jun 24, 2026 at 01:08:04PM +0530, Joyeta Modak wrote:
> > NUMARGS() computes the number of arguments by dividing the size of a
> > temporary int array by sizeof(int). Using the standard ARRAY_SIZE()
> > macro is the correct way to count array elements in the kernel, and
> > ARRAY_SIZE() also provides a __must_be_array() compile time check. Ther=
e
> > are no functional changes.
>
> ...
>
> > -#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
> > +#define NUMARGS(...)  ARRAY_SIZE(((int[]){__VA_ARGS__}))
> >
> >  #define write_reg(par, ...)                                           =
 \
> >       ((par)->fbtftops.write_register(par, NUMARGS(__VA_ARGS__), __VA_A=
RGS__))
>
> What is the maximum parameters .write_register() takes in practice in the
> fbtft drivers? If it's less than or equal to 15, we may use args.h instea=
d.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
Regards,
Joyeta Modak
