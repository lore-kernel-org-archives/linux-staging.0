Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9D828E2;
	Wed, 15 Mar 2023 08:59:41 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id x11so19261444pln.12;
        Wed, 15 Mar 2023 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678870780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIKnOPkj8qC3z1y/KVPXPT/wWMpHW0zTQSBUf9tEOlc=;
        b=fO+uORb/w5iZoll6ztqXnKYfVc7IgS0+xIs2RUdwXD3SPJc2bdbfZLsKd5T4GqRMCa
         sGKaJ48q2QfbMShI7xwKQLAmzXMorlrXh2Bpv3I4jkO0F8Z/ozQIHfqOOsoxaLCAzxzN
         LwLRphaCiSLke2N5xyoK0/P3pAh0paoIZp5Tv3dXROWs/gp12kFhJJj9rAQvBXgZtt9M
         e7P0m+K7fGnEoO1pRlumBOC0sJrHNAC+zYbjL8OMztW8/41qjIqYbH+PVMipFrvLGQKe
         ds7jAf4zjRgszkSDSk9d8/WPhq1N9HloGEG3rukT7nkV1cWhosycZvDVOhrvwuCA9yFH
         F7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678870780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIKnOPkj8qC3z1y/KVPXPT/wWMpHW0zTQSBUf9tEOlc=;
        b=lN8lF+Djj8InKD9b3EepmDvYGkDgWxysNQr/DhW78hsY2PZhoeq/hie2Hh23w6IlYK
         L1FKw8HenDZKvKS+RjE/d/aWztYbqIyeJXE7LUr2admZapR4AF8stWnU/2L4Vmbom4VP
         yjeRPQ8yux/eN0i25AnqjRVpqGRNh/pRKCZEd+1ntsexCX7GrMRa8nk7gYqI/Y57wjdP
         gUA7clWlh0lKy9yGF4fVVvCZovtOWPzDd0h+aBQ8v3q9AYnVq9KVE9JkFumFqgORlt5b
         2AGnYK2U9asoGPNL1iuKT9g0BJ0zblS8r2wGlIdzvcGn9oTYC+9lwGmw+R1a4JmrvO9y
         Ry6w==
X-Gm-Message-State: AO0yUKWZ2C3wMpSpi9tzUf0SKosEAfTFv4qj/YmZwoXuENNAFhpHt31+
	u8gPXlMwLWX5MeFNHuk+bbIgteKXr+vIwE1aJP4=
X-Google-Smtp-Source: AK7set8hOZJn6EE53swyCwcO/i6/tetWkkPQbwjyqZXoxq6SywsStUtUgLnMSnNnW70XMMRVDC+QZ+7/wmRODW1UeB4=
X-Received: by 2002:a17:902:dac3:b0:1a0:503a:2a42 with SMTP id
 q3-20020a170902dac300b001a0503a2a42mr875498plx.12.1678870780567; Wed, 15 Mar
 2023 01:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230313163120.3741811-1-zyytlz.wz@163.com> <2274018.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <2274018.ElGaqSPkdT@jernej-laptop>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Wed, 15 Mar 2023 16:59:29 +0800
Message-ID: <CAJedcCwxbiEv4cOEyWpgrNNLZybP4O8Ubu6hpiMpmg1wL8xP1g@mail.gmail.com>
Subject: Re: [PATCH v2] media: cedrus: fix use after free bug in cedrus_remove
 due to race condition
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: mchehab@kernel.org, Zheng Wang <zyytlz.wz@163.com>, hverkuil@xs4all.nl, 
	wens@csie.org, samuel@sholland.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	1395428693sheep@gmail.com, alex000young@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jernej =C5=A0krabec <jernej.skrabec@gmail.com> =E4=BA=8E2023=E5=B9=B43=E6=
=9C=8815=E6=97=A5=E5=91=A8=E4=B8=89 03:53=E5=86=99=E9=81=93=EF=BC=9A
>
> Dne ponedeljek, 13. marec 2023 ob 17:31:20 CET je Zheng Wang napisal(a):
> > In cedrus_probe, dev->watchdog_work is bound with cedrus_watchdog funct=
ion.
> > In cedrus_device_run, it will started by schedule_delayed_work. If ther=
e is
> > an unfinished work in cedrus_remove, there may be a race condition and
> > trigger UAF bug.
> >
> > CPU0                  CPU1
> >
> >                     |cedrus_watchdog
> >
> > cedrus_remove       |
> >   v4l2_m2m_release  |
> >   kfree(m2m_dev)    |
> >
> >                     | v4l2_m2m_get_curr_priv
> >                     |
> >                     |   m2m_dev //use
> >
> > Fix it by canceling the worker in cedrus_remove.
> >
> > Fixes: 7c38a551bda1 ("media: cedrus: Add watchdog for job completion")
> > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> > ---
> > v2:
> > - use cancel_delayed_work_sync instead and add Fixes
> > label suggested by Hans Verkuil
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>

Thanks for your review.

Best regards,
Zheng

> Best regards,
> Jernej
>
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus.c index
> > a43d5ff66716..a50a4d0a8f71 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > @@ -547,6 +547,7 @@ static int cedrus_remove(struct platform_device *pd=
ev)
> >  {
> >       struct cedrus_dev *dev =3D platform_get_drvdata(pdev);
> >
> > +     cancel_delayed_work_sync(&dev->watchdog_work);
> >       if (media_devnode_is_registered(dev->mdev.devnode)) {
> >               media_device_unregister(&dev->mdev);
> >               v4l2_m2m_unregister_media_controller(dev->m2m_dev);
>
>
>
>
