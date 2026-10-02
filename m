Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131FD3ED5C7
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929394; cv=pass; b=NlISbYGy21wNjw1o7uM3bLxrRyP08BzX8n6v04GKG5c1e7gx7O4vaEWzJahuAfOKS43SiZG1Od4a0WoDa2BvQuJ1N6V8gUxOg1Vfy4QU6ghgDDAmtf+EC8Y/v9rMKL0pULX33BZodwgB2Tf5PU3NANbMO4xtlF2BmlyWm0A0s6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929394; c=relaxed/simple;
	bh=m82XSMNTiLgC95D6B78sYDiC94k+qp/Rz1jZL0ad/lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsPe0zhw7nS7tGGbz4VX8pJwefH0sZHtw45CBHhBidepJ1je4TerLdsTquQmWHZv30nthitQ4K/bt+YTRzpbtGMrIjkuZNomSn8A9oSokDZbsMsmJYqxVKaPg6MH1mVZ2c6LpYpbC2EKa4BVpJGLUSpu8dCgEz9ydJFqJQYuODY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyuevRBW; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyuevRBW"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so1141101166b.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929391; cv=none;
        d=google.com; s=arc-20260327;
        b=i4VnJEqFKYfJgRRD8SwDizt5/lCqdTEiPc0O8EuM4wD9NZif5LIhRiMXu0rdMlJiPC
         f5yBLazBJz/WXoEB8ITt4xZmjn28V1OIb8se4CpYkNh641zry8IuNNfwOjluKuBVgDk4
         W44cj9dnukGRmcNWAJ9QJftwKk5td24gxsaja+7Va6yOkGmdl4bOmS0qPEqRmb9kGJJt
         zLpjS0fmPgIP9tdDTxjBD9lUnufK5Hu5gs/kd2VU/PFrw+ldUeaZkCEctCKBvytwG3jh
         +ARaftw6/SzuZtXGpWTabPQnDnaUCyTD+oVJxN8cCDGnL4Yvy1X4Jf3jkXr1G+AoyPnb
         RGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qtouuun/tbyI61TUwPZhkjhbB6nZifAWeutrTpGNCnw=;
        fh=i49jJ3Zm5xorUKqbwTpOd17hHi95sp1C61mvLYEsZ3o=;
        b=lmiBfD0wrivm+IKpecN42WVkmsvvFj+ei/doPEGR205mFi8rsyTpNrVYSxaIjFbiBt
         0y1PAnS82O1Sb0kQciCmY7skUV0/8+tSjHGh0vX4KJAHY/VzABxRghuPyWj2anGf93p/
         si4VGzhGUy4TYgyvkke2Fj5d5fuamsaY5hHx2ItLJfefj+DSZjmNz3RWxG89wUcrK3ZB
         K8rSAW8FHI6MIcwNgIXFAO4puW4hqxa9A/dokAKoJqFnvRp7RYGoDq6Ow9KH5w+M1aH6
         jtDbmqGSBSVJd4kNT2C31YDd6nuixJJjStxnzLCzXwQncd3yPZ1xY4rky0ktgXWrRr9z
         KbWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929391; x=1791534191; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qtouuun/tbyI61TUwPZhkjhbB6nZifAWeutrTpGNCnw=;
        b=RyuevRBWpnat+wJyxn2r2uAf/LJEEZsbKwujWnMEFu7ep7376F/z3RX40R2mFpYUwE
         rUyKo0CtDsC8cAgdVl1Xf6hjpYQGs0C0qPC0Zx6fIsLzae1l3nXwiadDkNHkGu0HTSek
         BJhlrgqEf3JSfdnR2tI0eV6zzXAGOPiIS4d7NmjOZ6fMoQipSrfdnsfC9hCGXxVFdxje
         W0XX7Vl/YtnZhvrV2EsN9oS7S4CWJ1dw8TLFA2GenP14oKU1xSVAICStAp1KcQ4+F5UA
         jwFmoy78rIRVpdHywNCeDbWR18XZP/kIP4CDSazO6zpGCIbO1JscMRVxe7cpc1C7Nrz7
         Mgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929391; x=1791534191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qtouuun/tbyI61TUwPZhkjhbB6nZifAWeutrTpGNCnw=;
        b=2juZEGTbi0YxmP0uUsg4qngv4a+hBqWZBCunZcBr+Y/qFuVsZNILNqwxB7to1l65An
         NVW34wD6XKi+1+He6EgnjGjVwK4aYh2SU1br4AHcrLa2dFki3/PTBlFSsNwf/S9jfdBB
         rzNCvbs0bLcE8lCplucIhihNpSPqz+EqPPuimR9UjZKnaz8qV8b6mSHknovaAH7kPBiZ
         KSbUw85maHipI202mgq/6/9HAMsahDNJY950V3IJMbWyuCkDipCOIZr60CXFZmH1yZsZ
         kZd6JSyRlimVlqJ7wyLwZYL/PD1qCegnUDw5a88yHyO9dMaFoxCli1ci5aN2DisZH4I5
         iPmA==
X-Forwarded-Encrypted: i=1; AKwUvBx5QsWNQURAcEgOXnRBxFbE2yksmNmFKaBWGDVk82ov4XRnDQWfpRD/Pmtt3WjGzQuK5HcpY6pk4njofcmH@lists.linux.dev
X-Gm-Message-State: AFuF++m0wjj8VYYMvs0qUv4+D+12oZKi+ztgbwJWzvaRotm02U6BDuSD
	PE+cOEjnZPLM98Ewk0iD7G5VI7IVcfq9UOQ3DTCIq2gRDPV61UTdJnJROaoHFyGAC/z5Hr+S66W
	WqSV2AS6RccpGhf0PKIDpTozMJxEXbp4=
X-Gm-Gg: AYBFou3JCasZm2r8nYIPKS5Fmjy6J6gtexd1yYqy7IRh88olTK1LEDpUfYFQJqr9UJK
	kU4BkyvUIE2Kp0QhBxWDNWb798qAMb7r3mtH5QAWqpRikCd8wuOT23KwnL6qFpgIaNn7pyOy4hg
	omipNCmZkxJJqiAdWvbFsKYz+CHf9dB2bTWX5Np/yj1zZ0EVQEzLS6YbKw66WdnC1Wa9EHwsP7z
	xuVcxxFO2vnOniFStUz7sYZx8fA7h0pm8T6UYG1h1zTaMIwAemkcbkDOomuCIFmDNbx9QFXLWec
	OYzEu2NbDEfwGBtESKQ1bQPqcrRiBuDaLXfVlhsxGMQbkOeD11k1cuf4N1JRw90SOUEQjTCZZHS
	g3GjX9JmZ9kAYB2UZQ29aiC9MCHOs1l+5TQ98RTpnO4Q1HttpjKJjc0yQYM4ZCqpZuM4/UJMrip
	1632FCvJa9vhbsChpE6G606YoYlNMzm9gE+a3s7UfAK2CAWTScX/vG
X-Received: by 2002:a17:907:5c7:b0:c29:f5d5:5a9c with SMTP id
 a640c23a62f3a-c2e4b241d7fmr137425766b.38.1790929391172; Fri, 02 Oct 2026
 01:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
 <CAO7O_xjcw60io6maT2J_dPOxMcAe5k_=u6UCuo59nsd_0W+4xw@mail.gmail.com>
In-Reply-To: <CAO7O_xjcw60io6maT2J_dPOxMcAe5k_=u6UCuo59nsd_0W+4xw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Oct 2026 11:22:35 +0300
X-Gm-Features: AclHuK_S5b7kz2s_hkF12XOALWuj04SzAGhc0YKCIgdaLJIkJrUOPC2GCBhIOzI
Message-ID: <CAHp75VdeXCDBpvsom2YokbS2QbbCzrGGf_NXYdLFTq3cLeam_g@mail.gmail.com>
Subject: Re: [PATCH v8 02/15] media: ov8858: support 19.2 MHz clock and manual
 white balance
To: mauriziocasciano7@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 11:17=E2=80=AFAM <mauriziocasciano7@gmail.com> wrote=
:
>
> Support both 19.2 MHz and 24 MHz input clocks. Move the PLL and
> global-timing registers out of the common mode tables and select register
> settings for the detected revision, lane count, input clock and 360 MHz
> link frequency when starting the stream. Use the actual input-clock rate
> when calculating the reset delay.
>
> Add standard red and blue balance controls for the sensor's manual white
> balance registers. V4L2 defines red and blue balance relative to green bu=
t
> does not define a standard green-balance control, so keep green at unity.
> Accumulate errors while programming all three channels.
>
> The manual white-balance register definitions and programming follow
> Intel's GPL-2.0 OV5670 driver, so retain its 2017 Intel copyright notice.

...

> -#define OV8858_LINK_FREQ               360000000U
> -#define OV8858_XVCLK_FREQ              24000000
> +#define OV8858_LINK_FREQ               (360 * HZ_PER_MHZ)
> +#define OV8858_XVCLK_FREQ_24MHZ                (24 * HZ_PER_MHZ)
> +#define OV8858_XVCLK_FREQ_19_2MHZ      (19200 * HZ_PER_KHZ)


Sakari, you see, still inconsistent. If we really want to use
multipliers for XVCLK, I would prefer to see the same one, so 24000 *
HZ_PER_KHZ.

...

> +/* Keep input-clock programming separate from the common sensor setup. *=
/
> +static const struct regval ov8858_24mhz_360mhz_r1a_2lane[] =3D {
> +       {0x0302, 0x1e},
> +       {0x0303, 0x00},
> +       {0x0304, 0x03},
> +       {0x030e, 0x00},
> +       {0x030f, 0x09},
> +       {0x0312, 0x01},
> +       {0x031e, 0x0c},
> +       {0x4837, 0x16},

> +       {REG_NULL, 0x00},

Please, drop trailing commas in the terminator entries, like above.

> +};

--=20
With Best Regards,
Andy Shevchenko
