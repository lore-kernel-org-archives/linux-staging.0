Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F9C322B89
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768201702; cv=none; b=HRZiI442oUBOSwzep2ib/bRIBL3rLO90xklhxN+m6BTb9UaiePiJWE21LDyscd/W18TGL9y3/cBhNqhzOb8AkXP3fGhuzenCu2mWBFzm8trY7uFSii2S/Nos+6baJrZ8SO2FTD5X+Xuy9QfhKvzZl7oxx3Ru+G6Py5wX9j5S7Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768201702; c=relaxed/simple;
	bh=mBAm1uaioaQGqHopFkT/acZ01rHlHsqYy9cqOpr62vY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+3Zx7VBVUG9RSwzauby3zSzROU1xYOIzhl8myGStckcQBnexFVV95AcyJioZgR2his6Y25OwTP6WogMkUBRLPipUJVouqKqVQHHOnsXrNvUfl6OsBxm3yy79PCqU3qaGrBjVDlHVzTt7pPpeLPDJIu/cPT+k5MYwFkCk2xT2hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBaj7Pyp; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBaj7Pyp"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so9112413a12.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 23:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768201700; x=1768806500; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDtobSm2s3UkTYNtP162SerczReKzDGTa8FA9CeAFBg=;
        b=BBaj7Pyp8zc2viFa5BA+ZOFPkSj1wbMw04/hnbDJBq66eNBVZhOcpsrhpK0QfjgFYx
         SHnepMeDZiSUPSUZiSjpeEsKusGP35syMfm0h9Y+ebl7yoT6P7Usr5bK3rbdmnSl+3i9
         1BXHOkPdfe9TjbEmTyRNwLb7Sr7Y5gCwrufGZ0zq1cKkpmsDmwAT3948U3md8DV7LUoJ
         a12Iw5KrPl4cu9Hs50JjzrAU2zXWUT1JrDmeKl21/CZ2BSsZIFkBzjNRDnfDiVegYrLp
         NQFJSTRXjfBBF1VTkYJx8/FxqULGWlezwHDNH9c0n0nZVBh9PSXNIaJG6MeyhM7v875r
         YCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768201700; x=1768806500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDtobSm2s3UkTYNtP162SerczReKzDGTa8FA9CeAFBg=;
        b=u/q8KcM9H8+g4wLOLFGCkcCPaEKkPKBoYaiGWoHcX3YQ/6IHeB5tokWfta+K7iVWG5
         7+yetSYR6LNpIbmC1bv05A5SNwYTQrMUCEk5+C47G6DTag3ChAGtgrCl6cA434g09UBN
         xrh4CfCyCHTCXTeSgi33jcYNydZrizSwq4n49zrZ6ADH8dfeTb5Rk2MHXs8BLD8yle5g
         tB0hTgu6/ddSDzEEV5T9kBkvxymvCXp737Gzuijyd4BI3JfvM7uyVFXms9G1NEfp27rw
         HC/gflf7L8pBi+lXfAKUEwbDE+dgbYoY/JorrJLEdiK9BYdFb3Pn9XKO6IrD3T1YE2fn
         XidA==
X-Forwarded-Encrypted: i=1; AJvYcCUVywPCz1+OVZDWx0RJ7g+j9uSFrRR2+dCMjePTK3h3TIs/PJ4Ir6uW24N6k8bOm3Rkqj4DI423pJffwOTN@lists.linux.dev
X-Gm-Message-State: AOJu0YyVpN4harG1aFc1RpHbrfjUQDy73Zn4ngH2x4K/JYaOytCzNO0J
	7uQ9hXP7WQgD09JHEAOaTyBF7ixg3H3CFtoIbmL4rcaUJmeLd01jkcH1UYPcxpCry+bxV5/9/rh
	RvoHWRigGNBdrFekKxwerIEueRbK4zlA=
X-Gm-Gg: AY/fxX60tJMlJE1/NCD3XbJesBXX/NKvd9Me0070G263LRam600lZXosFk2852aiq9J
	e23R9Kf5vXWdJC5qP914bC2w613VLD14gkAxgZgPJOwtWb2G7ecdBX+9icgR61XraUAjQaNQTOA
	oGxoHQDeAobg7Ub2mjjpXwwgCAuPPZKtbdURAh8eVcxnIK5KjQ6FtTgl3VtoZRW6ZKJuAoKuRpS
	Qt0CXRBgzrRVNFBPLjMvuak746RuNXoPsqUu+BTJ93Polcu3iI9fT06inzRnPuQxROsLmEcXa7B
	TtAGbLcm8W87l4r64SWgyGGoFrs/vAH5XRzIcrnNcvvKRL8i5Hc9RgrDw5Q01HznMzccHes=
X-Google-Smtp-Source: AGHT+IGpYjqq+pg/XnsC/5GM0k5nhevTAfoh1OMUUjQOBvSBPsf/kZ7p8LloN/33VrzRKiJwU/cvplIIHQUOpkB6aIk=
X-Received: by 2002:a17:907:e106:b0:b84:5927:6ed1 with SMTP id
 a640c23a62f3a-b8459276eefmr841165266b.30.1768201699516; Sun, 11 Jan 2026
 23:08:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112010740.186248-1-chintanlike@gmail.com>
In-Reply-To: <20260112010740.186248-1-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jan 2026 09:07:42 +0200
X-Gm-Features: AZwV_QhOYCW6xjV6nzt8R01WACOin2n1BWUyz1yiKwXq9XWTu9UtzwIoiSzFyuU
Message-ID: <CAHp75VeF+Sj=dxA4RZAvVddGSG3brUsy8kz7mvtst2YpqNm99w@mail.gmail.com>
Subject: Re: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of info->dev
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
	deller@gmx.de, gregkh@linuxfoundation.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 3:07=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:

> This fixes commit
> a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")

Convert to be as Fixes tag instead.

> from my previous v4 series:
> https://patchwork.kernel.org/project/dri-devel/cover/20260107044258.52862=
4-1-chintanlike@gmail.com/

This is unneeded churn in the commit message, also this patch wrongly
marked as v5 that triggered Greg's bot response. You had to number it
as v1, but now please, address the above and below comments and make
it v6 with a Changelog added (explaining changes in v5 and in v6).

> All direct accesses to info->dev or fb_info->dev are replaced with
> dev_of_fbinfo() helper, improving readability and ensuring
> compilation succeeds when CONFIG_FB_DEVICE=3Dn.

...

> @@ -364,8 +364,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, uns=
igned int red,
>  {
>         unsigned int val;
>         int ret =3D 1;
> +       struct device *dev =3D dev_of_fbinfo(info);

Try to keep it in reversed xmas tree order.

...

>  static int fbtft_fb_blank(int blank, struct fb_info *info)
>  {
>         struct fbtft_par *par =3D info->par;
> +       struct device *dev =3D dev_of_fbinfo(info);
>         int ret =3D -EINVAL;

Ditto.

> -       dev_dbg(info->dev, "%s(blank=3D%d)\n",
> +       dev_dbg(dev, "%s(blank=3D%d)\n",
>                 __func__, blank);

Since you are changing it anyway, make it one line.

...

> @@ -739,6 +741,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_inf=
o)
>         char text2[50] =3D "";
>         struct fbtft_par *par =3D fb_info->par;
>         struct spi_device *spi =3D par->spi;
> +       struct device *dev =3D dev_of_fbinfo(fb_info);

Reversed xmas tree order (as much as it's possible with this added line).

--=20
With Best Regards,
Andy Shevchenko
