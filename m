Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B6026F445;
	Tue,  5 Aug 2025 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396003; cv=none; b=hnK8Qn4XtXe2eD0PGIbij+9kv6BACI2745IRNKUhmxvPEDruMhATk6QGXOtKvDjPWwuOEDc/AXj/tKkHB0u45ht/pIlpmx6lvsDIiZJTai8TmanVRtktmWspS5mEsl68p3gxqmnucTlfi4Aje1JxjwQyoXgkDs6VdZoTf1p80jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396003; c=relaxed/simple;
	bh=EwgV03aMmUigY4Ai2ZcUT6R7WsVFMtOcHbmjEh5+jE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0CVyhQBvqX6UuHhl2VgmBNhGlUsI5j6XZmp+9daVB/NQaJNPCqH8godmkgh+IXcTgIzZcJ6zAKFHdZ5wNcUduwBhhFenzAx0gGD4FSHxDApF4yS/vjuoxGcQAWiHrnbRBzYz80Ajn6qIclklWVfZyd9axmdijvPSzlDJb7uooU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Orv6euLt; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Orv6euLt"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71a29139678so3669187b3.3;
        Tue, 05 Aug 2025 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754395998; x=1755000798; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8V2DgHri8YgTejj87JvYTtqdyOnLtF+JDKa1lXF5to=;
        b=Orv6euLtSchNV8dZJGoW9AnmczzXWQaSavlrRd98PMD3zJg8KHZuCVPl6E8uKkDq5U
         N10zkiA7YhM5wGab4ejJnF5tWyM672ZaC+QwjToumIIN2ibQ3eO2rL+vgQpMdrFC1gFd
         pcv8QmWOLg092o6iF8J3Ww5UUByO3aTcZZhmd6KRDvM4sPrx/bxycZ9TKDuRYyFu84CT
         HDgiTvghP61IdOF6wvALBM6UnoFz/oBxQ8s6/G8CjprOwPBPP3F++yGH9YDnSAmi4G12
         BQ8lGhip9UNygNMWlsDbSDDmrc9sOaZKuXirNCczukgZqEpXgLdo1o3+X7NLU0Slo0b6
         EKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754395998; x=1755000798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8V2DgHri8YgTejj87JvYTtqdyOnLtF+JDKa1lXF5to=;
        b=Zbm7JmImDkokKUoc7fpu3V8u2N4YV3568fckzNd8a+yfhxcTR5qnezvlY+mpmcyhrd
         5BtGFDpiHkpT0cnoC5QBBsoV6KPYj9yrEs/pq7mXBdljdyQmMOjfPXqlXSJmR/QLSoYv
         +DjbQFrifgM4GI+hyS27WVAlAkVbScDxDBa+c8mwz8xMvAlXz1Xw5Zu7aPomANIRDCwE
         sbZXJiNvX0KMSkHzpwjsPn0CHqFsTFvptXOVvbmmfjTCr90+NUPcGufeR9r4+DghpoqM
         6AMHivU1brgo0/4Fj/y3A8xU4OXsKWDxuJZBm4VvVnJ8e+y64T89Cfbao0ag7DLvW2S6
         mc1A==
X-Forwarded-Encrypted: i=1; AJvYcCUIzY49SCpTaUqbpDE0M7fZeSEggAm8D9Huh5aPdKG/4+dl06a7JRilKLC/CyD2yQ49g7ZyA3rfwBs6koQTEA==@lists.linux.dev, AJvYcCXKCLzWvWQ0q8CaLJ2w4hFYA8CaNIq6L0QdAJse/nFWCarljOOI9mUVSfhK2ZVDkRtmaCiQt5VUV9/Mpk2By1ZPjYH0pA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNMeOcvBQARP+WDLgW5YmAibQzWxFUCbv5rD70gEzdecnyFuh8
	GsDh8tySNu/T9PIPMldCLLzK92VCkWcniBfLIIawy8q8WWSmOO+FnKsgzV3laI24GIFwRl7GLWO
	C/NI/BtiEET23u+gKO5W7iyRMd6PxZmY=
X-Gm-Gg: ASbGncs/dLwDdb1TDRiH5skM5bhkHyKtsq7ut0auaQ0FBF2gE+GS09LejgtnCPNWqzH
	dKOYeITsazJfcP2sp/w53cNFSMIpMYxLynPlKvJUzTaBNR6MMbvKmE2pPR0ViAU7r6b9wVOnKAy
	YpIuEWW1GSeUl9J2RdlnVffNWPc0WRkQ6IOQAoK9IBhspXxBiXKwEuXNmm1ZsE3I7CrERYe/wSG
	MPP9Eef
X-Google-Smtp-Source: AGHT+IFno5ZUE+zPi7eL10QnBpUmwNfmnQnJRM7Ol/kSuAJPwRUHFeKn/aaBiKWgZBJ4/hwctVDxvaI1CZE+sNLrowI=
X-Received: by 2002:a05:690c:3390:b0:71a:2d5f:49b9 with SMTP id
 00721157ae682-71b7ed87a67mr84871107b3.1.1754395997637; Tue, 05 Aug 2025
 05:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com> <5c9bf027-f362-4176-b4af-bcba9aa96e0c@kernel.org>
In-Reply-To: <5c9bf027-f362-4176-b4af-bcba9aa96e0c@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 5 Aug 2025 15:13:07 +0300
X-Gm-Features: Ac12FXwc6JwF_PWuXYoAwmMgTz0-8NbtMwbbTAQwO8Nlhz1mma8RYwLFA7qqMM8
Message-ID: <CAGn2d8MC4JckjW8isvz6q6SMsb9VEAR2QrnNkJHPRuLZtwqqSg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
To: Hans de Goede <hansg@kernel.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,
Thanks for the feedback.

On Tue, Aug 5, 2025 at 12:00=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi,
>
> On 17-Jul-25 2:42 PM, Abdelrahman Fekry wrote:
> > The function atomisp_set_fmt() modifies shared device state and expects
> > callers to hold the isp->mutex for synchronization. While most internal
> > callers correctly lock the mutex before invoking atomisp_set_fmt(), the
> > V4L2 ioctl handler atomisp_s_fmt_cap() does not.
> >
> > This results in an unsafe execution path for VIDIOC_S_FMT ioctls
> > (e.g. via v4l2-ctl), where shared structures such as pipe->pix and
> > pipe->frame_info may be modified concurrently without proper protection=
.
> >
> > - Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().
>
> Thank you for your patch, but I'm afraid that this stems from
> not understanding how v4l2 drivers work.
>
> isp->mutex is set as the mutex for the /dev/video# node in:
> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:
>
> int atomisp_video_init(struct atomisp_video_pipe *video)
> {
>         ...
>         video->vdev.lock =3D &video->isp->mutex;
>
> This guarantees that any ioctl handlers will be called with
> isp->mutex already held.
>
> The suggested change here will result in trying to lock
> the mutex a second time leading to a deadlock.
great, now i understand.
>
> So NACK for this patch.
>
> What would be useful is adding:
>
>         lockdep_assert_held(&isp->mutex);
>
> to functions which expect the mutex to be held. I regularly
> test the atomisp code with lockdep enabled kernels so this
> will help catch any paths where we indeed are not locking
> the mutex while we should lock it.
will look into that.
Could you please check my other patch series if you have time
https://lore.kernel.org/all/20250712191325.132666-1-abdelrahmanfekry375@gma=
il.com/
thank you !
>
> Regards.
>
> Hans
>
>
>
>
>
>
> >
> > Fixes: 4bdab80981ca ("media: atomisp: Make it possible to call atomisp_=
set_fmt() without a file handle")
> > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> > ---
> > v3:
> > - Use guard(mutex) as suggested by Dan Carpenter and Andy Shevchenko
> > - Remove extra blank line after variable declaration
> > - Fix include order as requested by Andy Shevchenko
> >
> > v2: https://lore.kernel.org/all/20250717013003.20936-1-abdelrahmanfekry=
375@gmail.com/
> > - Add Fixes tag
> > - use cleanup.h micros instead of explicitly calling mutex_lock/unlock
> >
> > v1: https://lore.kernel.org/all/20250716014225.15279-1-abdelrahmanfekry=
375@gmail.com/
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/driver=
s/staging/media/atomisp/pci/atomisp_ioctl.c
> > index bb8b2f2213b0..2690c05afff3 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > @@ -7,6 +7,7 @@
> >   * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/delay.h>
> >  #include <linux/pci.h>
> >
> > @@ -416,7 +417,9 @@ static int atomisp_s_fmt_cap(struct file *file, voi=
d *fh,
> >                            struct v4l2_format *f)
> >  {
> >       struct video_device *vdev =3D video_devdata(file);
> > +     struct atomisp_device *isp =3D video_get_drvdata(vdev);
> >
> > +     guard(mutex)(&isp->mutex);
> >       return atomisp_set_fmt(vdev, f);
> >  }
> >
>
