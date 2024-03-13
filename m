Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA464A93
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 17:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710351864; cv=none; b=tvhsYi4qYKa1dLLZNLDoCEnDHyouaYHjJToaMvtNg7dwZ2IjfF9VFPifCL7zPa+c7ansA4Qp7Sc4aNFUHq1xr9xhIDCljX+rYOWKs8u8eYSagxlxPAd0aPT/EigbbmhkqvGA9az1++j8bV8TaFkSWFk3qZFAOYXBTSOTSChDpD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710351864; c=relaxed/simple;
	bh=hCUUui1NbQfp/vSqXOMgH0Aw3ATqns8Rr34Fh87bhTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zf1bnoGppkOuhPhA/4Sbc+AEeMfp+6FlsmCEzYaAypL1bT0qmAOr1SAfCk1dUSPbDi8vUmz4XpOYibY5RpOlPGZpCXc4UioN5UmqwbwqgDCNp9+drNEsWGodAWhwP+vubC4oW4keqeLIc/YYXoAniH+xv7PMvbGMNAmiGSbwuKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuuuoWFf; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuuuoWFf"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso56593a12.2
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 10:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351862; x=1710956662; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCUUui1NbQfp/vSqXOMgH0Aw3ATqns8Rr34Fh87bhTI=;
        b=QuuuoWFfcrOfD7d7xYI6l06PloB6v6gLeTba/N8MTZZKzOjkiv8TKq21yM+MHEKd+T
         Qu11ktEWZEtmR69W2MioLUyoPorEULIjomWvHC12jz+OiCetB5kPY4AoAOYPi7tPVAPQ
         eZZOY1upBq3ARFpilNupyr4u44+hKMPd5f1HYnbrdpotSXO1J91L3iHFKA7igrS4ii0D
         TO4qKzhj5m7Tj2axJazENDWN0TGLxNc2u21NhodK15x6+2S9CM+EIW55sP+8nJyNCgKw
         FP2FMexHZixwvsnZJ9F0NqOdoY5z35WCMEb5M+QhqW9gsvwYMmk7IM1mKOFN52TBu5Nh
         Ypbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351862; x=1710956662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCUUui1NbQfp/vSqXOMgH0Aw3ATqns8Rr34Fh87bhTI=;
        b=n0r6HPY2m6EqVxbW+bl1aVGWh2SCNG7znakLVL9yONybeRmq9vffCMtCsoo1lvxe7X
         uYcTWBu0hynC65NF6AcHUewJMYY7X2YvyJzWDYdYZiLagnbEERArxbJYevoX0djlSelb
         4gePzLscTsUW3jOdlep8G2m66LxuPZjI2Wle9nVOHyj35MCBQv+Q4TNqWkacH3s89xr9
         5XWMdWmtCv6BC5sPqzJeidtmpYv17hKqKSr4omolqoRgL23Bb9iPJ3dpzjWkzloRcqQA
         NZhsjhqexlPxa2oxip47vEpimNvmv1rSaMTvmMP82auGUhOEOBN61Yx5eBKBd8boPBWs
         oImw==
X-Forwarded-Encrypted: i=1; AJvYcCUVjT7A3Apc+4YarVBz1iLKz/7ejteoPkdURbPtQ0fugrCDniHLLJTKF6GhGj3aNZaYZaIloEk7Hmq7q+8CKY17Hgyg8Me55eJehZpIUQ==
X-Gm-Message-State: AOJu0Yx6qE8pdq2orwZP33rChEcvVlWqx4cmGgDInhyC9CJE8VaMvTc2
	GbEWxC7P3sVMZ/kY4pTQo9eud1dp/ZfkqoUNrUhJ85Bgfyo7YE87kjoA9OTYTQLFDjvyAK4Sdgp
	JgXhJU/AWoluM+HTjqUjVdhP94zs=
X-Google-Smtp-Source: AGHT+IF9f9pLaLdPeTSCtAhybglIyQQ2XIUnjYf9d7DmVSyCMeubFDXCZGcM00CwqQ2KUlRJTxsSfizN1sbtkt9PlhI=
X-Received: by 2002:a17:90b:4c81:b0:29c:71d2:ac2a with SMTP id
 my1-20020a17090b4c8100b0029c71d2ac2amr806844pjb.18.1710351861647; Wed, 13 Mar
 2024 10:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240313154857.12949-1-tzimmermann@suse.de> <20240313154857.12949-2-tzimmermann@suse.de>
 <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com> <03ea1afa-e54b-4f31-bf07-03d9cdbacaea@moroto.mountain>
In-Reply-To: <03ea1afa-e54b-4f31-bf07-03d9cdbacaea@moroto.mountain>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Mar 2024 18:44:08 +0100
Message-ID: <CANiq72kJj+Mz6QAMuk7y-OeymWZKo9K9ccXaRwR2r0AkHmeKdw@mail.gmail.com>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, lee@kernel.org, daniel.thompson@linaro.org, 
	jingoohan1@gmail.com, deller@gmx.de, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 6:11=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Is there an advantage to making this const?

Not much in this case -- it is more about trying to be const-correct
where possible.

Cheers,
Miguel
