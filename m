Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5723262D29
	for <linux-staging@lists.linux.dev>; Thu,  8 May 2025 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693493; cv=none; b=h274KBAbVOz7MhF2Q4gfoQi/mHkmMLdzIhG5qIC2LBV6BOqXjAoMVYwoIw9gkLBCtvrGhcq5lk6oEwVGPiJZei4kwsaYtxXs59cKuYDDYyCRdcYrti81u8eMYgSlU9NS2q1dylaQ8CVD17Mb9U2iTEzp/2mInVLu8zA9Dz1CYmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693493; c=relaxed/simple;
	bh=iiQFIztHrq36O9I/yuxgb2y2SBf7ToGaPplZyPSc/Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QypMG/pxPHz50qvLg7Qq851Mg1H62CItAOzqLd/CeNR0iJibRJCi5FNwowKaEtZK3L+sAYZQCBsswbKR/IBCPzqXnrmDC5IWcSq+KEVSywWzas+1j0OCQ7IbEqiR5iUvlXplJat0SB/FFdXBJljoaBhbrt1Exa6ZYqLsHOxo/4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buZyne0O; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buZyne0O"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb415dd8faso113129666b.2
        for <linux-staging@lists.linux.dev>; Thu, 08 May 2025 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746693489; x=1747298289; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiQFIztHrq36O9I/yuxgb2y2SBf7ToGaPplZyPSc/Qw=;
        b=buZyne0O8X2ApQz5U313yDKx/y0nsWL3jI4X3fsb9TqhEIVMDYxMS5ucdfwVefJs4T
         BsyZmBwXis47YI4dl9dc2F6ierDHJBHPklm98bMyOw8tK3Bae2LIgd7fiNqmKWmuBEcK
         BqAoVbV8OSg32on1rbbr75+jfQ1tdSCSD/A/SmQ9GN/XFORB46s3bLUtLwGzGokLiFnq
         77nXbp5315IeFg20qY8SCOVgCYojvea/DCNcKIK6BguKzE3GywTIPOCSh4Os8bh7rQMk
         /7SH5j9LZwVAOdnSD7kzQeOd3V/hbV3I0bMjHyb089Hy5DUUMp3SAGfIOKaqNA2Gl4/H
         ttag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693489; x=1747298289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiQFIztHrq36O9I/yuxgb2y2SBf7ToGaPplZyPSc/Qw=;
        b=KN7rBFjRei65tCB87FyRgbBC/3RklgQqTGC22hd+KZPsWfhQZsHvCKpe1/K6xrCP7x
         27ZlItZerMws2h9ol59MJflIPn888cF88ncUwFM0E7+I4rEJIxv/xs3PGE7AM5m+dBkP
         Rd8GRc7IvVQKzayaBKu2028Fu4DpbGy/KUPj9kMXghF/8C1SwQP1SBvAxI7pS2FBj/Zg
         uXm5zOr5M7J5geQbY7FnBsKz4ZcZP5RoYwbndHAzclo70CrMs52Zm3ZWKXZwi13+Hwnf
         z/40fFIyaqxBV4KADY2qTWt4yM6iyYlYPHdoddPB042PFIlXPeyj1Y7qlyqxFr6XwcfL
         YWAA==
X-Forwarded-Encrypted: i=1; AJvYcCXrlI4cPDgMi0QbC2JmqhYYYEFBaRoIjs38eVL4cp2YKg0xpauF204bN2vjCUIzz7NUtFtbWK39QIXU0yMT@lists.linux.dev
X-Gm-Message-State: AOJu0Ywro5HUDAh/Yj72Hm7rr3UGXkEgEDr9dio1qX0YrVOccBXZDK22
	gRHaTwH8AyDXuSSdaECIplD0jmHiPtR+jQvkRA4LvaYYiMryaYb2M6FocBD6pngq/H+rYo47Lmj
	fF4+syAAaAIUttW/VVgt4jDu6ZMk=
X-Gm-Gg: ASbGncuOpOv8jrgZafIE8y3mzjlV9AeDEGrPCT8Gfl+JcMP3VCTk3nw2dJbcfqNGoWm
	hl88trCqS6rl1GQWd6Oa0tP/PP0gIlk91RnvX6Fp/TOWrpHoMmvEBbx7IHQ35vQFnKx2gI8FHV9
	dcELUnGJYE+6YTzT+BnM324Q==
X-Google-Smtp-Source: AGHT+IFaXR7Gdcs01yDtClXE6wM3ZHYQPlAsb5UTjdx02NdsUMJRHxWGNlIRHUsz8Uwnw7qt9DGSCV4NeCHMcn7nLLs=
X-Received: by 2002:a17:907:c019:b0:ace:ed3b:285e with SMTP id
 a640c23a62f3a-ad1fe99df6emr189727666b.56.1746693488785; Thu, 08 May 2025
 01:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507184737.154747-1-hdegoede@redhat.com> <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
In-Reply-To: <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 11:37:32 +0300
X-Gm-Features: ATxdqUFnrXw8IlYAU1jp6FWFk9eL2pdP6A2jXxJxraQiS4xe2ktwNA17VklxgKI
Message-ID: <CAHp75VeRTO2vPqb44qNp+MZP3R9y5qv3X+EjOJCaeCR3thsr5w@mail.gmail.com>
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 11:36=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, May 7, 2025 at 9:52=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> > This patch series does some small refactoring of the int3472 code to al=
low
> > re-using the sensor GPIO mapping code in the atomisp driver and then th=
e
> > final patch in the series moves the atomisp driver over.
> >
> > About merging this, maybe the int3472 patches can be merged in time for
> > the 6.16 merge window and then the atomisp patch can be merged after
> > 6.16-rc1 is released, otherwise an immutable pdx86 branch with the firs=
t
> > 5 patches will be necessary.
>
> Overall I'm pretty much liking this series, but one comment against
> the last patch (see there) and one question here. Can you isolate GPIO
> mapping code in a separate file, please? This will help to generalise
> this code outside of two mentioned drivers (I might need it in the
> future for something else, not related to cameras at all).

Ah, and formal
Reviewed-by: Andy Shevchenko <andy@kernel.org>
for patches 1-5.

--=20
With Best Regards,
Andy Shevchenko
