Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557733E8C4B
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 16:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778950708; cv=pass; b=WFwD4u/GYfn92Vo+sF1Xcgo42EFPTbVDzF0YgiMO4APg4ZTzVAFjivQuIFY+n4M4LpR0C0aEkRUv3BUv/Z+o0IM5+NM0TGo+LrPDyOk9rwWiqV5vOOOKOUVNviuXZpdRcEr+7vzXvt6YY1izknEb4V44AiQ3L02M0x0P0El+uWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778950708; c=relaxed/simple;
	bh=iKUgEAIfmSThXr6nZ4P3qY72kwc4xLvMm8QmCCKmcy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fymBeRdNBPofVfo2enczbYGf7MxRwFmmN82AYKjwVPC81yZJEFen8WNwAh+bmxJrmL+DSFrUMitcGW0poa2AemPRTRPSatNt7qjZjnmLZTZCgMxbfMUUqjio+W2ijPE/v/oTFR3yOgbdmntqEkZoJ9ik8z68dA6LOuBHP7Mdz7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1gv4ia8; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1gv4ia8"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso1672047a12.2
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 09:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778950706; cv=none;
        d=google.com; s=arc-20240605;
        b=RCRoF8vvH2akbiQ6GeaMnkkDI3kmmtPFkp0LKKJY5bIJqKF+qL0EF+dzikdjgCjZT/
         JLj1LG9KAz2YXLUG0gMrbAWmOHheWHJOyzIVTgMj1E2SejUgTbhxSnBWrdEXL08B/U8A
         dGN/dY+X3Ghy3nXqlvp2bIlVhZusUvog/CNItegEITwCLI9Z59bsnFVIAnPMEkVe6MVx
         UQmi7cgwggSvuSwGxA5fopCSssHCkB6HDzEKiYU/l4s08RtMC/1vdN46ABSnG+LVRQ83
         pm1yl6JvIkZNhMXeg20UVYv8laW64gSqGayzZ5kcWf9pLLZLrliUGNcYsKdmH71Aoc/7
         J15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QGaK8XWGNcoD9UCHd0QXR0fe6aXMaP7i46VLOL1iDw0=;
        fh=aiRgke59QYld/DSa/j8l1wlchb1kvrkKH6Buc13EUOw=;
        b=GDIsRSdjXu7TW3f5ntrILKOlJCkApUIQEal1HPNqphsg5ptOmlIfX7zmJT+Nmmv5LL
         sCvu5e2SfpnoWQfEkAXzU/o1WoVBLjtSCUutvappGzyJg0QMNyIvHoWHIRUABgC+HP8v
         bRA13UR3JhJjqWqX4NETQUjxqnkkLbHibfSK62xncCzRd0o/1XeE51fac7RmGRgJVbqq
         gm9nu4B8gcT6WHh8Kn+qvKI36NQ9pmRQ43WL4lq68I7uGxAKmvzzcqslXP5bqYqgRTrK
         8r0RdehuxLjpiaU8oqOpkKdQNa2lTAmVaWbi/2aJA/PiE/UAMHOV+Cfd3nNBbOT+6h2y
         jQQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778950706; x=1779555506; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGaK8XWGNcoD9UCHd0QXR0fe6aXMaP7i46VLOL1iDw0=;
        b=e1gv4ia8jfkQlT8j39Ax/uuBiIyIkbX6soNnUfb3+1sMsWtjqyfqIk9TKHbn2oHZkH
         q1F6z7ZptAH30lfH4O3RI0ifr+BnyLzZpz9AsEdJOMFUorHdjRqYxF/NQoZ/mDgZE8JY
         JTjN2AXVb0XP8r3HpyPTac2M2uSsQLiKQ5asj442XlpDmg8KerKlZhZRtYPWVgSANP4N
         tLtduoyTAE/hffBUxUN6XFLj+3Iu0ysUeMAT4hvJXI6+i8/GWwh/AAUYhT69LvFPkvrR
         zW2IvLwZWeYz3XFr71GL7W29sEgoejhsOexe1CN8jzVHL7rlHP7GfHzDGT42C0QpkIYz
         M5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778950706; x=1779555506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QGaK8XWGNcoD9UCHd0QXR0fe6aXMaP7i46VLOL1iDw0=;
        b=DcbadvpgFCrK2Vsmdv42bKP/Q9Wn+p+ftTAxmAjxYOgbuNJJ1028S3BJBY1DIswhYx
         lyud3QOGnnSOMK6Ij8wfYRH3gkMCWxxsiNlPRz8BnbWiliQiYpHJDK5h2JR95we+Nb6s
         V8wyNZA7vu6n7bmmCdaHjJ+qnwukzIwqnRGReurrpLAwnGNVASZUteVBMT80snwKw1Gp
         Ob0CSMpvGprAiBzTQ4lHhTqc79hUJIfWOPIsmoCW92bqfHcdau71uppuABgO2JL3zuVl
         99op2GkwoBYWYx42mnvlE4FEHp0s/Y8rm72AmfQ3wOiaW9xhhKRk6KXrAYtypA+6a73R
         6crg==
X-Gm-Message-State: AOJu0Yw59Z/x56zjy1MDViQ57eJYoMidDfFqfbqpZ6vaRnROpURGsXty
	nKwEAxoKUUujCzuZPEEigIKvbMfy6HS3Sh7SCZvmDqdG2fkdb7W9AHkJfP7G5Sk/bzRL39wvggL
	XykRupF1g48qSNx3M5+DxMIEePxSS+yX9ngxsOxU=
X-Gm-Gg: Acq92OGEeLhCvGBDq2R0lOJxjoIpicsi5aCIPr12vTnUuRW7tDlnnLcGljTpLgFPOvb
	qkmszSP3x+BgHDvoxkwh2NivSvH4KsCC/pNn3K+YhVr+8v8fKnhFtMHzwBhf96oZA3/twJftelk
	FDe/S1roms/69Zr1onJTEHYgNmr2FT8CzKFkC/ursn9F/OAzZ3Yfh1ull6/5N5k22iuxbIQMeKm
	p4RwDhIgh2bbDNR6/gc1Ndp+4xwv6XD/xHdcb3GuDfm58zKyc90TQs/RXbyz8+QGEcj755tdA0i
	1YFvaiWgbJ5m55Nc7DTwvHT+jkdArhRRGHzvHzyBrmqrz1F1bFJsAdBhRVDMR2CdVme2zf7lkCs
	53kfuuJg1
X-Received: by 2002:a05:6402:1945:b0:67c:a6d1:c48b with SMTP id
 4fb4d7f45d1cf-683bc8ac76dmr3910524a12.11.1778950705332; Sat, 16 May 2026
 09:58:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
 <20260516155025.230865-5-mokshpanicker.7@gmail.com> <2026051608-snowcap-shield-56f3@gregkh>
In-Reply-To: <2026051608-snowcap-shield-56f3@gregkh>
From: Moksh Panicker <mokshpanicker.7@gmail.com>
Date: Sat, 16 May 2026 16:58:12 +0000
X-Gm-Features: AVHnY4KnRGWdXeER8wBxWUek2_7mEjQ95VTd0WWOrpIwt_MTdPTO2Tr--05VW1w
Message-ID: <CAK0z5OnJOZ66ZH=h+4H1uCRF6HmL0zUM5emLvgcPULVWQ9whww@mail.gmail.com>
Subject: Re: [PATCH 4/4] staging: rtl8723bs: fix missing brace in rtw_efuse_read_1_byte
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Greg. I=E2=80=99ll re-check the series carefully, run checkpatch on
each patch, and resend only after confirming the patches make sense.

On Sat, May 16, 2026 at 4:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, May 16, 2026 at 03:50:25PM +0000, Moksh Panicker wrote:
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_efuse.c
> > index ef0cec40d388..a9bbfe2d6fb2 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > @@ -75,8 +75,8 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16=
 Address)
> >               return rtw_read8(Adapter, EFUSE_CTRL);
> >       } else {
> >               return 0xFF;
> > -
> > -} /* rtw_efuse_read_1_byte */
> > +     }
> > +}/* rtw_efuse_read_1_byte */
> >
> >  /*  11/16/2008 MH Read one byte from real Efuse. */
> >  u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *dat=
a)
> > --
> > 2.34.1
> >
> >
>
> This really does not look correct at all...
>
> Take some time, work on this again, and resend the series to yourself to
> see what they look like and if they make any sense or not.
>
> (hint, checkpatch should have complained about this one...)
>
> thanks,
>
> greg k-h
