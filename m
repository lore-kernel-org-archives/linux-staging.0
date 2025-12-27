Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F4314B70
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845432; cv=none; b=qrmXqDijw0Yww42yGHXOGXPv8UwRiAiQn7X+BvCkDBA3xHU5Cu/8HJ2zecV1yiRpddeCrDjOU4mdpCyMXpXZ0VYXM6nPEAcgfHc1MZ/5HWVvui2tpZpk7ZMuVUK436TM2vpYtYZD4L541TujO2b+PEH1qPd/CJowlX/FGQAq9Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845432; c=relaxed/simple;
	bh=Tu3i4WlFX0wkjQWqS49NrgqXIOcBQ6oEp6NKqAmVAWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZHn0WsyNlz4LGv7GNyqhcmSPo2lxFQ50Tls9Dc/DMKN2sFpndxuPh/MY0v1tAYSbknKBPi4vN2kuFiiALPLMwLGVHOcuqLmsyyiLKYoh0p5c7g4QFbeb+5ad5No1w7MKlkN0EowzU1/0IuViZMcjvgXqivjajV7vem7tmRPsWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3fH6SMx; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3fH6SMx"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64b9d01e473so10629677a12.2
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 06:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766845429; x=1767450229; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tu3i4WlFX0wkjQWqS49NrgqXIOcBQ6oEp6NKqAmVAWk=;
        b=A3fH6SMxXBIaVgIasoCFj2XV+CpWvDrv23sNdJdVkHO6Q1rNYQuhMFGTK7QLi9TvET
         J2penM8qkXxtuuO2MVGLDs3ARNosowRmvo55MTwoVS1lXWmKhgmzh4mzI3bb5EZgNCfo
         /1faADJoNcB4o9hGpXWjiRyGOg0Y0DISB+SBPzh08NKGJeZwdcgGbk0oDsL7KBt0eJsb
         WRFEWCxfvYhluyC4JfoIKzctPttENbscxEe4SoLfOiPpkgmfwTztHRSdUam3petYisAA
         Teza5BvN70X2iVTB1YtvGifoDAW2aIkgnQZELQgL+G0DFxDokDlrdbtCKWwQZLKeFkti
         Dxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845429; x=1767450229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tu3i4WlFX0wkjQWqS49NrgqXIOcBQ6oEp6NKqAmVAWk=;
        b=sGXiRBWBrTfwD8XpYJx2koZejchGSBRoD/3EB73OOI/g5mtTOAIBf5q5jHJM9Bcl/Y
         jUVayi9oUVHLr8gT4aAl5ujN/a+bHs3rOAQPjEexfrYBLawSM8O0cF2GTnK5sGveGi4c
         RESZvSnIRd4BHvnemHnh8MWQojFP+zvcK4Qx//n9+0huog3W79430r895KAjlhAxxBfQ
         DXX0cl0GuWwqa1Tfxec58U2qwhqm30hpDUcXuXI3i51Q/MesKW7bvJCOLvi3uwtU+CPT
         gr/ltnjXLP0+51VDlpUud0jZ6fPe/afqbhOr1fXqTWY4CwmRV33efHlAld9iRUwrAVP1
         04EA==
X-Forwarded-Encrypted: i=1; AJvYcCWij2Q3VabFj1LqsUuXeCO4Y84rKy8jjKfFT3xzSjGGoeyog/Vf2+/Te/1KMOMWVuqT0vifHyutpxjxxkqE@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg6cbBLum9miFd77XqQ2sPpFGyCKRXO6o4NMo2orsRzBPGG8wq
	Fn1xj7Uv+aIXpJ6AX19Fe2zIQ8dNz0NOMu110Axou/urDoerXYnrQyI/4RhFn/OPT4D+Bsvyfu2
	fVpE1494s8K77/iLiKv3Pfm9oZk1XkSE=
X-Gm-Gg: AY/fxX4JzPstYcQhXl3aNdm5cI7EDtDRnVNsyeTxuoSk+80e17yx3Bf1x5h8rYiI68y
	zCGMuPtdSQkt4LbbrXsT5gKmYmSoa/5wnztj14L2BLFUcISLYZDJrY/pBMQsbn04Dhy97PC4sbs
	O8aG0ULJHMKxLH+G9gx88y80Dj39x9XZHQOSlpaLsIwxUv5Z85DF++lymROc5bFQwT/8rHLEXhr
	frYob19AKWhRhjS142jnRP7kTjU7i8JdSEHopIgBNizp87Vj5q8Bl8W/v+eZMmT2mInTLtCKmr5
	qzhRFXJwGqWn7qJ8vr8AtaZMHvcCl9nROTDmhcQ0oOAQMnhTIh1Gw4+Z9Gc3osD9yFIFN3I=
X-Google-Smtp-Source: AGHT+IEI+L27X3VYBwtvTtbD//tUK1cqRstOGm0x8A+wsW6Dy/BBoKlQjPvPMQaVva0Dsb4BJJYbeSNL+99aFRZdUpk=
X-Received: by 2002:a17:907:2da0:b0:b73:5958:7e6c with SMTP id
 a640c23a62f3a-b8036f0add4mr2974716566b.3.1766845428952; Sat, 27 Dec 2025
 06:23:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com> <20251219054320.447281-2-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-2-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:23:12 +0200
X-Gm-Features: AQt7F2oJx9_5rStc5In55eyBv3lfUDojQOUDP7FelHM31gT78_xqzMu7r2M2phQ
Message-ID: <CAHp75VcumPK00xv4R1XKOspTf-8G76dmx16BG3y5G=tJ5v_b4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs support
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
	deller@gmx.de, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 7:43=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> Add dev_of_fbinfo() to return the framebuffer struct device when
> CONFIG_FB_DEVICE is enabled, or NULL otherwise.
>
> This allows fbdev drivers to use sysfs interfaces via runtime checks
> instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
> remaining fully buildable.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
