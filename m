Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C443A110D
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:11:14 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id g21so1238208qka.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lEZBf5387b/IcGftjc6Ta+buddrM2qanjqr8oAzK+a4=;
        b=NWjr6NGK1ZsB9Arf+R0br2abbPtWKmE9iEhd2LqJzb1wIvaD0TaMofWMFOKKZG/52G
         TMEaH0/Rim8/8dnd6KlaffH9BXbFwqZl/lSKTogz5g7NdUO7khN8fbHRTxbGwUwcveDR
         r3gUzjRVaJy8dawNeHOOu3fTYPYEmcWIGS1qXEE7A8kQOuMmlEe6jI+ypG0TokcIvd8I
         5IX83jA6WoVZH86nbhmAOxSCUdZVl/Fx7VuJMD1w5osJwHwnRUk6BH9MC4rNmNMoOrBV
         zHFF/5KKz4uZnUxWsl4+yM5KtIorpJMGGcFuFqpS3HZi+t5hSCYGf8EiVTwWLk1IQ903
         d4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lEZBf5387b/IcGftjc6Ta+buddrM2qanjqr8oAzK+a4=;
        b=TFcgyxNl1ybDwtI8jRyKRTPUnHTZV6OxUAXv7JfcQZ0FQ/PMItZwPKWNM6jTabK2fj
         FzuFV+Nyf3/zLiUZdody/3YoAX/iqOVQAe/nKi7Eq2sXvASoaS8VLHwVfRJjm+3LQbcV
         0B7wocpj86aC8rXxu0YBkxiH3KwQpBK9urmNFGj89oKzuSctVIY605TyKCFPg33ExdJp
         izwES3Wbhl+eJt9I/30KtSqp4WuTl4LZ1XxKA3b72zXnhiU7sbYttZrPg2/59UvTud5I
         lrMItlvb9KayoRwapMfGejz6eS9igIOnaYQg7O9V6Y1Gz7tZzgvMwOtl9M87KBYG8YfC
         DBYA==
X-Gm-Message-State: ACgBeo3FOpt2Ec+k4jVQHiL/O2CuZEOZwve5zxiYQrNn6dRE/teSJw/D
	yrJjVHGfPdA/t3j6qRZnfl8nLsq9Cn5D6m6Vxgw=
X-Google-Smtp-Source: AA6agR43+S/HlMPFCV3gOAajzuirEQx6jnsl2ia36BsxPKvZ3S952xNdqUAyVtvKJpk3iyXp7vwC2kupf8CMOUvgiYo=
X-Received: by 2002:ae9:e311:0:b0:6ba:e711:fb27 with SMTP id
 v17-20020ae9e311000000b006bae711fb27mr22636792qkf.320.1662109873634; Fri, 02
 Sep 2022 02:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220901094626.11513-1-hdegoede@redhat.com> <20220901094626.11513-11-hdegoede@redhat.com>
 <YxEOhy0YPnBuZiQs@smile.fi.intel.com> <ce0d2ec6-3ec7-9f9f-59f9-0bf2a6078c9c@redhat.com>
In-Reply-To: <ce0d2ec6-3ec7-9f9f-59f9-0bf2a6078c9c@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Sep 2022 12:10:37 +0300
Message-ID: <CAHp75Vf=_2yJdPvpkx2iYoYOPzxf6sNMBD4EizYc1WAnFMWYtg@mail.gmail.com>
Subject: Re: [PATCH 10/14] media: atomisp: Register /dev/* nodes at the end of atomisp_pci_probe()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, 
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 12:04 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 9/1/22 21:56, Andy Shevchenko wrote:
> > On Thu, Sep 01, 2022 at 11:46:22AM +0200, Hans de Goede wrote:

...

> >>                      for (; i > 0; i--)
> >>                              atomisp_subdev_unregister_entities(
> >>                                  &isp->asd[i - 1]);
> >
> > This...
>
> I presume you mean the few lines above that actually:

No, I cited a not modified code in the upper part. That said, it's a
remark for further improvements, but a helper can be introduced in
this patch due to the below part.

> >> +    for (i = 0; i < isp->num_of_streams; i++) {
> >> +            err = atomisp_subdev_register_video_nodes(&isp->asd[i], &isp->v4l2_dev);
> >> +            if (err)
> >> +                    return err;
> >> +    }
> >
> > ...and this looks like a dup.

-- 
With Best Regards,
Andy Shevchenko
