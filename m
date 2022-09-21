Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C8A2F5D
	for <linux-staging@lists.linux.dev>; Wed, 21 Sep 2022 11:56:20 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id j10so3850880qtv.4
        for <linux-staging@lists.linux.dev>; Wed, 21 Sep 2022 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vDQAo0FftNWAg5dSgRf/ecqLD71uxoc/p0XeSOEV4IM=;
        b=AcVnvpyfFEAhqR1PQRriSSMZhCKzP58O/fTUE0empqiQMLeMu/oDMq9D8EhaNIFt2U
         Xj+KC1xgritpaStDk7y77AecLEE1FGJePjTII1uooSTvzu59JqX574biMaQE75Mke4u8
         RVZXl5a9qvKg++U+IdkoI8rikjKM+5c0dWPxf3+QY/4YsdhjeIvX7q9gsrg6N6Ef7Wi0
         UQzvU4xkDgy+rt1P0+Qh7DTFTyRMy+8LaIO+AupXzjY/QDDlVg5gqipVymCSa+M+mRph
         9EXQ7hDp6HcHoUVzcQeRi1daHscFyblSDV58PAxj/y2v+wF87EO+3YACTYdhhUMww45H
         zLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vDQAo0FftNWAg5dSgRf/ecqLD71uxoc/p0XeSOEV4IM=;
        b=Z4ZUnNhHGlKuGcX8AdVcFqQv4xrI1ANh9ia5Qhb+6doVofXx/QTU95VnA2vCaklSKN
         2opUaOO9XwIbdxjHrSTu8h2MwgfXXW3/mTvYKmCyDeELoBFH4LL0APLdHvyVy5ecNi5r
         oXxahzc4xodXYN6q8JVs1YZa+b0shpGGV9sObD8RKI0mjFduLd8/vWA6QrHIk1UeP9I3
         2fYDiemhX3yvf/Jpm1+gdZkfw5/oFImCNfyxa2WBhsyj8dBJ3++y7mbGk0Op9zQarxGl
         76nmlYCiea0qiM8dJ7zCJgXt+4LrqAohMMz2zaLrDRL7wvJlsxE1elv1d7BKzuKYFyxJ
         lrGA==
X-Gm-Message-State: ACrzQf08Xw7h/w8AEXTo8Qz3jBF4Zwb9FaVXbbmb0oRSdSGdzSSodCgw
	mX/ckYcjlvegvEgzi78JqrtAOFO6HmBWxXT/ius=
X-Google-Smtp-Source: AMsMyM611GmjQ8AO/aTa+FjSCPYE2HhB5Q3S+E2mP3gYPVMfZndXdEJ4Zm7k2GAu4/T0BTnOoLPHRcaNh7XxjjSJkdw=
X-Received: by 2002:a05:622a:1701:b0:35b:b3bb:7c4e with SMTP id
 h1-20020a05622a170100b0035bb3bb7c4emr22595897qtk.195.1663761379921; Wed, 21
 Sep 2022 04:56:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220911171653.568932-1-hdegoede@redhat.com> <20220911171653.568932-6-hdegoede@redhat.com>
 <Yx8YOj7L9V32qC7D@smile.fi.intel.com> <bc6c2ccc-98ee-c26c-a130-ba868e307eb4@redhat.com>
In-Reply-To: <bc6c2ccc-98ee-c26c-a130-ba868e307eb4@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Sep 2022 14:55:43 +0300
Message-ID: <CAHp75VfX1oJ-_aapjTtpWCoir8iSeDWH9ARkRZdJ1mzoqBCKFA@mail.gmail.com>
Subject: Re: [PATCH 05/17] media: atomisp: Add atomisp_pipe_check() helper
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 21, 2022 at 12:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 9/12/22 13:30, Andy Shevchenko wrote:
> > On Sun, Sep 11, 2022 at 07:16:41PM +0200, Hans de Goede wrote:

...

> >> +    case ATOMISP_DEVICE_STREAMING_STOPPING:
> >> +            dev_err(pipe->isp->dev, "IOCTL issued while stopping\n");
> >> +            return -EBUSY;
> >
> > Wouldn't -EAGAIN match better in this case?
>
> The original checks this replaces used -EIO (which seems like a poor
> choice) resp. -EBUSY (in the streamon callback) so I decided to
> keep the -EBUSY here.
>
> Also AFAIK -EAGAIN will make the C-library retry the syscal itself
> in some cases ? (not sure if this applies to ioctls though).
>
> This is not what we want, this scenario can only be hit when an app:
> 1. Uses both the preview and the actual capture /dev/video# nodes
>    at the same time (this is allows)
> 2. Then stops the stream at 1 of them, this transitions the state
>    to STOPPING
> 3. Then does some ioctl other then streamoff on the other /dev/video#
>
> Basically when using more then 1 /dev/video# node then the app must
> stop all of them when stopping things. The driver enforces this
> by rejecting all calls other the streamoff until all /dev/video#
> node streans are off.
>
> This means that simply trying again will result in the same error,
> so -EBUSY seems like the best error for this.

Thanks for the explanation, now it's clear to me.

-- 
With Best Regards,
Andy Shevchenko
