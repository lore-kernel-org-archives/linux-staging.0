Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF012848BE
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 08:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202746; cv=pass; b=MBzhGRv9B0MI+KVcFAzrX6qkkX8XUmvVOr45q4xf3wyIpfr7wmoRuGZmcJ8BrOXNBJUEfQVd/L3E4CfhMS0noIn4cphK7Oir4du1I5jO8GFCRg1h/k0bZvPTaQWN5hF4/mN9PeXxeKEr1rHRkvXgTU0tiTZkbpF88sxJzMhsXvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202746; c=relaxed/simple;
	bh=0bCfr+h8nU4CHU+FxY/CGtAAVk5QFy0QtF+IZerCQHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFFi8Mm6gkkhnupFuiXpQLN8DDAErwlKi1TjTxXABsopfdv9xyt/wcW6nvt+rQjLVTMNGwmtGFvjrtgc8PsL4cnIWn2d14hATxSGH+xt1JKjSzgini587drNaC+/LIeVeIspjanPxZ8XVxW8tVDbKwpjzLc3daROpCabzZ656ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k46AX2Zn; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k46AX2Zn"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6974a6e54dbso7035142a12.2
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 01:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782202743; cv=none;
        d=google.com; s=arc-20240605;
        b=Mo/b/IQ7kloxmC0Db/h0pFm1F114I6x8KsxQzRj2HPuxKmB2uzJg5T5sUKd9kzT5l9
         Wru0ix49RmRQknukAM39lj7X2R3XHa3zVHILb4QqogSsSogCPmTFvpgER2at2Uk3ROwr
         Z0KjZAzSsTeqgsYCR1bRW7hPLxhO44ZsxNdRiM9A6t0H/FlSTutfFi5Z16Bg+rSDMNcp
         xIkipejwJNJPm0QFfZBXvimI4UHybehGIeSRk3OqD2AOUV5MG34Ax239RnTfZeNz719X
         3AzhZhVoRV8jrCd1gZ0MRivBZBCtyYOO20St4VGlzWA9ircc94KxOPzzNKoAL8yqQboW
         8Faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0bCfr+h8nU4CHU+FxY/CGtAAVk5QFy0QtF+IZerCQHI=;
        fh=3rqhzgKepD+Kbt47TIBB0PsV9Gcl5e9PmYoDcAH8ATg=;
        b=RnqbL9weWi921s0FIns/EuFNU41XhDNli3R5SndzTUaI3di8OU1dpbix7NPo2dT7+w
         O65kyc1ooVlgB68I1FcPmygD9YKX3IqtZNfaDPU9y7uYkWKZhLPzUbUlXr+NKAxWVJUZ
         SmT2PBgASsTU0yXR7ETLcAuIrNGBVJJrwduD0UhPqrNH6gJAVqTLtOCXBIdWGGJKSZL6
         b+HBT9QjM8DerVR95unZ74VuzAGvqspD6cUQJcjfWrmaexMAUPftDOhy2LrY5pfzaLK9
         acfAMlGfSLWLLtKrLFFV0GSvbUOEVMkHn+v1QO2zjMJx8roDsItciFuSsdPW0AiATLji
         T5qA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782202743; x=1782807543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bCfr+h8nU4CHU+FxY/CGtAAVk5QFy0QtF+IZerCQHI=;
        b=k46AX2Znnd+F+AvrZYzlASlLnYfvFeHv43aG5HZ5hsqHRi59RBqYqU6tgMnrh0KWBj
         nkaYWcNSBHwtFXp+pJ14A3aX13jpyZn+fkqH0uwH51dr8awzCEjlE/nyIVEJ2iysKh7h
         YcDph7c17O4T6jykK4HpOsToHc3xVIBUhQmDNeTiGEg8SFLxyZaKiwwalCvItpqvPgTb
         8R/wW0ktuIy9fTq5Mo3eM5uWXufn3jiTqIwxBQlSThdqqQUlIwDQ8mhj2NE012dM0726
         Zvw8CoTYLk0N/9LIMkmPLBGHSFTNwrVu7NDthpnKuyglEsEo1Ri+/vrC+vsyGicdOlJH
         hfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782202743; x=1782807543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0bCfr+h8nU4CHU+FxY/CGtAAVk5QFy0QtF+IZerCQHI=;
        b=ZAX9237NvFnxgI/9lbSeOLQF8B27XpfXm+whAi2j58LRq2ulyOW4SD6N8EgtiY7U75
         bcAMAsimqr49VEZVMrMdfShbwFkI1WtUyeUn6FdrHyaA8Tj2/Oh71skzB6INClxi3+qh
         j4BnIl/b9kujGZPOqkuCogb7dRtGf/qXDRVzWjGKQw1iJUAA8M8PzDOhQbPFXBaeF70h
         fydawrkWwkn8DEFa9FTZ0ufP4VW0lbDdFZlTzXrw/od0LTlaNk+zyYEX8mQN6SFxFl+m
         zg0Z0qiHbJ00Yx4ntznQbPIzjs5uEPS6L0uvKHiM+iONOlyyGglBOBX61Rq3B5X1irnt
         dR9w==
X-Gm-Message-State: AOJu0YwND9+HAze9ouSy1EssmHcVhIMF/siFJb8LkENiQNrZ0Fq3xzAs
	eLBIABQaiQk4EqeowyUMcDkBcpsucyHTdpJWdp+Zg41SDzmX6BTDUNPs5mFm9bx+TbQoYoNZE9V
	B5nn+UfiiYVm+xl3sh/+TD+oJXF4ziPA=
X-Gm-Gg: AfdE7clxaEZbqd5/ewjkZwP2XezOgS3XWGD8dtfppqqmMxuwWwbrN3pG4wW29UsI1Jq
	53K4D8de9dqX7h38FrcyYbNXGlWwMxtGhOub3CDQreOR40ddToiV/UmYvUl5kEp+dzdXG8EOX9e
	uSm+l6A5LgrGQMuzVs+LhllwimalpymryYrS1FlrtwDQiNBNxfO3Q+SvTEYpmdkPWywFxh/3lfN
	c7sufXT/4jiFd1BeC5tPguKOTxBojG9qUo8H0wqSsWsustb+pfPbsBKHzQqkwTSLa3e2TKeAkOj
	PjKlAdrBZEih77skf/R8bh6ZNR5Y7BIvx51pWytHqbJGis6cRUQbxlI1jeTX9FkGua6XBlawjNk
	6RdWVHZyHomyjSwwYFwiF8qx/oQxziuPKSco663qwBSCc01I5TGSgRguFJ89m0EQ0AEs7
X-Received: by 2002:a17:907:a0a:b0:bd9:20b:5117 with SMTP id
 a640c23a62f3a-c097cccb107mr992933366b.41.1782202742824; Tue, 23 Jun 2026
 01:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623054627.62422-1-amch9605@gmail.com>
In-Reply-To: <20260623054627.62422-1-amch9605@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 23 Jun 2026 11:18:26 +0300
X-Gm-Features: AVVi8Ce-q1EuN7J3XoitatS8upOzDv64U6n-u5hn22bRpRAsmQf_sK0BBLoYxPA
Message-ID: <CAHp75VcOo3=U_FJc_Mpfwq=oxAo_LkmsEG+CbLCr65w8SYSkKw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: use %s with __func__ in debug messages
To: Ambar Chakravartty <amch9605@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 8:47=E2=80=AFAM Ambar Chakravartty <amch9605@gmail.=
com> wrote:
>
> This patch fixes the following checkpatch.pl warning:
> Prefer using '"%s...", __func__' to using 'ia_css_bayer_io_config',
> this function's name, in a strin

No, please read the linux-media mailing list archives regarding this
driver and recent (past few months) submissions.

--=20
With Best Regards,
Andy Shevchenko
