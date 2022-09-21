Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862DF2F5D
	for <linux-staging@lists.linux.dev>; Wed, 21 Sep 2022 11:52:51 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id d17so3696842qko.13
        for <linux-staging@lists.linux.dev>; Wed, 21 Sep 2022 04:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ztkPTO/3zU/fJZBp6GXCzLEpY4apMVewC69u7Jq+BZk=;
        b=Lj9+97UtsVnIpvWkTLMUo5DyhqQmqyfjAgbB0D6Okckthx/OCCu6+bhu62wkTSS80W
         uhBhUlBTMod54/ufWbRPPP0XEor38J0Izelzj3lb8qWrIN/6fcAP/ZuucifA0rZS2+Nf
         WzZ2Uk+2xr9lZn3J3CDqAcYoCOdjQrRb1Z6Z5Nq2VTDCtDDaFBnD2ktbJC6awD9WQCFt
         /VRul031IOoGceMGLtarlR6edIgUJFW1HNH0Knz7Rc1UWWPwaYATn7m/FI0LfnhXCTE7
         UbZ/Ti1JrsaxT+bF+mNhR8UREMnYUMhw23nywg4Q+S0Xu2W0qWP7h8ZsuRwYRKYhAesT
         eqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ztkPTO/3zU/fJZBp6GXCzLEpY4apMVewC69u7Jq+BZk=;
        b=FupPjxI8rjsaLBi+wDXs0hmIybB0bARi5oDdDc2F1jJagDtIzlLzyCIees4XguD2UV
         whRnSr/mFCOGl0oYRf59dTAoSZ6yauo9L32rrpHyuM53Fc9ysU/dib/jPn5VV0PBJWpq
         Ooe4MAvwq9Cg5x8esbZkasegFNHA4mAdapyESl/eHOwBOLVTEBOu5vzP2EFnAZhsuMor
         F8DU/VgR4Sh9kBKeiQMi2UBH/6YSYA5QhV/lPkWir+bfVXQtLJT7AHeGhNLbjyMSUV/x
         9RJ/kIl/dJDOwdOg5TfApXYUyX+78qbRTocsBLt2rL7rEyUD+zondT5euf27ZIiRtwem
         qeYg==
X-Gm-Message-State: ACrzQf3soTdt9EobsQ82DzAPnK11W9jBf4JAhfvocgbyBMPBUXtFhr2j
	84Pis0wPAYHICIEvTuOolDgP8PhpNlfzbTTDN3c=
X-Google-Smtp-Source: AMsMyM4Y4moSUGLwnzoqwyA5tgcCeV4jlTGsC8LbF/rWVJ8jxHFZxUwnvolthuiSFRE2M59BDF5+C2VPd82iMb3R5Lw=
X-Received: by 2002:a05:620a:4454:b0:6ce:bfbf:7e3f with SMTP id
 w20-20020a05620a445400b006cebfbf7e3fmr18022702qkp.748.1663761170354; Wed, 21
 Sep 2022 04:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220911171653.568932-1-hdegoede@redhat.com> <20220911171653.568932-2-hdegoede@redhat.com>
 <Yx8T/uEKvVDoCvsT@smile.fi.intel.com> <c52e1abb-0796-b88a-4a94-fa14c09ffcfe@redhat.com>
In-Reply-To: <c52e1abb-0796-b88a-4a94-fa14c09ffcfe@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Sep 2022 14:52:14 +0300
Message-ID: <CAHp75VdvAWQ3OyP3eXFot7VB8a_pf5SmjbceZREDxz4fDWcT2Q@mail.gmail.com>
Subject: Re: [PATCH 01/17] media: atomisp: Use a normal mutex for the main lock
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 21, 2022 at 11:52 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 9/12/22 13:11, Andy Shevchenko wrote:
> > On Sun, Sep 11, 2022 at 07:16:37PM +0200, Hans de Goede wrote:
> >> There is no reason for atomisp to use a rt_mutex instead of a normal
> >> mutex, so switch over to a normal mutex.
> >>
> >> All the changes in this patch are just s/rt_mutex/mutex/.
> >>
> >> This is a preparation patch for switching the ioctl locking over
> >> to using the video_dev.lock member so that the v4l2-core takes
> >> care of the locking.
> >
> > So the idea behind rt_mutex here is to inherit the priority on the task.
>
> Right.
>
> > I'm wondering what could be possible the bottle neck this is trying to
> > solve.
>
> I don't think there is any specific reasoning behind the code using
> this. The atomisp code is quite questionable in lots of cases and
> I have a feeling this was just a case of "oh this sounds like
> it is faster, lets use this" .

Honestly, this is exactly what is my attitude towards the AtomISP2
codebase. But I asked to be sure that you probably investigated that
more.

> > If there is no other V4L2 driver that does the same, any specific
> > run flow of AtomISP v2 code that may suffer of this?
>
> See above.


-- 
With Best Regards,
Andy Shevchenko
