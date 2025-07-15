Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4862E5B0C
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585853; cv=none; b=llEyL6/JQ4MBY9SWYkkMQgaeMAi9m9OcP677NLjBVXin8ErOQ18DXcIE1LK40opgIpsk68HjTbnvTEkG/HbOlCiEw7agA7tqJ/e7svZ59gKp/hiQNapwyfBpfxeQWgBZPLYpd5jVytKs/2C24fRZFe+X2EENvEQ+kDIHvqzvoJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585853; c=relaxed/simple;
	bh=hJs2Tx12AhStRuVCGZs1ahFFxS9sjYhF28qp/H8h42Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZxaJcCHBfGDT24AmyVsIENHXgIOngGWTnerBbnjTqpTtWsTT8MiK3wArcbaFACJYwiN5DEWUIgTc4IEWmjcgN/iEFpZpDGprbThtErzQTaEEf+XCGsBo/hisnGNxM3mPHaflUenRyqIIZNTjEwf5lOOtnL4moPrxNVsdX7mXQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI9uf8Ar; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI9uf8Ar"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso53105451fa.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 06:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752585849; x=1753190649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puBkZe6ZLP/QGTaKOMgF9k4UNRq2jZxxdkE9m753KvA=;
        b=OI9uf8Arzd7xtIUmzPIKRKJ6Y7TCM/w7Wgoo1uvFWwZjwyS2oOGDICdiBo7ggo57Hk
         8ub2iEqseIjkEBOARObpJcCrZbhylvdBz6gr0FiSVKE7VPl+uPOGg5OK9cg11+H9kJx/
         vOR/pfPQiCvSw8AO0S9sqwL75iRY8G9xXNt9W2PHUmkdxJ8UxDz1cMTQI/RewFvJx2qf
         ymDEdZVcea0wxp/YCr7bHxkurL2EM+nFrPsp0fuf50ag1LMSWXTXSwOUHfO94jS0dQBd
         T1H+ywXZHYnMeezp5Ry150KafMY+KBcXZ7j7nwkZrh1zTCVvl8c6M3H4XV1VHnf1fDqW
         fiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585849; x=1753190649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puBkZe6ZLP/QGTaKOMgF9k4UNRq2jZxxdkE9m753KvA=;
        b=vyhux5ak21ePBV1pn87xnMaXT7EIBkCNvFv7JI0NGO6sodhylR1yExJeOnDyi8TIKY
         BdB5YxRa7JlqL5e2/bkWo3UotVPNcptRPp1rkcL/dOPOQacSQ3XGAgOWvhFU7018ts7c
         ENqXi55QIt1xpZDhmqFdkcjbEVLIUew9IyZNkyWWWexrDcpyc5TEAiluvFhSYKyVOHim
         Y4uXHCHxelR5Jn48mi2/lAKhSVtUB1hBTtbWVlpeUWKPJvwGf8sn2u0HSH/44G0HZ8jk
         lk8tKUN3pGJx+3Vs2V9tOfIjl7CZrUPo0zH+PXgq89idwtFu93/85kmLg/GIQbWghrjq
         3pXw==
X-Forwarded-Encrypted: i=1; AJvYcCUIY3aU69Lf2hgGFcTDuyk47VA+lHDSJAFi1t93hrajZy25KcjnBgbTVpYUncg1MGAXo6xcKZFnUrPq12aE@lists.linux.dev
X-Gm-Message-State: AOJu0YzuAYGSZACJdnWvt4niUnzAaOJRom3y/0T191rI8xSDVh+W5+T/
	18T74fongHurkqAXxmpkLdgMwxyyXUEeJZ6c1/lemw9WmlLCf+Coae2nW5jco0dS6lXloNNPdTE
	XUpEmz1kPCBbtZz0cPQv855PcsqXqaxk=
X-Gm-Gg: ASbGnctmKQg7KTBKX4DFZwQ4KFszOcLvaCDVuZdGWlVYR8qkleC3c6sBAKgJTRLfr+M
	rG2eUJ5Yavd08J6povJsUJt9GgJZZKnG2ybf6cPKkvNjWlT0mEJ0XvqKZcF5fSoxFsq3E7dJGM1
	jB72vQHq3dYW0nyZvNCXYaVFgpYTLObG2rlrQDicbpYdXTdGOLyJk2aaYpMz1OQoHIXduWw/xZr
	ak6EmEGWA==
X-Google-Smtp-Source: AGHT+IHyhgM9GTkj6ufKA4ysSb28NiNtRNmpxfHePlNkbW+SDylrwHOU1wSPErQE40fSVHRPCwqv5mVSW0wvtXQD2qo=
X-Received: by 2002:a2e:a984:0:b0:329:136e:300f with SMTP id
 38308e7fff4ca-330811fd7ddmr10104531fa.13.1752585848880; Tue, 15 Jul 2025
 06:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250715121839.12987-1-shjy180909@gmail.com> <PN3P287MB1829790FCBF0CFF1F06585728B57A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB1829790FCBF0CFF1F06585728B57A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Jul 2025 16:23:31 +0300
X-Gm-Features: Ac12FXw4aZaN7rnjjlU4zPnr7LEkkyd1A8yPGqxz66xL1FgOMiNDSbYD9CZrEbs
Message-ID: <CAHp75VcxKhz_+Kb4Y1qdrYKLrSBEEC0n77ptddSe4TVVtk18-g@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: fix trailing block comment style
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Michelle Jin <shjy180909@gmail.com>, "andy@kernel.org" <andy@kernel.org>, 
	"hansg@kernel.org" <hansg@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, 
	"lkcamp/patches@lists.sr.ht" <lkcamp/patches@lists.sr.ht>, "koike@igalia.com" <koike@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 4:11=E2=80=AFPM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:

...

> >         /* Sensor driver fills ch_id with the id
> > -          of the virtual channel. */
> > +        * of the virtual channel.
> > +        */
>
> Preferred line length is 80 columns, so I guess.

Yes.

> you can write it in a single line.

/*
 * Also note that the correct
 * multi-line comment style is
 * in this example (with wider lines, of course).
 */

--=20
With Best Regards,
Andy Shevchenko
