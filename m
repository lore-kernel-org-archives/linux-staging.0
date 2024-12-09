Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52EF199FAC
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 20:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733774548; cv=none; b=COyFHZ3pmrTuGjaQnLrKr6GfHnyU+LhE9u0rqJ7aNe1lfW0HGJ4tNHrRXvGoxyTdIn7r/F5bK9vqid9u/hstho5GMdFZabF6tdO699ni9fUb9c5qvz3w+FfZky1brmMIec9EBwi9suBdOvOirc38nJa1DWCxqOlQHa1bfZpZTiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733774548; c=relaxed/simple;
	bh=0Ayw37wUejtQ5m+rsSeIg82/mR7t7LSqI1T/BKoym3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZDI8VPiqSDxUwjnVH7N7p6Y5+pPvlTWvrsLaIjy3/5h78Y9VYHk4Zhqsfkw+hUjLYFG2psrF958NdEoA00o1/Qjp82BqWkAHMS2hL2KdMT0XmEbMX6rszFTLfj9hT2n0dvM+7QTpvkPJgmDY07T+tTyy+RZyU1X772XKJTj888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lhKmBHGq; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lhKmBHGq"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-725e71a11f7so1151401b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 12:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733774546; x=1734379346; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=33O92irM5rjPnkOEmFcL92w9iQOp7kWbD3T8HmnoBQA=;
        b=lhKmBHGqSzfK8kQthJhSyYf7OkCFucXisjD+EwExKRCI4xkAJBcuJOiWitRZibf/4W
         Sw7TOH4TiU5tHS2MylM/5gbv2+hNDDV+srztP6wMa9uBrXb+3PUsKLtLNVbYxWczFUpM
         XndV1vSEGczw2HX35D3F5qDioG2cZdHdi+LT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733774546; x=1734379346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33O92irM5rjPnkOEmFcL92w9iQOp7kWbD3T8HmnoBQA=;
        b=lFiGaDxBh6XRVmiOSBeK7HC/L2teCw+yAjca2JG/VCyr6iHSuLUC6fD5i06hsLdJV1
         0PwIUyVXiAovFtQDZaKtKuJ/gkqmsGqxw65zloWuqbIJvCFWnz+X5dpC80wG28EUuV61
         Hb58Y+Rze+u/sOd5v75a4rQlF1I1XgSrZtcpPKX0WNFjHp/fz3W4Pxx7vMVOwI7GqqWf
         6DczfEosAEpk+7CaGcDuuEn2VL/vRIOqCQSwrbgFFmNC9ExJQsM/bvO7LKpBNacV62yb
         PUr/mz/1gduSDLsqACLKw+4s9wLvodRV7zICkUWCTSCjnsL4NLeXCuORn/kw8ZsMpS1C
         HpfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbhbvb5FRk3P+zBwXJbVOSoWSeD1M8fbBHki+nYJZSaivdVCTUerGBeds9X+V/pmRWGUUpVs550BW4XUrL@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3cdrbqRTIRKWUG3D5nm+92Ymwmv4KSEI5Lp6Q9vsp6PjLrHM+
	3zvvxT/vmLTH9VzmHB8jeSeItXzaPhqfb7DuhrLsn9nel0cVFVdwONH2M1CB92nrNtQVpN9S0Pk
	=
X-Gm-Gg: ASbGncvzQJU/kH8S5bWJD8iMCMaRYZU/dD6k/1BxK12ewNCxL0d+OutltypdeNr1Dzk
	+7EpImLNb0PpUDhkT2oteQW9M2jQ3T2HFq4zO6auZcRHjmoI1yaL+mfZnTJjF4ZEWgOyaFZ4gfy
	G2M966sTAapblgW4pVmqff9PTiFPzVy8P80J5xula9qH/MOj4EiEhqp1rh+f2FJTYJr6mAKX/Pm
	AyB2EXht6CdK9VuZhQfQGjH+/09GELmSUo5oDrNvn5VkJjEPQQawmy7j8wm9VupEpkqOrMR3g5T
	dVLUHH1B1KtJJmHeNB9Q
X-Google-Smtp-Source: AGHT+IGuDFccumBKUGD2MSYmFvBPmQvK/CPyIe0HPXOMedigpwnFe3kEXxF69mH7x047xLsVwJqfIA==
X-Received: by 2002:a05:6a00:17a9:b0:725:e957:1de6 with SMTP id d2e1a72fcca58-7288986bad3mr712876b3a.13.1733774545791;
        Mon, 09 Dec 2024 12:02:25 -0800 (PST)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29eb23esm7977458b3a.76.2024.12.09.12.02.23
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 12:02:24 -0800 (PST)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd377ff3c5so1881405a12.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 12:02:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwkxSyQdQI8OSh03H9zPPBW7aDaZjYoIt6pMSyUXbxwwoKTFwZL2g3JxmGnMUKJue7uo8FwPyj8sJn+plS@lists.linux.dev
X-Received: by 2002:a17:90b:50e:b0:2ef:6cbd:3c0b with SMTP id
 98e67ed59e1d1-2efd5869946mr938178a91.3.1733774543037; Mon, 09 Dec 2024
 12:02:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
 <20241209-queryctrl-v1-1-deff7acfcdcb@chromium.org> <4bd4796f-858a-48f7-9b32-ef6991ebe194@xs4all.nl>
In-Reply-To: <4bd4796f-858a-48f7-9b32-ef6991ebe194@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 9 Dec 2024 21:02:11 +0100
X-Gmail-Original-Message-ID: <CANiDSCt_rpf=RjTYR+Fmy4fsWb0z6J5NU7iKrERDmvUrcxZwig@mail.gmail.com>
X-Gm-Features: AZHOrDlRlIITa-MC0kxLj6pBufnFBS38Pperkg5q-RePWpzWtd1V-2fTVWLSvh4
Message-ID: <CANiDSCt_rpf=RjTYR+Fmy4fsWb0z6J5NU7iKrERDmvUrcxZwig@mail.gmail.com>
Subject: Re: [PATCH 01/10] media: ioctl: Simulate v4l2_queryctrl with v4l2_query_ext_ctrl
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mike Isely <isely@pobox.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 9 Dec 2024 at 20:34, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 09/12/2024 20:25, Ricardo Ribalda wrote:
> > v4l2_queryctrl is a subset of v4l2_query_ext_ctrl. If the driver does
> > not implement v4l2_queryctrl we can implement it with
> > v4l2_query_ext_ctrl.
> >
> > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-dev.c   |  3 ++-
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 22 +++++++++++++++++++++-
> >  2 files changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > index 5bcaeeba4d09..252308a67fa8 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -572,7 +572,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
> >          and that can't be tested here. If the bit for these control ioctls
> >          is set, then the ioctl is valid. But if it is 0, then it can still
> >          be valid if the filehandle passed the control handler. */
> > -     if (vdev->ctrl_handler || ops->vidioc_queryctrl)
> > +     if (vdev->ctrl_handler || ops->vidioc_queryctrl ||
> > +         ops->vidioc_query_ext_ctrl)
> >               __set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
> >       if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
> >               __set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 0304daa8471d..a5562f2f1fc9 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -2284,9 +2284,11 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
> >                               struct file *file, void *fh, void *arg)
> >  {
> >       struct video_device *vfd = video_devdata(file);
> > +     struct v4l2_query_ext_ctrl qec;
> >       struct v4l2_queryctrl *p = arg;
> >       struct v4l2_fh *vfh =
> >               test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> > +     int ret;
> >
> >       if (vfh && vfh->ctrl_handler)
> >               return v4l2_queryctrl(vfh->ctrl_handler, p);
> > @@ -2294,7 +2296,25 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
> >               return v4l2_queryctrl(vfd->ctrl_handler, p);
> >       if (ops->vidioc_queryctrl)
> >               return ops->vidioc_queryctrl(file, fh, p);
> > -     return -ENOTTY;
> > +     if (!ops->vidioc_query_ext_ctrl)
> > +             return -ENOTTY;
> > +
> > +     /* Simulate query_ext_ctr using query_ctrl. */
> > +     qec.id = p->id;
> > +     ret = ops->vidioc_query_ext_ctrl(file, fh, &qec);
> > +     if (ret)
> > +             return ret;
> > +
> > +     p->id = qec.id;
> > +     p->type = qec.type;
> > +     strscpy(p->name, qec.name, sizeof(p->name));
> > +     p->minimum = qec.minimum;
> > +     p->maximum = qec.maximum;
> > +     p->step = qec.step;
> > +     p->default_value = qec.default_value;
> > +     p->flags = qec.flags;
>
> That's not quite correct. See v4l2_queryctrl() in v4l2-ctrls-api.c
> on how to do this: for types that VIDIOC_QUERYCTRL doesn't support,
> some of these fields must be set to 0.
>
> In fact, once vidioc_queryctrl has been removed, then you can also
> remove v4l2_queryctrl() and just rely on this code. Unless I missed
> something.

Thanks for the mega-fast review :)

I do not think that we can easily remove v4l2_queryctrl(). It is still
called by v4l2-subdev.c

We could do something to remove the code duplication... but it will
probably make the code more difficult to follow.

I will send a new version with the fix that you proposed, as well as:

-- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2290,10 +2290,6 @@ static int v4l_queryctrl(const struct
v4l2_ioctl_ops *ops,
                test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
        int ret;

-       if (vfh && vfh->ctrl_handler)
-               return v4l2_queryctrl(vfh->ctrl_handler, p);
-       if (vfd->ctrl_handler)
-               return v4l2_queryctrl(vfd->ctrl_handler, p);
        if (!ops->vidioc_query_ext_ctrl)
                return -ENOTTY;

>
> Regards,
>
>         Hans
>
> > +
> > +     return 0;
> >  }
> >
> >  static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
> >
>


-- 
Ricardo Ribalda
