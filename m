Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2E472
	for <linux-staging@lists.linux.dev>; Fri, 11 Jun 2021 15:24:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB85B61403
	for <linux-staging@lists.linux.dev>; Fri, 11 Jun 2021 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623425096;
	bh=h5v5mpPZpAdxaOOuc1mdv3YurlLnt2ZVCrJ87OsX/z8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XTVBJLor2Bnx69tQeof/182DvHf7bID2GXiyeooMqCd+JAW3xEfp66v3jzmUKU+d3
	 7L5smISQz7ehZa9HZ838njig+cA7P1kwQP2sOdYpilEbuINzwSZLFDkK21CIeFxxR1
	 Ymm+7EQdmgbwKseLfFtpizpy1xiu6tLimNVZDE1PbtbpYOdbKNaB9O76/nne17Jtkw
	 AuD6a9aKbDdpYfhxD0BD84RWIKNBKjOMuFLn6M4Z3NJ6l8na4Nw8Xd/qIIx83e/Y4f
	 i6mfp2Hr6YxeI/K1GwxgN3qZWQa2+R4Yn+hXqXgS641KAki+4y+TlhCtHbJDkNVYB7
	 L3Zn32jrJxgiA==
Received: by mail-wm1-f41.google.com with SMTP id y13-20020a1c4b0d0000b02901c20173e165so854014wma.0
        for <linux-staging@lists.linux.dev>; Fri, 11 Jun 2021 08:24:55 -0700 (PDT)
X-Gm-Message-State: AOAM530VQkIMUnM1d6bWM+AXxi4XNIvLwIC0DcGZiiv4gbapxmTdzRea
	A/YcXc6MeI+udWCv4IiY0izECLliuJi4D2mdu64=
X-Google-Smtp-Source: ABdhPJzX5ckxkkaHh0ypB0h7rHCKzhHJn1qoMKJtaN5VyA0ymHIn59lIKcBaaQUCr7r+rOKkDRPmKMKy7sfPkQc3BC4=
X-Received: by 2002:a7b:c849:: with SMTP id c9mr21060291wml.84.1623425094453;
 Fri, 11 Jun 2021 08:24:54 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210610214305.4170835-1-arnd@kernel.org> <20210610214305.4170835-3-arnd@kernel.org>
 <a59eeddd-34bb-6b84-06b3-9fb1934d447e@xs4all.nl>
In-Reply-To: <a59eeddd-34bb-6b84-06b3-9fb1934d447e@xs4all.nl>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 11 Jun 2021 17:22:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2XbiU9SdafUapKABXJes8C5roLGKynL5LnGfTN3n=Evw@mail.gmail.com>
Message-ID: <CAK8P3a2XbiU9SdafUapKABXJes8C5roLGKynL5LnGfTN3n=Evw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] media: v4l2-core: explicitly clear ioctl input data
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Gupta <vaibhavgupta40@gmail.com>, 
	Liu Shixin <liushixin2@huawei.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 11, 2021 at 2:05 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 10/06/2021 23:43, Arnd Bergmann wrote:
> > @@ -3122,12 +3122,23 @@ static int video_get_user(void __user *arg, void *parg,
> >
> >       if (cmd == real_cmd) {
> >               if (copy_from_user(parg, (void __user *)arg, n))
> > -                     err = -EFAULT;
> > -     } else if (in_compat_syscall()) {
> > -             err = v4l2_compat_get_user(arg, parg, cmd);
> > -     } else {
> > -             switch (cmd) {
> > +                     return -EFAULT;
> > +
> > +             /* zero out anything we don't copy from userspace */
> > +             if (n < _IOC_SIZE(real_cmd))
> > +                     memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
>
> This should always happen, not just when cmd == real_cmd.

Ok, got it. I was trying to simplify this, but I went a little too far, so
in the case of VIDIOC_QUERYBUF_TIME32 I dropped the final
clearing of the extra data, leaving the user data in place.

> The comment is a bit misleading: besides zeroing what isn't copied from
> userspace, it also zeroes copied fields based on INFO_FL_CLEAR_MASK.

I'm not following here, isn't that the same? We copy 'n' bytes, and then we
clear 'size - n' bytes, which is everything that wasn't copied.

> With this change that no longer happens and v4l2-compliance starts complaining.
>
> > +
> > +             return 0;
> > +     }
> > +
> > +     /* zero out whole buffer first to deal with missing emulation */
> > +     memset(parg, 0, _IOC_SIZE(real_cmd));
> > +
> > +     if (in_compat_syscall())
> > +             return v4l2_compat_get_user(arg, parg, cmd);
> > +
> >  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
> > +     switch (cmd) {
> >               case VIDIOC_QUERYBUF_TIME32:
> >               case VIDIOC_QBUF_TIME32:
> >               case VIDIOC_DQBUF_TIME32:
>
> The 'case' statements need to be indented one tab less.

It seems this is no longer needed when I go back to having the switch()
inside the else{}.

> > @@ -3140,28 +3151,24 @@ static int video_get_user(void __user *arg, void *parg,
> >
> >                       *vb = (struct v4l2_buffer) {
> >                               .index          = vb32.index,
> > -                                     .type           = vb32.type,
> > -                                     .bytesused      = vb32.bytesused,
> > -                                     .flags          = vb32.flags,
> > -                                     .field          = vb32.field,
> > -                                     .timestamp.tv_sec       = vb32.timestamp.tv_sec,
> > -                                     .timestamp.tv_usec      = vb32.timestamp.tv_usec,
> > -                                     .timecode       = vb32.timecode,
> > -                                     .sequence       = vb32.sequence,
> > -                                     .memory         = vb32.memory,
> > -                                     .m.userptr      = vb32.m.userptr,
> > -                                     .length         = vb32.length,
> > -                                     .request_fd     = vb32.request_fd,
> > +                             .type           = vb32.type,
> > +                             .bytesused      = vb32.bytesused,
> > +                             .flags          = vb32.flags,
> > +                             .field          = vb32.field,
> > +                             .timestamp.tv_sec       = vb32.timestamp.tv_sec,
> > +                             .timestamp.tv_usec      = vb32.timestamp.tv_usec,
> > +                             .timecode       = vb32.timecode,
> > +                             .sequence       = vb32.sequence,
> > +                             .memory         = vb32.memory,
> > +                             .m.userptr      = vb32.m.userptr,
> > +                             .length         = vb32.length,
> > +                             .request_fd     = vb32.request_fd,
>
> Can you put these whitespace changes in a separate patch?

Sure.

> I ended up with this code, and then my tests passed:
>
>        if (cmd == real_cmd) {
>                 if (copy_from_user(parg, (void __user *)arg, n))
>                         return -EFAULT;
>         } else if (in_compat_syscall()) {
>                 memset(parg, 0, n);
>                 err = v4l2_compat_get_user(arg, parg, cmd);
>         } else {
> #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>                 memset(parg, 0, n);
>                 switch (cmd) {
>                 case VIDIOC_QUERYBUF_TIME32:
>                 case VIDIOC_QBUF_TIME32:
>                 case VIDIOC_DQBUF_TIME32:
>                 case VIDIOC_PREPARE_BUF_TIME32: {
>                         struct v4l2_buffer_time32 vb32;
>                         struct v4l2_buffer *vb = parg;
>
>                         if (copy_from_user(&vb32, arg, sizeof(vb32)))
>                                 return -EFAULT;
>
>                         *vb = (struct v4l2_buffer) {
>                                 .index          = vb32.index,
>                                         .type           = vb32.type,
>                                         .bytesused      = vb32.bytesused,
>                                         .flags          = vb32.flags,
>                                         .field          = vb32.field,
>                                         .timestamp.tv_sec       = vb32.timestamp.tv_sec,
>                                         .timestamp.tv_usec      = vb32.timestamp.tv_usec,
>                                         .timecode       = vb32.timecode,
>                                         .sequence       = vb32.sequence,
>                                         .memory         = vb32.memory,
>                                         .m.userptr      = vb32.m.userptr,
>                                         .length         = vb32.length,
>                                         .request_fd     = vb32.request_fd,
>                         };
>                         break;
>                 }
>                 }
> #endif
>         }
>
>         /* zero out anything we don't copy from userspace */
>         if (!err && n < _IOC_SIZE(real_cmd))
>                 memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
>
>         return err;

Ok, so this version just adds the two memset(), without any other
changes. That is clearly the safest change, and I'll send it like this
in v3.

> That said, I also ran the regression tests on a i686 VM, and there I got a
> bunch of failures, but that was *without* your patches, so I think something
> unrelated broke. I'll have to dig more into this in the next few days.
>
> But I wanted to get this out first, since this patch is clearly wrong.

Thanks a lot for taking a look and giving it an initial test. I have
updated the git tree at

git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git
playground/v4l2-compat-ioctl

with the changes you pointed out. Let me know when you have found
out what was going on in the VM guest, and I'll send it as v3 or integrate
additional fixes that you find necessary.

     Arnd
