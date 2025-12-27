Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40BA224AEF
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 14:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845206; cv=none; b=Q7ikOKg5pAhXxzeEwONNr5QatJT/wGmrrmfLnqh4gvT7YAmmXX2Zvx65afHk9Cn2z4WJ1pQuM5oE5Ut1QyTSx4Gr6MFR2YXmhonRD4+4TViq7Ru4Cx7iX+AmE+qu1Tkx/7M94e28LwczMlcKcKHkrhR+Y1JaahMOuZcCLwSBETc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845206; c=relaxed/simple;
	bh=qVm/WbD0OkOzktJs0xypVZ5JiX+A86nrc1r124G+N4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udtZ6xz5/6UrMWXUHnP+E5B8sqz1Z+6wPxop3FFvjT2VAlHPsAUwu3cLW0YjX6/v0tM2jDdT3ADhjWBAeR9lmZ+gxsa+GaT2j4D6ana3idwCuVkJf8vewp0q5U+rq1YI+opBG5P7BMMpMwA/7s4uRAdLHjcDckpL3jZcWwGSib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wrl6ajGq; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wrl6ajGq"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7277324054so1258903866b.0
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 06:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766845202; x=1767450002; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3rVAXM2uA2BUpYCLCItwXy4Hyvoocs+aIR9WcWlcsk=;
        b=Wrl6ajGq2rw1MdfslMzxUyOkapNx6JYusqhffWAJQBV2aM9j07wdZr5nMIjJrOLLL0
         JQ7xp2Vn4mZnq7c1lEY2NRxvNfsp0k1sLn5uZZQE6m0MguPOSWAHNIRqTWfIdnhO3V0k
         dpzQR2ZWZc9lD1mLbMPz48wxsa7fFtPiOpS9opYbkgtJe4aXD1iKwHbK5LLI6lIIAE1s
         isHLvYndZqMLkOglw2eeuUjpq4gsjWuD+865EKcVmLrO1C7AQSAy/iXGYciZC8y2Ltjs
         AZgCQQbugB+T9IjrkFl46/3emBkFrTTrTsSBtwT2tj4FZScQ2IZydiIAi1YojxxnRxWw
         gSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845202; x=1767450002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e3rVAXM2uA2BUpYCLCItwXy4Hyvoocs+aIR9WcWlcsk=;
        b=RC9jKx7agYOBgx3IkSa6U8QYnXNDKngpzZ5S+u7bkTQRvlpfM/CAkQNfmPD73G/jKq
         /bEd0E0rMOJwc7jsABNN+/EMnEZAKJfyFvNTog/zmGQWvM3yk93DNXtdXNgBDSuRMXI1
         UU3PbrJRtNEg7OpBK9Yt6qWc1bToYrKeafAhDQGH8ffsHAMwSXk1gb27Zgb3lZziD5Oe
         Xt/kXjXLg20ozjNT+MRxfm1kMd6H8C5oqE0GKlnWrEFui8Ctn4wq4MXxQamp0q/4eDKA
         0azPceGE7a5LC7t0hRs+JzRJMnYe3fxFR1j0SfjNT1P2Z6LsVqO9zRGGnuitYBo/aAKj
         SWvw==
X-Forwarded-Encrypted: i=1; AJvYcCXoWadZZQOZ1nehpx2TxvlhtaTjG1rXzjvweQo69cWms2+6q3cDBWeGZwnpvaSSryRNWjLBk230zRfi8xyU@lists.linux.dev
X-Gm-Message-State: AOJu0Yws+Ifgh/Bplj6qudzs8ezhVpxz5d9nVQDKrvHj3b2X8qfwyFIM
	liojCoG7U04Xu7jZP8l2Y1zMzuyqfmCUBnbvhqhhT15r0q/MsLjiH9+v4cLpZASQzMv0llUuJG/
	rajc+b5wWH14dv09eCWbkqo4dKPjKwalr5GvY408=
X-Gm-Gg: AY/fxX7YoswrNYor4w0mH3fNMO+EygZk6k9/6YvYF7/rSI1ZH0DmHowkIGFG7rMEq1p
	1MLZXOx9rxeWRcqWkLtnPTzmjCsDNzRUTGn20Y+qhoCs9zsN6814ivhh49qEFzFEclR7o8mggI7
	lgw9Jjw3HaWOmUTiWtMbtSaJDI/NDVc5nMaP7wFsm6BofTaUlWI/kMTBRps9DBQAN4SJO36LHLQ
	/Ht2CEW3KFk2Um2x5+rBJcOB10Ms+CCku3hK5mT+KRslhH8ycLe8rq/iKwzT3bKzxModtkv7Bv3
	clFFVUyvYG1Yv4o+uyeC4PaR+ZVwV8XuAsP3Xqg1TyNnxwixP2EDChByev19AUGTzUj4I+s=
X-Google-Smtp-Source: AGHT+IF8S2vZ7+R+gmMHpDxIPniiRhAY4GhOubuUewd59zPB/hHlKmS5S1gCB4cVMV+kZ1atbDLTB1f1Uuy9kvPPTQ4=
X-Received: by 2002:a17:906:7315:b0:b73:398c:c5a7 with SMTP id
 a640c23a62f3a-b80371a7253mr2621691866b.41.1766845201824; Sat, 27 Dec 2025
 06:20:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com> <20251219054320.447281-3-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-3-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:19:25 +0200
X-Gm-Features: AQt7F2qzW7hXhSkhTQqqZrlX5yqv6kNuSTsnbNk-OS8FE2UIntKjLzVunWTLcHw
Message-ID: <CAHp75VeLF8nd-JiPFnxJ2H43ZS=oYgW4=BTZjR_GuUuj03gyRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] staging: fbtft: Make FB_DEVICE dependency optional
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
> fbtft provides sysfs interfaces for debugging and gamma configuration,
> but these are not required for the core driver.
>
> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
> sysfs operations are skipped while the code remains buildable and
> type-checked.

> v2:
> - Replace CONFIG_FB_DEVICE ifdefs with runtime checks
> - Use dev_of_fbinfo() to guard sysfs creation and removal

The place for the change log is either a cover letter, or...

> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---

...a comment block here. It's not so important to be in the Git
history since we have a lore.kernel.org archive.

>  drivers/staging/fbtft/Kconfig       |  5 ++++-
>  drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----

...

>  void fbtft_sysfs_init(struct fbtft_par *par)
>  {
> -       device_create_file(par->info->dev, &debug_device_attr);
> +       struct device *dev =3D dev_of_fbinfo(par->info);
> +
> +       if (!dev)
> +               return;


The better way is to decouple the definition and the assignment in the
cases when it's followed by a conditional (validation check). In this
case any new code added in between doesn't affect readability and
maintenance efforts.

       struct device *dev;

       dev =3D dev_of_fbinfo(par->info);
       if (!dev)
               return;

> +       device_create_file(dev, &debug_device_attr);
>         if (par->gamma.curves && par->fbtftops.set_gamma)
> -               device_create_file(par->info->dev, &gamma_device_attrs[0]=
);
> +               device_create_file(dev, &gamma_device_attrs[0]);
>  }

Ditto for the rest.

--=20
With Best Regards,
Andy Shevchenko
