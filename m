Received: from mail-lr2-f21.google.com (mail-lr2-f21.google.com [74.125.230.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4F3360EDC
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863446; cv=pass; b=is2caEO1Lj6FXWsGtSSTIvCbD2CEB3akKnY8Ah1lVmc8T3iP7UhpIecG7pxT5sjFbHd+4DNGrzVLA1QLiNStpawU5X93AGSbmCnJ848qgV6kngtkGD8/ZRRnVZqzMeUvtDp43PH5Yf0EDOpFeAfSim8Aq1GV+NWZDvRpqWVRIDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863446; c=relaxed/simple;
	bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKCzPPEStgBkv4XUxG026KQw5J2MOkTRKbAh1cGIEKUWFOhJGGnETuN5kKNBirLNfUIk208MI1JZY/vsbzVNzkZvRrgCXHY7lUsYDOtt2jxaa4FLFBzmEEGyYII+qb95BB9yIXeBCDzL8fAkvDWw6ABZSIz/pzP3AvNz98J0VpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MebMxh2a; arc=pass smtp.client-ip=74.125.230.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MebMxh2a"
Received: by mail-lr2-f21.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso53398801fa.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 07:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790863442; cv=none;
        d=google.com; s=arc-20260327;
        b=rfgVaM1tFFvrFJJicZV07KkpXDnTUWQ/+Nab1gE1d6w1RHKIEAWbjNoNmBw/tJ4vVh
         b1xkDybN1JyejMLK6lBaXJHspM5g6u4ddXZ+bT1vWfzkkuTitEk3ju8qHSXvUAhLceqb
         4WLNWWq9685U+6kbjhoUKcSrAiVskSx1cAG1/v3CpYOgL5ONunLaPmQbmJqWa1MUz90u
         RMhHJrq7ZEOpsMUBdnzxZmoy1Ms6x9igYZNwEaf1q5ZQvmDyxMJ8S1fsj1IQaQg3LAp6
         6OPOzsiP+amryBPiT/jkGxbOuB/O5sAbfGBVQZFQ7CEaj/Xj1F7Da3unyqxqsP9sVSQG
         CYmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
        fh=eC+WkM3YeUksOhsfPyE045ZjQ04ZbqdfCs5uzJznM9Q=;
        b=JJ6siuc2mvb1jxp4pOJZNbJcsezlWOS9+yIYNYhV6oYWd0FueM+8MRP9hcUVA5P56Z
         L3AMmvVeVq/wXHuqi6JLLwH3XMz5pW8XSON+IofFJba5cjFxDU6rwHetkUFNHFZ6i9ul
         xLwUaUIbINykDzcJwBtGbckDZmAAr3AfHsXn3lg/2tSAnNiqIRvoESoHX+/4bPcKjCM/
         UWDekfvvMCRLqrJjLTYMPBRjUDx0Q3Ks3s3I/BdKe8s5IyrJrKBfOU3W0kI27+uSWj5Y
         6hPVPu22LSGP+HOxGknJ6+USOYaCmQSKniHEY3mreIzpRKT6Zv+f3TnkcK3S6IoCTeWL
         8NfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863442; x=1791468242; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
        b=MebMxh2a/2AaLxNS1zUbDK8TpR4UW0JuYtFQa8YmlCFDytkeiK4RNDCFDYf7iJIQul
         HWdhYVpupgAbznZZEbE9BIvEC9N8RIiJaEOB684SrQ+ieI74jEjv6OiOV3pxaDlyddcP
         OmX/6xW5X9HyePv9rzceqkHSosub5ozK5cntlu0cO0q0IMZFunDSMC0wmzzrIZqho/Ex
         I8FutnZRZjW6ag7E29mExmXRK+IYRKlXkTmyUyh5V37triE8j8hZ8+qdU4Ytkl8nr4pV
         kfuK79PdGK+z7Mo1RNWG37OGcgxixa00pBZkDZoNXRXWv6AZuM1s9RXeWQO8ov8eh99Z
         nduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863442; x=1791468242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
        b=eH/SzYkQQYx33BQkFS2SVKsx86LbirLfS+tIl234mqu2gM4eM58ralrWhtSfZsVUqL
         RXrXpX6vuzrKVCGEBxLO3Oo21vfPkmuI+jcDPJnYCiAW48+7Y997Jhsok9muQWrdukkp
         5vuxZR4w9re/Dd2yLcGokec08+ou7FviQAPF/GR6ByLzQ92w4r6Xp4FaMug02h7m8YI2
         K+FtlhzlV8OnrfTFdfgtkTpnXYPsDJg5RX2/aDGv9AMqUA3y/XHKBUMFO0LttuXV8R5C
         DZCLOh/9t/edheidvkE+b7BOEvpkCeinMoP9Wb1AVnRrBq0f5uvK+Dc2y05v4Ni/c/rC
         ks0g==
X-Forwarded-Encrypted: i=1; AKwUvByetd5eRa2IGSKsZGvr0OM9aCnFNzKH3eeRsQ3zyI01YybXlT/riXNc6XepLmWbPqZ6fhopI7V6zx6gxoqE@lists.linux.dev
X-Gm-Message-State: AFq9FYIKgZtYTad/mmacMOIqa0Pgfbf7zg0Tpi8JPLRRv8IyzZj4mrWI
	KnMGtB5/kPCayvcMXAzhLpVdTuCxcdVrZIuCOHc9hJm3iLz6AWZ1AkAZ6/iYuCWP7r89bhRR6B0
	97hpAunkfreVK0Dil5fHC/mB+zSJztMs=
X-Gm-Gg: AYBFou03vobfX5Qmhtn4ahxtgK2U1sxsvov9p5QGWfSJ2PfALpzuowLAIoLIv/OdT5z
	mc6QoiRP8qOgyZ0nfFFCNSawaXAkPier84LyWyrsaFyPt1p/ctZ8aoEz5Ah2CoAYOVGkfPUPH87
	c9XpjzBpYZPGm2FUtDPl4RSZ1ZaatQxQ76RucTyYsgKBgc9j0kBk3gsbc0HWlnq/RtsirMJGOKI
	NdK8yuw0m+1aDTW5QbAHCL6zwfPqFtEDfCPH8WPUmg4u05yv+PTBVL653duaBN7xai+TFqYAy38
	23lQ6aQXt2t3cvpDI9OOYRiXTI2X3Z9v9sKtlHuO6lNqxeoVB1yz6lGS2N2wSmUc3sFpEVWBy+B
	gA+W931KArBXkKCWrALm/G19btoWTEJw6GJrqDa//9nHPalp2VtsUhYfS9ATRfuZgNtFwC+TkJF
	8bjQA1w0F3Ae+aiBoTt/CJLrMwL7I3AaYE+THZCr1Y
X-Received: by 2002:a05:651c:2121:b0:3a6:27ba:be0b with SMTP id
 38308e7fff4ca-3a77928dc6cmr16119671fa.20.1790863442038; Thu, 01 Oct 2026
 07:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001133736.802604-1-tzimmermann@suse.de>
In-Reply-To: <20261001133736.802604-1-tzimmermann@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Oct 2026 17:03:25 +0300
X-Gm-Features: AclHuK-MGGGgGsa7XTJEX30X4AH0rHlA77AtOEFwmZmXzvdKsC2XJRDqSMsLZSA
Message-ID: <CAHp75Vf80MzmPvOK7Qpy99dxoKY1JSiJWM6KUVswoO12LgtuBw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: Remove simple-display pipe
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, decui@microsoft.com, longli@microsoft.com, 
	ssengar@linux.microsoft.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 4:37=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> There are no drivers using struct drm_simple_display_pipe left. Remove
> the related helpers from DRM and clear any TODO items. Hyperv-drm needs
> a minor fix to include some additonal headers.

additional

...

Makes a lot of sense,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
with the spelling fix in the patch 2/2.

--=20
With Best Regards,
Andy Shevchenko
