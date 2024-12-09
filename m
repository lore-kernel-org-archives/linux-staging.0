Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8853119B5AC
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733779585; cv=none; b=ZkpjvINwoH/rMazDIoBRatCL108oMWPJ5pQtZHHVn8VIwqmdCURJp3k/hwO1aZzwYEzc1ZKXh0AKlT4wuatSWn733YFMEQ12Mj3dftPF2OWNqfmLFTsjJerYGt0LooppTGjJ957i4YC8aT8MiLUp+NG5PZD9ZO9TmQTUZ68YnLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733779585; c=relaxed/simple;
	bh=LGMZUnYe8iHvq/5eUJ1IfXuB2btk9eOij72HmxMY7Fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3efXnmfQQOWtc4CYCbo4679zRSMOcF7UPOLb6FmV+GCBM1+LpvWXA/KQy8aR0CBYk2BOi46WPR2WUxYPA3KmmboTsQ7Mg4aPi8XpPMd+IArM5Y/UQ4ldFjalQKgBf6m8I5ht57favs0xQZHLWn0o/gHMITFn9kYrlFNFWZBQe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V7Hn0Ewg; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V7Hn0Ewg"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-725dc290c00so1476708b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 13:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733779582; x=1734384382; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6idwqeXE/MDvDjAbT1MWejPhgLZPC4983El4drMBYE=;
        b=V7Hn0EwgcdFroU0Giz4wS3wxYiiieY8Gy0wXlOhFeNK0y29Amm7kHLMjRizgWCgEIs
         G6y12eU2uNAXw+bM8u+z5HBORjXyXv9MjGIF+3CCHLF2U31c8TJ+25isnG9G0TuHto+V
         rt/8qPPFKRGQqhAtjxE/RpuB3N5LdD8fQ+aGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733779582; x=1734384382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z6idwqeXE/MDvDjAbT1MWejPhgLZPC4983El4drMBYE=;
        b=Bbxh04OBU5n+geJwXPp356wi282oyJM2rlRwsNyRZ6lNuSwOlU/ERf0I6dOOrv9waw
         xkBQOvJ/YwVMTxuu/g2eMAhXMPSHWIs7jOUGxChUmFKnfx8VV29N79Oqm2LDEkabdkkU
         oHjgs3b6fkGMovcibuxZHYSGcgKeXAqFMY/ZY9ocgMxMNhdXhPb2JtxdawIqytXz8r4q
         VMrSL3j9BiyOz1LZjqs5bEoFZD4wMp+I5RjyjWPZIJ7iv21P5flkJNR0/LedPOqNehrR
         JJCEuxhZEyYxvrv/mOmgt3tc1XroOkXrsrXG/zw4Wp7wLjMKQaRGX5baDe9cdSjwj3m+
         LpDw==
X-Forwarded-Encrypted: i=1; AJvYcCVmBrolQqKwBVPFbQ8XuqEKO0IR1+eS/zWjNd9Ob/0mKXEl3MhCU95uyEAsmPa1Uw0b/kR3OM6OsuHA3ZaD@lists.linux.dev
X-Gm-Message-State: AOJu0YxbGVjZHuLLZF9uW+zf+oxacXiwbSVutc0q53F/xxi94rHtmg+n
	o4yH6lq2UDWWsrRBlrwJDGbE8LzHgiBVnjgDdoi8XT7f5ruxMge7QV1EymuK/nEUTKtOiAabKdg
	=
X-Gm-Gg: ASbGncu2cdgSAJS/xj4UcKOIessxdHruEaPwgc50bhBUGzbN0FyFfP7o64fu1Bos2GY
	gCTVBFJhNFv4Y57kUh3jZt9DUTisGXcVveTf5O/hc8zbUDgx/OVxIgGm+AofgjATtAr/CJtqxM7
	d5THff1Lc4obtROO8ts9gPUjRFOCeu71S92AHS8v/nf4MpV+0eXlUcl3e2bzj5ur0Ec1xU4LrEm
	G8SiTstN6eRvqDvqqZMtwwaHT9HFOMEJMTEgbZROhfmCMW/413Me4cnNZVem7tgmo2wbgk3tFt8
	RBgJ12t5m7UoZi2RT8eO
X-Google-Smtp-Source: AGHT+IGgWSQdYzzohnEEoek5mvXu/utlcQQi7y/qXG3gEB+UpTjik3nd4dd1d6yFBIGB5smkK5u9iw==
X-Received: by 2002:a05:6a20:734c:b0:1e1:9e9f:ae4 with SMTP id adf61e73a8af0-1e1b44150dbmr1295901637.13.1733779582588;
        Mon, 09 Dec 2024 13:26:22 -0800 (PST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725cc7fcfb2sm4988023b3a.141.2024.12.09.13.26.20
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 13:26:21 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fd377ff3c5so1940329a12.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 13:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXx4Xx3Grb/wtu4gqmm2wkXBFsid84Kj3AH96uFzK1lBNzuqGrvkOqjUXS76objkyCHFnO5ExRdwpxMKmys@lists.linux.dev
X-Received: by 2002:a17:90b:3805:b0:2ea:61c4:a443 with SMTP id
 98e67ed59e1d1-2efd58699b7mr1287425a91.4.1733779580155; Mon, 09 Dec 2024
 13:26:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
 <20241209-queryctrl-v1-1-deff7acfcdcb@chromium.org> <4bd4796f-858a-48f7-9b32-ef6991ebe194@xs4all.nl>
 <CANiDSCt_rpf=RjTYR+Fmy4fsWb0z6J5NU7iKrERDmvUrcxZwig@mail.gmail.com>
In-Reply-To: <CANiDSCt_rpf=RjTYR+Fmy4fsWb0z6J5NU7iKrERDmvUrcxZwig@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 9 Dec 2024 22:26:08 +0100
X-Gmail-Original-Message-ID: <CANiDSCsmTfyVPN7ExDEGQ54gNcEQb7jC1JJ5zgrwE38tu+uYbw@mail.gmail.com>
X-Gm-Features: AZHOrDm4lv503GGwvfdGmeP052uXzeNZJu1iaDoQ9PyURITZVBtA271vDk9LqF8
Message-ID: <CANiDSCsmTfyVPN7ExDEGQ54gNcEQb7jC1JJ5zgrwE38tu+uYbw@mail.gmail.com>
Subject: Re: [PATCH 01/10] media: ioctl: Simulate v4l2_queryctrl with v4l2_query_ext_ctrl
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mike Isely <isely@pobox.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Dec 2024 at 21:02, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Hans
>
> On Mon, 9 Dec 2024 at 20:34, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > On 09/12/2024 20:25, Ricardo Ribalda wrote:
> > > v4l2_queryctrl is a subset of v4l2_query_ext_ctrl. If the driver does
> > > not implement v4l2_queryctrl we can implement it with
> > > v4l2_query_ext_ctrl.
> > >
> > > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-dev.c   |  3 ++-
> > >  drivers/media/v4l2-core/v4l2-ioctl.c | 22 +++++++++++++++++++++-
> > >  2 files changed, 23 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > > index 5bcaeeba4d09..252308a67fa8 100644
> > > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > > @@ -572,7 +572,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
> > >          and that can't be tested here. If the bit for these control ioctls
> > >          is set, then the ioctl is valid. But if it is 0, then it can still
> > >          be valid if the filehandle passed the control handler. */
> > > -     if (vdev->ctrl_handler || ops->vidioc_queryctrl)
> > > +     if (vdev->ctrl_handler || ops->vidioc_queryctrl ||
> > > +         ops->vidioc_query_ext_ctrl)
> > >               __set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
> > >       if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
> > >               __set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 0304daa8471d..a5562f2f1fc9 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -2284,9 +2284,11 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
> > >                               struct file *file, void *fh, void *arg)
> > >  {
> > >       struct video_device *vfd = video_devdata(file);
> > > +     struct v4l2_query_ext_ctrl qec;
> > >       struct v4l2_queryctrl *p = arg;
> > >       struct v4l2_fh *vfh =
> > >               test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> > > +     int ret;
> > >
> > >       if (vfh && vfh->ctrl_handler)
> > >               return v4l2_queryctrl(vfh->ctrl_handler, p);
> > > @@ -2294,7 +2296,25 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
> > >               return v4l2_queryctrl(vfd->ctrl_handler, p);
> > >       if (ops->vidioc_queryctrl)
> > >               return ops->vidioc_queryctrl(file, fh, p);
> > > -     return -ENOTTY;
> > > +     if (!ops->vidioc_query_ext_ctrl)
> > > +             return -ENOTTY;
> > > +
> > > +     /* Simulate query_ext_ctr using query_ctrl. */
> > > +     qec.id = p->id;
> > > +     ret = ops->vidioc_query_ext_ctrl(file, fh, &qec);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     p->id = qec.id;
> > > +     p->type = qec.type;
> > > +     strscpy(p->name, qec.name, sizeof(p->name));
> > > +     p->minimum = qec.minimum;
> > > +     p->maximum = qec.maximum;
> > > +     p->step = qec.step;
> > > +     p->default_value = qec.default_value;
> > > +     p->flags = qec.flags;
> >
> > That's not quite correct. See v4l2_queryctrl() in v4l2-ctrls-api.c
> > on how to do this: for types that VIDIOC_QUERYCTRL doesn't support,
> > some of these fields must be set to 0.
> >
> > In fact, once vidioc_queryctrl has been removed, then you can also
> > remove v4l2_queryctrl() and just rely on this code. Unless I missed
> > something.
>
> Thanks for the mega-fast review :)
>
> I do not think that we can easily remove v4l2_queryctrl(). It is still
> called by v4l2-subdev.c
>
> We could do something to remove the code duplication... but it will
> probably make the code more difficult to follow.
>
> I will send a new version with the fix that you proposed, as well as:
>
> -- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2290,10 +2290,6 @@ static int v4l_queryctrl(const struct
> v4l2_ioctl_ops *ops,
>                 test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
>         int ret;
>
> -       if (vfh && vfh->ctrl_handler)
> -               return v4l2_queryctrl(vfh->ctrl_handler, p);
> -       if (vfd->ctrl_handler)
> -               return v4l2_queryctrl(vfd->ctrl_handler, p);
>         if (!ops->vidioc_query_ext_ctrl)
>                 return -ENOTTY;

Actually we cannot remove these four lines. I have a set ready with a helper....
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/commits/queryctrl
Not sure if it is better with or without the helper.

Will send it tomorrow if I do not have more feedback.

Best rergards!


>
> >
> > Regards,
> >
> >         Hans
> >
> > > +
> > > +     return 0;
> > >  }
> > >
> > >  static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
> > >
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
