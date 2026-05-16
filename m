Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D7F3D0C03
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931567; cv=pass; b=h+gK7icmybaILseB4cc5fQkKpZ10NNLTc98KI6El4KI0TL/SMRzmggdKkC+23ZunpY9gwe8TKCRlpcmWDZQBrIN9fxGy1xMmjYd/yVsFGVCjVLw1LsSawinudoNe77MGR6ZL5cF8TolOFasrpgUshybL2b7Kl4rhinReEER5EAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931567; c=relaxed/simple;
	bh=FYYfC/hOhdh8EbY52w2KJNymag5x9unu+DlSgXuKipE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQ0xl8S95WSKHg5+dhGMxvEQp5z0aDAOUAstDPwfIh4YC99S+bnjZ48LpPHSiLfHiVcqf0hiUscya5LoQ6oOZCTUOZS6gJAvSZr/4pRTakZs1yZoTXbEEdZr0Z4XqHOQC8ofbIo7M/wk6/7K9bcGN0Zybc5bn3SKvOP3LsFg9Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pA/9G/CH; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pA/9G/CH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bb91b426e40so166154966b.0
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 04:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778931564; cv=none;
        d=google.com; s=arc-20240605;
        b=WGnckW2PWyovmgvKZE0yLerxyT1mgjuOTYDkhH8SpiJgeZdnv+EeqFM8m37Hmbm3Or
         lMzxG4z4fro6w++tQCkw11QutUGcuLlLdDHIIO6vqVaUIO40a1kU4/JnI2NaWvZNunbU
         20o5Nd9ZBkaEWQuk3K+XnsyWuWrdgZ88fvFrFnJDpCj0HWPN+mGsJfaED8PGMwbg6KS/
         Fl3/c+lDp/4j6PpdZYJxAEM+Q124Ltni8CqqM5jkSSObwfJgtY9L3HvaZBjeJA0sxFg0
         rQG+cfxjuW0mBLCS6kZnC5qksFi6P/Oj3eDuNcDNIYr8xYu578IC0CUD0atnIeh+3F2E
         napg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8t4wyZzmNxkLLqFf38BCIUasZFi2QqT6CS2DVTmEATw=;
        fh=rTV2zpgVckS4maaU0cvPpJGsch/UVDg1qn2+5GZh3TE=;
        b=SpM3cmEu7NQyRVnlOhh+Vt5zlLi08Pip++OnOAKCTB8R3+FLIhAvtcj5BkgKKdzusT
         GAMmGw1Dgg5doUJUr0/eErbFNwj+enHCxwb/IpkGOF+XsYlYl7wTfE1xtv9ZA4ZloBzR
         2Wd0hg70pnTxiy0JyWGtyGjdA9nCSOqHZeTXcFKX5qnJHywSYRrfWmLJ66UHH1dGcuVV
         hAtT5EX7XTTAOM4vwEt9AtVXFQkGh6CmNxuyOAx9cURfdteU8yCnPDbDpsGec2wfNwZn
         MWILuIcqFoGmJW4ZAMvTZ96A3q85lXKdqAXFyvFslIIy1NkXRz0tZ/9FzEPP6xetDC15
         orzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778931564; x=1779536364; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t4wyZzmNxkLLqFf38BCIUasZFi2QqT6CS2DVTmEATw=;
        b=pA/9G/CHLejTke1U2DzZ2DGbAa2wWU2XwkRa5x4YTjAES5x7BQ8uXI3cJ67RTK3hwF
         ULXJbuK3QDo5VAa48/RsloatYB28f7HBy9Bbb79VUVWco62/13I1y8WpAcu9P11vtkDy
         7+u2IUJ8pjIR6O6lkv2dy4IF0p4HNudDsbIJ/K0ujJJ7BC+dnAoPTSZLoFKIaAKeZAvT
         kKXdfD+SsFqrpbVoxeawWjNg9rmwDr6QQLNOxvaMeEVXOQdPSl9m3AtRL6q9c7riC8Sy
         7TIgsDI+ECf+ZleUQsnb3TPRWLEG+u/mnHrTXhUvf0EcMFZodW/PeDd/S5ZZAHKKN4Gb
         P5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778931564; x=1779536364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8t4wyZzmNxkLLqFf38BCIUasZFi2QqT6CS2DVTmEATw=;
        b=Xn0XYhb9tVYAUtgxzb+jYKEIPwFiR8xs/lfDRAUkKlu3Ewt+znVj36PMhRGHBUUDlF
         +hZv+8APMl8MAF8rH2KSpQvR4O0SzS97YwZf1GyiD3equQakTjqGEdUeWNJUODQ8p5C5
         ZcaVFyR8zFpFAilqH5QJeevVY2qruh8Yw+2SKDjiQnoNkffzhCZj/wyzdbqB6jeKe3pc
         rocdIG4fgKzAiHg/FIUW36Ce9IcxCStQulahBQMUnsMPyUgTxGjb23Y3Zoy7LCqDKRRM
         Fvp3nV98ylBCHB3v1lzReLf1Doy3GHy3P7T6vt8/jMyQ+iB3i8g4G2CXQw+zJDfaEKmM
         Kv0w==
X-Gm-Message-State: AOJu0YzfHo9ALMZA/rmw6erTb+gJhddUAu5FWoqsZZ/PperrfVNk5bMO
	foRA056jjJAcxiw+0z26n+gjARRe4TD14frp6nf4wCucou5REem2ZEjKNTeom+M/XLKYObfx2zt
	GoTajx4zmYy9qbgnHZFtFwcDbmSDVC1Y=
X-Gm-Gg: Acq92OEDoApbfEuTPUVJRrYwRm74DTLmHE6IDWhhKVqCxVeC5IHOO7kHL2JMrGtQNPU
	PRAGubIUC2smET5RovOzvGDmXFjEYxH2CmKvJIBgveSXDRmeD4aQVPK9L1IdUQs9J3tDPBsikz3
	i37c9vrWt7GtNcsiJrkgAXnATVpMcuVgsZXi6oEPbrkZgsjyRHzFIiKTYy5qFQN+XxXA9pJ7jD5
	SxAKkaM7RIJK3LWZbeXxTyfNxfCHaGsKkWCp8G3BElmxu+2CgLvtA+ABKVII4Gp8/X8uidSetUq
	IK9A+DS+Jxr7Wtnl+3+4dZNHpYYMgSvDFGrdWW0Am0JB+SF/oKmaxVDAguHGFaaYGlPQR2NvFIZ
	C/bmYqZyd
X-Received: by 2002:a17:907:94c8:b0:bab:d8e9:53a7 with SMTP id
 a640c23a62f3a-bd5178fa6eemr379971966b.29.1778931564247; Sat, 16 May 2026
 04:39:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516095103.12727-1-mokshpanicker.7@gmail.com>
 <20260516095103.12727-2-mokshpanicker.7@gmail.com> <aghEK3CCbfhYQ-T8@stanley.mountain>
In-Reply-To: <aghEK3CCbfhYQ-T8@stanley.mountain>
From: Moksh Panicker <mokshpanicker.7@gmail.com>
Date: Sat, 16 May 2026 11:39:11 +0000
X-Gm-Features: AVHnY4IHbQcJQ7X7F9TIVXnFdsOxQLb-37vY99fUUDUHt9FO9x5V9aofndnqN_U
Message-ID: <CAK0z5OmNfPf_zS0RpmNBJtusN_Mxavs7UeUOjV7j7wrqb6hwow@mail.gmail.com>
Subject: Re: [PATCH 2/4] staging: rtl8723bs: add braces to else clause in rtw_efuse.c
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Apologies for sending it twice. That was due to a mistake in my
send workflow which I have since corrected. I will make sure to
compile test before submitting future patches.

Moksh


On Sat, May 16, 2026 at 10:17=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Sat, May 16, 2026 at 09:51:02AM +0000, Moksh Panicker wrote:
> > Add missing braces to the else clause to satisfy the coding style
> > requirement that both arms of an if/else statement use braces.
> >
> > Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_efuse.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_efuse.c
> > index 987d05816c5c..2be74f2d4ac8 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > @@ -73,7 +73,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16=
 Address)
> >                               break;
> >               }
> >               return rtw_read8(Adapter, EFUSE_CTRL);
> > -     } else
> > +     } else {
> >               return 0xFF;
> >
> >  } /* rtw_efuse_read_1_byte */
>
> Always compile test your code.  Also why did you send this patch
> twice?
>
> regards,
> dan carpenter
>
