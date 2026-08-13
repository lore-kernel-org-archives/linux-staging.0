Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D63C46E01E
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 20:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654334; cv=pass; b=nx/WeoHd2JcX6KDZKggYZsvK06AEJ4WLniZkPQdDu5ZMH6pVlFdXZtirnvYQAswU4jk2gVHju1LvgWAokrIR1W/Sygy4NzTTIiiRKCQ9jQ9v/4CYkRmQPmKc4rN+CjWs6TzbIT4c0XMGL7Kbs9F/e1UzzlyEF5Na/2ll9ctBC7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654334; c=relaxed/simple;
	bh=fG15OhH2dzYlb4DsYjWF9/Cq0WDCMyRgsw5enN5N+IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HppVU4ZTW3H+cEL8D82ReDI38LaMF3LmB8X/ZC0O5qZyZN/ArheMiEHMh/ag+jcMUZscWPxBd2wKNW5goiZlfFyrc/58EVNNWFQ89ARwd9CGDF0xn1TscV4JboSAR+RsD+Oru/0cJjYjabsPEAnkb/YxkU7b6ZBCTBGxAD6mTRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJZraorh; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJZraorh"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so2442034a12.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 13:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786654325; cv=none;
        d=google.com; s=arc-20260327;
        b=GwzcgW+gQRKApNBM2Z/LSzVVi8AYWHou2Gtc5XZlSVmfL92nuyyeQb2uLY1F/iDOXC
         xYHqmFDoJStIeuFfiZ0IFkzAAdQZOSYC/fqczPi5zmlYmwW5Vt+RUidnI6B5/k+/Xukk
         x6PZSQGL9ZQvggXd1lKRDpzmDpvRIEoqEy5mo1k6I1+VDJfolqUVHCzkMDA6SP5dkA/4
         XnrqnZ6o6Zic9bFhHK1jiFHLyz8nv+04wGlUW4rB1bp+PKA+XxuBJx1S2McJf4n0w8kM
         /Zkun9IaOg1kn+SanNa3hpAXrlrnl9ngONn1OITd0JMNK2hlZPeCmIF2rJgHNrZgMECj
         HvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PmkC/SC0r1DtEmc1lwjFEmmXFkt8QZi8W/yEFPQjw4s=;
        fh=tSWasuqls/IoqxtIGiOIym0ZQZdStRs3SoFuJ8JrW20=;
        b=lrZUKGXwEphjcs9cvXHLNh1b+w7otvCi+VnAwE/ELZIkswUBlUfOWnaWM7jWYLghd5
         whyUlfuWmKJUf1rUZz38v9GbW0UQErPSF7Cu1XWsCKNxZQw1qKGkttAaiwcJkbftTL1P
         omGY6ZKX0XWUa9jHhTTCMQ84NgJ+1as1Qu7pFAqro9iOn9TrMRkTPWMEOehrAdnS7vr6
         SOVXMcIb/pHpI5e4ct0TLywJQd3PjpshCVhuM/iezD7gaYAmqdonbA4JIIZGJkTXoKoe
         P01zHaDVrlLngu28jDahZbfVtq753R1Hnw4CQ9OzUaS84aFw8+h/botO9mAiBDfiGqji
         AvjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786654325; x=1787259125; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmkC/SC0r1DtEmc1lwjFEmmXFkt8QZi8W/yEFPQjw4s=;
        b=FJZraorh0bnhgkmDvig+kEdA4YTayoTlYDfMacTOOe/AGvdpUmqGRWon5excj8V6uS
         cdSAIeLPg4u+PHMHh1CYKTi5MULMOzfg1+Nd3w9NvEKcn59KEzZBRC4iQHSjFWOtGAFN
         TtMC36pXsmAOED0K8qzih6EyAnHK+A0fDHJ1cIPubUo6lBc9KitmdDgQ8FKsIDTZcivY
         ZNRP6kgqlKRE4UftJGx/QHvduk271UKLK8wyuOhezqXqoGrsx/QXagd/yLs/Ogacn1n0
         nBKfJptWyrjuFpbg08ZHPDqcYRpbB8/wlmPgsM4WRnj9HsSorWuK9yZ6ywj1eGaFwC/C
         VLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786654325; x=1787259125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmkC/SC0r1DtEmc1lwjFEmmXFkt8QZi8W/yEFPQjw4s=;
        b=iqUc54qFsgAByqDrPo0W7cj9CiryFOJxlCvuTKX3F+BTN6dnu0UMFcSzUj3ADOfC0t
         yYGM0NN/Z4TJM2IK8mzgSVEYpv1IyXqsosbXqFgRdNtoRl2CGTacR0jJ97E0bylqEDdT
         FaqnbkmV9ZtqJLXcL+sB2dePmKOGAWrqS/ZjgSdFCGwfkM3zanTqLirXCPPUGWTu4AfG
         z9S4E2q2iBH1Gu3aT50T2+4FmyGEajMV5QbRWN0UToHhFBJFImPFe99hZXDf/YvjNU1R
         63SK0rqVDE+2fUJ9oAUKFejtg50sKm493DdbKAE4pRfybt5sJxbFJ7tWrbtnarNbLKB/
         WgpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGI4MkBj7Yvu0lmOODCF81BFKD2IlLNAnpgYlgNa5umYVIziEv1uBehFNLkmKdC5HB4+/YxIKnDKxP5xr/@lists.linux.dev
X-Gm-Message-State: AOJu0YxeMKLsO53pMEPUzhkfxcMISo6V02fd04F+ASPZORAsIBn47GKA
	FvxDxU8BnpcexiDKTAjrAzvuMl7z3NbhMb7RoLLUMH1CugRseKbjlnHrhlr3V6+dKCXBgoRI970
	yGGnd39tmfIU6C3TZ+qWsiPuMwQC/tdI=
X-Gm-Gg: AR+sD11qK8kNGywY267m0ka6Nbkn9vv0CdDGzxkjynh/Uco1WTR/rm+nLJMIMvMUBDX
	4PLrWbo97ZL+koxMFc91MM5xy2TIChYD+FheI3PRYtBqcFC/cMtKFlUvyh8ZppQR+/vCIaJk6dS
	r2QEcKWHJ/kt8R0UgBq1yLpNz2gWCCapicNeegwmfCbVT1T9otrMwAXx6m1geQ8nPCE4GBV3y+j
	Ut+hCSOxMa/u15dEjPiXCfsyz7EkiLehsqU4ouWJLi6FwJhRyupUUY3YoENMaMs/HCNE8yYyKd9
	kOV6Gvz+UQgPCahYmISd7SR2/qQLDjycFl/R0iVQXy1t1H6jwS0YR2SvffcAzzetwd8vN/jF+LK
	tMH0sa52J8AU1TqBHpiP0IFH+6DGSGHyoVVdUrqRDphZhAKOXEYkvJGshOKPHElw3ReLd8RKeQ/
	Pb03KjBZ4TTCnnGK0LYbSXmPgNtZoyyg==
X-Received: by 2002:a17:907:d0f:b0:c08:580e:899a with SMTP id
 a640c23a62f3a-c212aa1d477mr42443966b.10.1786654325049; Thu, 13 Aug 2026
 13:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813-atomisp-fix-typo-aswell-v1-1-0aaf45422cf2.ref@yahoo.pl> <20260813-atomisp-fix-typo-aswell-v1-1-0aaf45422cf2@yahoo.pl>
In-Reply-To: <20260813-atomisp-fix-typo-aswell-v1-1-0aaf45422cf2@yahoo.pl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Aug 2026 23:51:27 +0300
X-Gm-Features: AUfX_mx_N9ZWgbNi1dwZpb3gSmsLHwluWxGJpTXUDWD9v7tdmrgt_mbDYd9pLdY
Message-ID: <CAHp75VfzB=kkU5996wMh5mjsVLMw8r15ENs9Hp+H1H5He1q9BQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix typo in refcount.c comment
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 7:59=E2=80=AFPM Tomasz Unger <tomasz.unger@yahoo.pl=
> wrote:
>
> Fix 'aswell' typo to 'as well' in a TODO comment describing
> refcount support for memory types other than ia_css_ptr. Only
> the spelling is corrected; the TODO item itself is unchanged
> and still needs to be addressed separately.

...

> -/* TODO: enable for other memory aswell
> +/* TODO: enable for other memory as well
>          now only for ia_css_ptr */

It's still okay to make it either a single-line comment, or use the
proper style for multi-line comments. On top of that I think it's not
a single spelling mistake in that driver. Have you had a chance to
check for the rest?

--=20
With Best Regards,
Andy Shevchenko
