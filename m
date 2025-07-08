Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4452421C9E4;
	Tue,  8 Jul 2025 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751986503; cv=none; b=ULv/FiZOlSht1uWYTU6+/ORjUXQn4DXcXWsox4kQfIqm6hI6Jr2fjn/k9Zt/u8qNTo/gqQUNam60W6fKT2nzfajdlgIQhKGNhXCkHOdTFtVdBDKF6AlnTciKV7v/AqilVsoLcxbWDZJytH6j8Slu7hGJ2CV+pCzLsgtGTpMpbLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751986503; c=relaxed/simple;
	bh=5ZOYpPpQedu6fd9KO9knWw1X3RRpwMkE1UKreUlY1MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHOk23B1wAJ3UR4fnAc+O5na7Enc67KshtuFEEozVmo5IMiGoNxsLtMVSb4B+pv8iUI+0U0cqZTei8JAU6ybG4LsJNp1CUQDTA7x0JazZuxIjWEvh2u0VUe4P/AZ5/fYHTClDfW1ggQKvFO0gaCiTL/sqYm7yzRngRWBr+Gb8eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0/lX9vs; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0/lX9vs"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e821922451fso590240276.0;
        Tue, 08 Jul 2025 07:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751986501; x=1752591301; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPvzK8TvPX5jcVxVSpM9kdKq5e8vtmE271oEINXGFR4=;
        b=g0/lX9vst78Qv0rD8Nr1PYzYukWuZItS+U9MXJV63ugGIi0i+rqvT7lbuC3Y2zGH1o
         2ogQUymdfQMEGkZD4+ElzCQKk774fuhp0kQRW1A9UiY1Uec0BQZOP4a421wiA7SAZa19
         tW4XqfIWFODQxNmdwrLg0PSjA1yPvQF4chVUpBXiWoQc6oQicJy6ire2gbRxLYyVjCQM
         bCs+sC/gaUtxeatbbUuSX7f2Whkn72QH5gd/ygW4Q2ZktIO89vBQ8IiiIg2fQVY8EmB+
         TuTCvVJs9K/nmr9W/3C9GOIP7Fj3thAWQKt7Q9YvdzmpqY8XoLEJC6wAHAAHXlmV3I2S
         sVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986501; x=1752591301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPvzK8TvPX5jcVxVSpM9kdKq5e8vtmE271oEINXGFR4=;
        b=kzrOiY6kwXZlCOD+h8OO3yS4KZkygtRVvwkLeB5ftaoWmjIXXTPOtYGZDsWmrgaiGH
         yKL5kBFlh8pDk6Hd28O055qE49U4DorgPDK34zR64lb7i8wg5asDsBXGU0z+cZqoAD+M
         +imCtpudFdSopjMprU9q4burm0Ex2jMW6Se1dNL1WF9Z/a/FTgp+jQ7T5T+WvGfv77zL
         9nUYim0ytFfkd2+J26MhAFyf7aQB/a8uR93a8Yq2YrKJFE6C3rzha4TUmwUgUl4hYWK+
         qPv/ZcOqPeE+2/mYnXvVXKu0lOWKJyGaikYPyYz4lQAZTLHmjGFJPhyuNm7n89nvhFqX
         mDVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv79p2iuvOiG+E8yrkvaXffr3HXm97gbzw5WIBUNt2fLD++e+Y67W96iaTeHunHrCNMhhoFULivrr4XdzrfcRVwbMCug==@lists.linux.dev, AJvYcCWlYs64s14OmU2/YLIm9qAZhR/J9HWGWm/FovWAsUZQi5GBkdr9KqA4Z1bZ7qp2cAep8q3L52IEd1FGSLF6dA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzK2+v/4ELUNQGLOskHlVCpUWJjwWu4v2Bwq5uXWxTqyK4+pAQZ
	ofCcpzEZfwByyab4ffcWsdc+aZzL6kDlDDR//6ptJDMkKW0vVSYYlxpM2bHdVdBkfdnao6SUvfz
	NXPYdgHXPWJxo+uiWBH20vaOzyQ8QNlg=
X-Gm-Gg: ASbGncsmmzXG0lDnC/EIP3OHw+IjTGdvvCJcO6uo7KmY5vwnMrncm1k1goIap1IdlB6
	h6ZXErFDvnxaGz36yu0ruYgRizMmNRbEG6peMLy6BTJM80W7IptStLkvfFWjy5W5rfXKk/3Qwua
	djtNPtstZhyhrInxOzP4MaB0zpwcWt7cSVf37CNUJXz/Q=
X-Google-Smtp-Source: AGHT+IE2oBamYt3hOakYR1sNMb2lnRmFna7dOvcFvV9m1Ku889Zy9F+eHEBwieaFLXPLMaC0I8ddi3qQa/yJN5UvIjk=
X-Received: by 2002:a05:690c:4b05:b0:70e:4745:33d4 with SMTP id
 00721157ae682-7166a18faf5mr102479867b3.7.1751986500865; Tue, 08 Jul 2025
 07:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
 <20250707140923.58935-3-abdelrahmanfekry375@gmail.com> <d063964c-5ca9-4602-8338-05c46c2d2775@kernel.org>
In-Reply-To: <d063964c-5ca9-4602-8338-05c46c2d2775@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 8 Jul 2025 17:54:49 +0300
X-Gm-Features: Ac12FXxUw3FUwIq0kbMtrNrtA3RyDhEzzkrDs4rsXtdMfEo9vmnKvg5YOpeJoUc
Message-ID: <CAGn2d8MetzWM0bwhdnocP1kLCYcYgmzb1ggPC5Fuv6cXFDniug@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: media: atomisp: unify initialization flag
 usage in HMM
To: Hans de Goede <hansg@kernel.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,
Thanks for the feedback!

On Mon, Jul 7, 2025 at 5:14=E2=80=AFPM Hans de Goede <hansg@kernel.org> wro=
te:
>
> Hi Abdelrahman,
>
> On 7-Jul-25 16:09, Abdelrahman Fekry wrote:
> > Previously, the initialization state of the `hmm_bo_device` was tracked
> > in two places: a global `hmm_initialized` boolean in `hmm.c`, and a loc=
al
> > integer `flag` in the `hmm_bo_device` struct. This was redundant and co=
uld
> > lead to inconsistent state checks.
> >
> > - Removes the global `hmm_initialized` variable and all checks against =
it.
> > - Replaces the `int flag` in `struct hmm_bo_device` with a strongly-typ=
ed
> >  `enum hmm_bo_device_init_flag flag` (values: UNINITED =3D 0, INITED =
=3D 1).
> > - Initializes `flag` to `HMM_BO_DEVICE_UNINITED` at declaration to
> >   ensure a well-defined starting state.
> > - Removes a redundant `hmm_init()` call inside `__hmm_alloc()` since it=
s
> >   always called after hmm_init()
> >
> > This change improves type safety, consistency, and readability when
> > handling the HMM initialization state.
> >
> > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> > ---
> >  .../staging/media/atomisp/include/hmm/hmm_bo.h   |  9 +++++++--
> >  drivers/staging/media/atomisp/pci/hmm/hmm.c      | 16 ++++------------
> >  2 files changed, 11 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drive=
rs/staging/media/atomisp/include/hmm/hmm_bo.h
> > index e09ac29ac43d..155f9d89b365 100644
> > --- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> > +++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> > @@ -58,7 +58,10 @@
> >  #define      ISP_VM_SIZE     (0x7FFFFFFF)    /* 2G address space */
> >  #define      ISP_PTR_NULL    NULL
> >
> > -#define      HMM_BO_DEVICE_INITED    0x1
> > +enum hmm_bo_device_init_flag {
> > +     HMM_BO_DEVICE_INITED    =3D 0x1,
> > +     HMM_BO_DEVICE_UNINITED  =3D 0x2,
> > +};
> >
> >  enum hmm_bo_type {
> >       HMM_BO_PRIVATE,
> > @@ -86,7 +89,9 @@ struct hmm_bo_device {
> >
> >       /* list lock is used to protect the entire_bo_list */
> >       spinlock_t      list_lock;
> > -     int flag;
> > +
> > +     /* flag to indicate whether the bo device is inited or not */
> > +     enum hmm_bo_device_init_flag flag;
>
> Please just replace this with a "bool initialized"; data
> member taking `true` and `false as values instead of
> introducing a new type for this.
>
Okay , will do this.

> >
> >       /* linked list for entire buffer object */
> >       struct list_head entire_bo_list;
> > diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/stag=
ing/media/atomisp/pci/hmm/hmm.c
> > index c2ee9d2ec0d5..767a3a24f8e5 100644
> > --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > @@ -24,9 +24,10 @@
> >  #include "mmu/isp_mmu.h"
> >  #include "mmu/sh_mmu_mrfld.h"
> >
> > -struct hmm_bo_device bo_device;
> > +struct hmm_bo_device bo_device =3D {
> > +     .flag =3D HMM_BO_DEVICE_UNINITED,
> > +};
> >  static ia_css_ptr dummy_ptr =3D mmgr_EXCEPTION;
> > -static bool hmm_initialized;
> >
> >  int hmm_init(void)
> >  {
> > @@ -38,8 +39,6 @@ int hmm_init(void)
> >               dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
> >               return ret;
> >
> > -     hmm_initialized =3D true;
> > -
> >       /*
> >        * As hmm use NULL to indicate invalid ISP virtual address,
> >        * and ISP_VM_START is defined to 0 too, so we allocate
> > @@ -62,7 +61,7 @@ void hmm_cleanup(void)
> >       dummy_ptr =3D 0;
> >
> >       hmm_bo_device_exit(&bo_device);
> > -     hmm_initialized =3D false;
> > +     bo_device.flag =3D HMM_BO_DEVICE_UNINITED;
>
> This clearing of the flag / setting `initialized =3D false` belongs insid=
e bo_exit()
> not here.
>
okay, moving it in v2
>
> >  }
> >
> >  static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
> > @@ -72,13 +71,6 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm=
_bo_type type,
> >       struct hmm_buffer_object *bo;
> >       int ret;
> >
> > -     /*
> > -      * Check if we are initialized. In the ideal world we wouldn't ne=
ed
> > -      * this but we can tackle it once the driver is a lot cleaner
> > -      */
> > -
> > -     if (!hmm_initialized)
> > -             hmm_init();
> >       /* Get page number from size */
> >       pgnr =3D size_to_pgnr_ceil(bytes);
> >
>
>
> Regards,
>
> Hans
>
>
