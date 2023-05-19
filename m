Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C436AA0
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:19:42 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-75788255892so155644585a.0
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684491581; x=1687083581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TOOnGY6/7gbApavboZs3pH4Q/1VjbXN7/OaowXsj4E=;
        b=saKCCx6itui34N6KgF9b+gu5YY8tKBMEVp/tI7MobXPz67zSWkf5ekD7kU0GIAtjfS
         dGI/fGInZgBvhjpDmbesWrok0cjuXCfTppaota/SPoKqeATxwTOaJbwLT+zR6Kb0v+w4
         2XEcSR+ofx3FDAe3gYKZLkOqhxbnqNZ00J+dqF6K7KgNMT24sP1Sad88ctbRpsPUSC08
         LbuByaYoB7PmbAz6VhQXs2OyVhRflAJSa0alMzvff9EsQgjWPPovqpqp7SbPEnZ3H+fM
         L522JGMhpB2uiFxWUvysJ4O9TdyGUzYIv38MglKWO9AWBfSnNKxFwW3EWyPwkea3TzCR
         +TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684491581; x=1687083581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TOOnGY6/7gbApavboZs3pH4Q/1VjbXN7/OaowXsj4E=;
        b=dwm/v5qD40U8DQOkZsAU2C5qJFIGBnRW0aqWy2W7AXLmaiuIo0Y0MVlbv61zsOTfD+
         kG6VJV/98Q9HTnzMxXv2CIw6PnguXdtA1Yt6fYvJXkAJadhSKrFP2EjT9MZCCw5ZpgO4
         2bWwYR35Ve4BYXFywE5hFp9JPRoEsnuII5rFzUq1kSdVhWrqTG5Y9rPQubzviiFOyzeF
         X+b6zrON9czXQZVJn/Vup5qEW3waOZ8/56iebgCJG7qx+qh1HIE4/wAD73tusqv+C/E4
         rTuMfzRuBl8Bt3gEcQhLKD+UTwcgLGBEwf2jQDbpiPXRuTYWXjjce8Fg5Q4BukHHz3QF
         C56w==
X-Gm-Message-State: AC+VfDyy2GtwAvMKXaP948xs84ROAQ/+Yn9MdZ2nepOvZN8jm2rnpswp
	TFUr63Px9EnDBOtgKJe9++vO+SmXPn+XY3wga/4=
X-Google-Smtp-Source: ACHHUZ6FdAfyykBTWjU6riNW5GDcE69Mx2AOv4HrLva5VO13HnaSRr4tZ0rpwldlJSjEBE18cv5+YmvDMVWYtMOiXCk=
X-Received: by 2002:ad4:5b81:0:b0:615:a787:6d2a with SMTP id
 1-20020ad45b81000000b00615a7876d2amr3364150qvp.3.1684491581435; Fri, 19 May
 2023 03:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com> <20230518153214.194976-2-hdegoede@redhat.com>
 <CAHp75Vf6t302XpVKKgm1uyHQ5LsuqSEE+B3AGc1-ODoev77ENA@mail.gmail.com> <9375a528-8e39-304e-9b60-99ea43e16ec0@redhat.com>
In-Reply-To: <9375a528-8e39-304e-9b60-99ea43e16ec0@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 May 2023 13:19:05 +0300
Message-ID: <CAHp75VfbmhTkNz6zQNN_+ehwJXFSoy2xV3HH0mHwN00ojOZGwg@mail.gmail.com>
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper function
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 7:57=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 5/18/23 18:36, Andy Shevchenko wrote:
> > On Thu, May 18, 2023 at 6:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:

...

> >> + * Note this code uses the same DSM GUID as the INT3472 discrete.c co=
de
> >> + * and there is some overlap, but there are enough differences that i=
t is
> >> + * difficult to share the code.
> >
> > Can you add the name of the variable in that file, so likely the
> > source code indexing tool might add a link?
>
> You mean change the comment something like this:
>
>  * Note this code uses the same DSM GUID as the int3472_gpio_guid in
>  * the INT3472 discrete.c code and there is some overlap, but there are
>  * enough differences that it is difficult to share the code.
>
> I guess, where int3472_gpio_guid comes from:
>
> drivers/platform/x86/intel/int3472/discrete.c:
>
> static const guid_t int3472_gpio_guid =3D
>         GUID_INIT(0x79234640, 0x9e10, 0x4fea,
>                   0xa5, 0xc1, 0xb5, 0xaa, 0x8b, 0x19, 0x75, 0x6f);
>
>
> ?

Yes!

...

> >> +       devm_acpi_dev_add_driver_gpios(dev, data.map->mapping);
> >
> > Won't we print a warning here as well in case of error?
>
> The only way this can fail is with -ENOMEM (we already know dev
> has an ACPI companion) and generally speaking the rule is to
> not log errors for ENOMEM since when we hit that the kernel
> already complains loudly before returning from the alloc call.

But this is based on the information about internal implementation of
the above mentioned API. Strictly speaking it might return, in the
future, another error code as well.

--=20
With Best Regards,
Andy Shevchenko
