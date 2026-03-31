Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A259332E141
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963824; cv=pass; b=U8p1ld6oFMQyzxmQMiMaHwitqYC2bscaqeV6Iv1aV/D63kKIdLh9LKOjUaoXxYNiRZpeyzSFvA7c/KnbTBASdYY+Y4tfE1mHhiJctuM6R0vn4GJnUH9Squh4RJkgeTuYdlST5McnOiqsU56R/rZe1z3+wi+bwIsZi+uixnh8Tpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963824; c=relaxed/simple;
	bh=jSfyyttUBcvgqpjRwBnLDE+FGujdOLlOGP5MX23vPkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4IFr5nHY8Sm3m5A75XMCCdX1QfS+mGof9bH6Gd1p+vTfaCjUsg8EAxrc4UuCfOKC20KCJS8LXC9MFvHIRSlVIZVygU8eIilbfSjVf51NGhY6ROa+gmi2KxbLVw6exKJObLJdLN3z4iL9dQoL8/mPYqiqmpRxX5+PVsRvv8xGyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KftuCmGM; arc=pass smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KftuCmGM"
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-5a2853b1f8cso5658773e87.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 06:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774963821; cv=none;
        d=google.com; s=arc-20240605;
        b=B15BtwN/wkq4blBuaWc1wIrd38F3kRVKMTtMIT4HWGfm/MyDf/qKFKNHYQsYFPLzyN
         wS9h5VviDxbZ3QNwgqUzJkDsIwuroWt0tJC1PIMNTvkmOWQ1HeIgXpitHKV/GvWexiEG
         gV4pACxYzseUTgNJ4HX3oCQ8pqLVHNxb3zTt3UY4bLnGRSgFv78MPqb2FpazwEq9amQu
         M7vCHAFoapOOpzW3g3fBe5DlqD4CyH1ZAv2+Opb+hFWA1CyoCFcww+/xuZL6VjeHknIS
         uHhapDDQkEi65TM4A7F45cdu/0p6/RS7/REPIkmBqZ3XG5eEihC2qJwSuz39MzO9Wfrl
         wi9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ETe0QSxwh76AiCkEnZcqenbJmuicOnxgpdv7wSckbN0=;
        fh=/lr6S7zcTs9xHNRCNgKrqPiyLR3muchAlPYNFeF8HOc=;
        b=k/bNwO4leR6qAHtUD/K8vf5GLDZt2VgjEF9luOQNGNjMIuxBMoW2zOPa1lPXvd3Gcf
         zunFjz2bD22GpBC+U1bg9/ktJ7P1cZXNeqvcWmWJ3+wuaTwEa30OcyIRNZK7IZYC2ncM
         Fktl4Bus9C/W77FrPIZSPx86UEVmjkE+VptDRitYxZj++RkiOIXyQw38h8dJ/czuBFRz
         qhHiNdZ1iHez1roZGpZpL5o1C6UbYK9Yunpkg0v3XkGG35TZMrcSO0DfGIUhnyUQWSmv
         D+AkYnwoqvzBT5F3dplGZfWtfnqfDXIhJg7S0IINf9CHyn6MZq6v1MXf2E1ei+0/5mIv
         757Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774963821; x=1775568621; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETe0QSxwh76AiCkEnZcqenbJmuicOnxgpdv7wSckbN0=;
        b=KftuCmGMzS5QNhaQu0HKX84EIIZ511bq8CsYLk/4lFHGq04PjjhDdtwFejtz+Fg6mb
         Kpr9BtCI/ve88UQ+vbIZyJm4lvc2Xj0Esi85I4MEwFurF/g9l2j+Ft6INnhPhByZFhLf
         ORzT9qm49uPq/tYaG5gzdzhydMyFESFVYjd+Q1XKB53bYTw+K224P9xiY9eDKPG1x6CI
         CfynhLl2bQQ/555xe7DtJdoyzSg2x/elK9ktaaB1vJU4OO8lnovXNPb4J+Khpjc0q8uY
         QdZcl4gbNTCyMkr3v67afMJ2nhdsZoH/c9RLUEkV4Zrt8koqYIcEmDGd8IuIPtzhhDAE
         zYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963821; x=1775568621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ETe0QSxwh76AiCkEnZcqenbJmuicOnxgpdv7wSckbN0=;
        b=nSiNh80KeUERdALz4i2qQVZHw5TIcNbPrNv7wtbJX2wY4AaGN8fL7CNFQeDko5Z6ls
         BAMbeFKjLfyZEK71AACG++n4uEZx+SrFVswjOOJeKXrVPOtuyQQYAGgjB8mrpmY1902a
         2TIZjerw9Hwlx+8aqSeAtzHRHTQPfZjStK4JhADQE/GAcUF2FpPHPvg23Kg9qNaqF28I
         I0saAFcpSrh9Im8BcRqSemVnw6KeTFAe59iiHmd+/Ey12303yfEHSu3WaeQ5C8nLLFEJ
         gThVXk7kexG5YMWukHcKnYGdqrCEbfQtb2/49ahyk/QCGNj7ISARaXU9jMMwMyWhcUIX
         VwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1w1yZE7UBZj6qwH1z6Pjbsal7MBA2yS487Lt/7GPMRKrJfQhRuoh7LRwLX4iVNhLA6sxkO3UUirkIlyw0@lists.linux.dev
X-Gm-Message-State: AOJu0YyOsjQpZs99xJgdeTDhMm2tRWfTSn0ToEKxbfDPsNcu5GQ6cXA1
	1YvrenH41VBmI7mJNXHO8WOSa0gHGyrYxhUR42RQ7G4Gn1BszhiE1ce7neFomqXjOqstXLxbDQ1
	ZALVd+jKgIXuOj1ClAm2EYC1OB6K1nag=
X-Gm-Gg: ATEYQzx0rH83aE4F/61KCsY7GBrRN50h7FMZ5TEv5DfF4Jx/OGNic75eA9ySzo8wEsl
	N3Rxk5kNJ0YgwbtLywXT82QRppetCKFed77kSJMno0+g1/TlsNpt1u2zHTHm9CLxeZZvB4x6HFn
	HErfQUW/DOzrSzSdzV5F7o0MjQzc1ZwxMEXQ0hSUd2h2JyBqjjkw0H6H+iReAH0ri3V3PGHlrkm
	jqFezLJFdO3JXutK0bYQzYtp/9h1LIzllXeTG+xC/sJdtJzLeCxQMbFY/0tVI32Km7epwbQ75pw
	j07B9Fm2Bxo7GHk4NPNX6HOaLC1eD3KohKM5NdQp
X-Received: by 2002:a05:6512:1447:10b0:5a2:b0d1:d04e with SMTP id
 2adb3069b0e04-5a2b0d1d1b9mr3160561e87.36.1774963820581; Tue, 31 Mar 2026
 06:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331050738.1547-1-dennylin0707@gmail.com> <2026033116-possibly-reference-7ee1@gregkh>
In-Reply-To: <2026033116-possibly-reference-7ee1@gregkh>
From: Denny Lin <dennylin0707@gmail.com>
Date: Tue, 31 Mar 2026 06:30:08 -0700
X-Gm-Features: AQROBzBsjOcreeVlReST3iP7bntkqTFbh3Nlx0ULx6_8CQHN2eQCKNWEzc_adeA
Message-ID: <CAGEkeHci4UBTqGjE4A7zM2GERLSBFPv3RrQU-nf2ES2VO7jOQw@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: constify static char pointer arrays
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thanks for the reminder. I will make sure to test-build my changes
before submitting patches next time.

Best regards,
Hungyu Lin


On Tue, Mar 31, 2026 at 1:45=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 31, 2026 at 05:07:38AM +0000, Hungyu Lin wrote:
> > The static const char * arrays 'g_fbmode' and 'fix_id' should be
> > defined as 'static const char * const' to make the pointer arrays
> > themselves constant. This allows the compiler to place them in the
> > read-only data section.
> >
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > ---
> >  drivers/staging/sm750fb/sm750.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/=
sm750.c
> > index 9a42a08c8..b0bdfaeca 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -33,7 +33,7 @@
> >  static int g_hwcursor =3D 1;
> >  static int g_noaccel;
> >  static int g_nomtrr;
> > -static const char *g_fbmode[] =3D {NULL, NULL};
> > +static const char * const g_fbmode[] =3D {NULL, NULL};
> >  static const char *g_def_fbmode =3D "1024x768-32@60";
> >  static char *g_settings;
> >  static int g_dualview;
> > @@ -728,7 +728,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, =
int index)
> >               lynx750_ext, NULL, vesa_modes,
> >       };
> >       int cdb[] =3D {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
> > -     static const char *fix_id[2] =3D {
> > +     static const char * const fix_id[2] =3D {
> >               "sm750_fb1", "sm750_fb2",
> >       };
> >
> > --
> > 2.34.1
> >
> >
>
> Please always test-build your changes so you do not get grumpy kernel
> maintainers asking you why you did not test-build your changes :(
>
> thanks,
>
> greg k-h
