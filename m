Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65329229B38
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 01:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774834380; cv=pass; b=TGPfQvoKqcLG8Oh5IfSudrvebJVeN9xnGYGtCMOKewW2fdwEcLJqVC+qbZsbglEETdwyvqNFov4gljtHPi6sd1jSSxlW1Qo4lQZ9zhQk3JIZyO5q6j43vynjSEavIc6LvDG/WDUeQl7qdeY1N3818mNrjFDtvLGI46cqaebtMB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774834380; c=relaxed/simple;
	bh=+Q1YyVNJu0ZiaK+qjFsoCmBsOlxRu1PCmfsnheR2rfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONTnm1zTXgLnXJOY21grdgvIaCXhA/+c0ZuWaxgofEaTbgHMPi8i1SCmj+iC+WGcg/u69YtlQtAsbsdV2FZT0JKbJeqqbj3J/EfqHxkVkevrkr8UDxzP89K7X3SNKdaoxbwVWvV/IHJlUM83rPpMy2r3ZzbrsP0MLL99CS3Q0pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5itGd/b; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5itGd/b"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-604dfcc9892so2596444137.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 18:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774834378; cv=none;
        d=google.com; s=arc-20240605;
        b=ZNOwEvbVtsrqHm/67ywqc010Kg9OtYFB/RxIFNy+UZ5cCCGMaeBPIxwWgu84S2cQk7
         tp90q+chClazktbossLVkw/n7WeBLiRyY0SJ2zCt4LPHt7k9/psLBJlkdtsL4x/lnAgs
         TFcjTCuATWmQA7hXeOkGZSft1i4soSc335JNH0KGukmmjaPqsySfd08zyi9KJNFSnKy4
         OzZkAam1Sxu2DCenI+kUfnhcvNpyDNdZ1I4ZIbot67lPPlHlPHRNmbbNwowCaHah65wo
         PjjalKSLbi1HhHGCoqpZd/Zbjrwe5d19cSZNDcCi+3Fiykc7JhEweCL4Qy8oM6qEUBIw
         IMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i3YnJTDVMbGBpA8luj4wZy2j0gbaE3JlsAMh7Iwdxws=;
        fh=0tta63sThNs1KLFCXHffP7S2SzUaEB9LIZpxvbc7TPU=;
        b=lJ/iUIb2MNhWwBqkGxUXBNTx1bxIhaQFEv/gY8MZ+XSzSH6pqanwVpE3ypsOfGSjJP
         g63ZTO1ebi5VzcoVHw60jHGMwhOMKIJYNt1Vj+R3vn/2DVYZr5gYgjMpT0lnBxRvVP0h
         J2Trk3ItYN6PKJnBA0qGlSbkmFwNIM8halyrhu7SO9oa1ITNaHH9Bkjki4DTyOv8QIZr
         gjoF0cLGx0MFtul9tj1elrUbBGfP3x6GoZArh68RMHYjnnLFInec2j1s/jPt+NcCS3Od
         1IQyMHk5pXCqoAh1pIorl8XazU+J/vx6EEbmfQB9+9LGQIAlNmPSgBKwAhMbjZbmcnF+
         +vYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774834378; x=1775439178; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3YnJTDVMbGBpA8luj4wZy2j0gbaE3JlsAMh7Iwdxws=;
        b=D5itGd/brGMC4DGSubF8INgNDLrSTPT2T0oKwK0ZNBlKtfiq9xQxtAw7RTDJ3AXIUg
         UpeboxZxgvuLNNA50QPdH9g0NB8hikHQNCp3bFGVraOWbO+sjI8mILiuw+4U3qanGGmZ
         9/RcF5JuTf1e1ttbGOWtDz205LCiItyfIjNjj6wKoRu0KxOtJRnxI9I1qmYvs9/YprM4
         RAHVnWjjV/OZCofxjJwJldVLQILcd57xzKR6TUj4Hay7nEFaHtfIVbKoR3tUarNzBVvm
         p5hIYcyVESuEjcEe8rthaxcao74VIHhZcynCwR/olMCsNSRsvBFWoO11ImA5LktrzOLK
         WAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774834378; x=1775439178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i3YnJTDVMbGBpA8luj4wZy2j0gbaE3JlsAMh7Iwdxws=;
        b=XrT17seQV0lwrS2g1yFFDoA6U03emOYr/HVhyF8taS7NblUK7J8IMZf113GbJikiYh
         BMLiGroYw1MYASpI+DmuHq0YUMzOJ6UCs3OncXtMFcV9vuPUf+SY7JqlnxlsmBEk5g40
         zwyPbraBNQC4L6MlvcPQuuvK+QCKZlPrOQnrJzFrv5+w9uDB6MqLKGj5brMXLLxAXwAm
         oS4IHMZ7dh2b0exTH4eHPo7UDpdcHrOAskljp5l86vA1762k9QpEdw+GM+sI372B0nlU
         HWA9I20UJtYw0D5W0FOafIxDnMm7LYkAJVMA6LnG02uUfwWJF/9Avx5jpcQvRtFErX4F
         3ujg==
X-Forwarded-Encrypted: i=1; AJvYcCVhjxtnCQ4tfAG7r/JCdjnfwvPbPKN2Uo/mVhdh9aSH7gifS6UAc8RYesGM7TQV2+s9kj5/LsG8H7td7HFz@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0nA0Vk2W0DMCWPLvpUm+R8iDMiSvm9Apv2lh7QCmK/aa4Tcuo
	u4uzm1mWv2menka9W/Pxi6XFBgQSfUnqIQwxLyhLCnD8DQxvKsyqoMNXQNuw4nkyu3hdM5iBx7u
	V/ETx6efIKPaAEXS44uhiqUpp2CLx+xsMkzPAqWg=
X-Gm-Gg: ATEYQzyPggP9wGkJT75tHxEBPAC44hqjyEnhHR8GAu6N6MnOgotW+QKCOi2E5JiOWPR
	nev0mpRuooWdYS2Pt+US3yMiPysch9h42CSZRYky8/9J+uphNJPCseFsJcpRcPiX9H0U8YqjWHT
	zPg/QH/pFWWHM+vXGf0gmRGUxJ/Seg8HXQfTLTrqP8s/UD/INDkvB6M/suy+mjSex8s/Rh5sKt0
	60yVR6SaPc15WWYzUUOGkmuPyhSnFuhKWkWMjls3pNF0j9KnZbfIjYTa9waE+Y1bFvlaO+fOsxk
	AGQ/jOTO
X-Received: by 2002:a05:6102:4487:b0:5ff:d434:b507 with SMTP id
 ada2fe7eead31-604f9207795mr4316477137.17.1774834378255; Sun, 29 Mar 2026
 18:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327031106.10386-1-anushkabadhe@gmail.com> <acZo5LUXH70-UKUi@kekkonen.localdomain>
In-Reply-To: <acZo5LUXH70-UKUi@kekkonen.localdomain>
From: Anushka B <anushkabadhe@gmail.com>
Date: Mon, 30 Mar 2026 07:02:21 +0530
X-Gm-Features: AQROBzDweibRFky0Zl_dhjis5V0cWFM51ww1g3cxadOAkOjsn4Z5X4Ceh9EJJ4M
Message-ID: <CAAfE=nNNxCKv0JoRcib7YVQfQ9MxqE34WyYu2GHNYaroxzpw1w@mail.gmail.com>
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in gp_timer.c
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: andriy.shevchenko@intel.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	hansg@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mchehab@kernel.org, 
	Daniel Baluta <daniel.baluta@nxp.com>, Dhruva gole <goledhruva@gmail.com>, m-chawdhry@ti.com, 
	Simona Toaca <simona.toaca@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 4:54=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Anushka,
>
> Thanks for the update.
>
> On Fri, Mar 27, 2026 at 08:41:06AM +0530, Anushka Badhe wrote:
> > GP_TIMER_BASE is only used in gp_timer.c and it does not need to be
> > globally visible.
> >
> > Move its declaration from system_local.c to gp_timer.c and make it file
> > local by marking it static. Remove external declaration from system_loc=
al.h
> > and its usage in gp_timer.h
> >
> > This fixes a sparse warning about global visibility and cleans up
> > unnecessary global exposure.
> >
> > Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
> > ---
> > Changes in v6:
> > - Mark scope of GP_TIMER_BASE static
> >
> >  Changes in v5:
> > - Move GP_TIMER_BASE definition to gp_timer.c
> > - Remove extern from system_local.h
> > - Remove include of system_local.h from gp_timer.h
> >
> > Changes in v4:
> > - Remove unrelated block comment style fixes
> >
> > Changes in v3:
> > - Add commit description
> > - Fix subject prefix to staging: media: atomisp:
> >
> > Changes in v2:
> > - Fix block comment style (move closing */ to its own line)
> > - Merge split GP_TIMER_BASE declaration onto a single line
> >
> > Note:
> > * This patch is part of the GSoC2026 application process for device tre=
e
> > binding
> > s conversions
> > * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-De=
vice-Tree-Bindings
> >
> >  .../media/atomisp/pci/hive_isp_css_common/host/gp_timer.c  | 7 ++++++-
> >  .../media/atomisp/pci/hive_isp_css_include/gp_timer.h      | 1 -
> >  drivers/staging/media/atomisp/pci/system_local.c           | 6 ------
> >  drivers/staging/media/atomisp/pci/system_local.h           | 5 -----
> >  4 files changed, 6 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host=
/gp_timer.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp=
_timer.c
> > index d04c179a5ecd..0c1b67988dd9 100644
> > --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_tim=
er.c
> > +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_tim=
er.c
> > @@ -11,7 +11,12 @@
> >  #ifndef __INLINE_GP_TIMER__
> >  #include "gp_timer_private.h"  /*device_access.h*/
> >  #endif /* __INLINE_GP_TIMER__ */
> > -#include "system_local.h"
> > +
> > +/*GP TIMER , all timer registers are inter-twined,
> > + * so, having multiple base addresses for
> > + * different timers does not help
> > + */
> > +static const hrt_address GP_TIMER_BASE =3D (hrt_address)0x000000000000=
0600ULL;
>
> Please don't move the defition here. There's a reason for keeping it in t=
he
> same location with the rest of the offsets. There's a lot to cleanup here
> but what should be done is roughly:
>
> - Make these constants macros (with IPU2_ or ATOMISP2_ prefix?) and move
>   them into a separate header (perhaps with register definitions?).
>
> - Remove my_env and make struct device (or maybe struct atomisp_device?) =
as
>   a parameter for register access functions.
>
> This may get a bit complicated due to the amount of cleanup needed so
> having the hardware for testing would be rather essential.
>
> >
> >  /* FIXME: not sure if reg_load(), reg_store() should be API.
> >   */
> > diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_=
timer.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
> > index 94f81af70007..e651d9ef1114 100644
> > --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
> > +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
> > @@ -21,7 +21,6 @@
> >   *   - local:   system and cell specific constants and identifiers
> >   */
> >
> > -#include "system_local.h"    /*GP_TIMER_BASE address */
> >  #include "gp_timer_local.h"  /*GP_TIMER register offsets */
> >
> >  #ifndef __INLINE_GP_TIMER__
> > diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers=
/staging/media/atomisp/pci/system_local.c
> > index a8a93760d5b1..8d4fd80f8984 100644
> > --- a/drivers/staging/media/atomisp/pci/system_local.c
> > +++ b/drivers/staging/media/atomisp/pci/system_local.c
> > @@ -83,12 +83,6 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] =3D=
 {
> >       0x0000000000000000ULL
> >  };
> >
> > -/*GP TIMER , all timer registers are inter-twined,
> > - * so, having multiple base addresses for
> > - * different timers does not help*/
>
> This comment could benefit from fixing, regarding both formatting and
> language.
>
> > -const hrt_address GP_TIMER_BASE =3D
> > -    (hrt_address)0x0000000000000600ULL;
> > -
> >  /* GPIO */
> >  const hrt_address GPIO_BASE[N_GPIO_ID] =3D {
> >       0x0000000000000400ULL
> > diff --git a/drivers/staging/media/atomisp/pci/system_local.h b/drivers=
/staging/media/atomisp/pci/system_local.h
> > index 970f4ef990ec..2bd46f5123fb 100644
> > --- a/drivers/staging/media/atomisp/pci/system_local.h
> > +++ b/drivers/staging/media/atomisp/pci/system_local.h
> > @@ -53,11 +53,6 @@ extern const hrt_address FIFO_MONITOR_BASE[N_FIFO_MO=
NITOR_ID];
> >  /* GP_DEVICE (single base for all separate GP_REG instances) */
> >  extern const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID];
> >
> > -/*GP TIMER , all timer registers are inter-twined,
> > - * so, having multiple base addresses for
> > - * different timers does not help*/
> > -extern const hrt_address GP_TIMER_BASE;
> > -
> >  /* GPIO */
> >  extern const hrt_address GPIO_BASE[N_GPIO_ID];
> >
>
> --
> Kind regards,
>
> Sakari Ailus

Hi Sakari,
Thank you for your reply.
> There's a lot to cleanup here, but what should be done is roughly:
>
> - Make these constants macros (with IPU2_ or ATOMISP2_ prefix?) and move
>   them into a separate header (perhaps with register definitions?).
>
> - Remove my_env and make struct device (or maybe struct atomisp_device?) =
as
>   a parameter for register access functions.
>
> This may get a bit complicated due to the amount of cleanup needed so
> having the hardware for testing would be rather essential.
As a student, I don't currently have access to the hardware needed to
do the bigger refactor safely. However I'm happy to fix the comment
formatting and language.
In earlier versions, I had merged the split declaration of
GP_TIMER_BASE in place in system_local.c before later moving it to
gp_timer.c.
Link: https://lore.kernel.org/linux-media/20260325132434.55775-1-anushkabad=
he@gmail.com/
Would it be okay to proceed with the simpler in-place fix for
GP_TIMER_BASE declaration instead?

Thank you,
Anushka
