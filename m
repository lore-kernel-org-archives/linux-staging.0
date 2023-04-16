Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C84C2C7
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 10:02:09 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id gb12so20382518qtb.6
        for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681639328; x=1684231328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZxoONYjpiy9MbL4YVRp8r9eBFiaHPQlZt2qQpuRD4E=;
        b=dQmdjtW//P7QvRzA1jFWg/37TrB91+CVHWJc7uOBy7vtwvOCFesVXJJFUUNR0Okvtz
         1n2croOfOLaaYQG6dneCb9LUqgG4SD7keQYz8A/4ofuVJpBCpJwcUIMACAYe0rOwzBuQ
         XdfooiY2KlxVs05fT/BCO30VDjxsJZRFLbGTZOlA0+EcFCkOXiG3j/ZAkf9pQIeiOLgt
         kkpL6CfRQTvHpAokWVtJGXiQsXeW8ekJf0GK3FB6UcaRtpHP9uKd9YHzJPVGtUYaxFZ0
         VTBsTtqEtiY+Fhh8rn5nzk6MY9ItvL6J0pwQklkGRIPPM33JFwRm4qX2C0IliDIB24pD
         7Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681639328; x=1684231328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZxoONYjpiy9MbL4YVRp8r9eBFiaHPQlZt2qQpuRD4E=;
        b=LfHxaFOIFQseOm6uo1OVf8mqeReT7uXUb7DqmuG5NMORw5l3KDJ9o2jerQvjVC+Lnq
         BjI/iI0bFbsQkIokQZh9kfC7qjD1YdGdMdz3PTKtqljAQk1AQwjU0LRz/NlN/CtraPtg
         wJPx/vQQmFC0F5SNKGhVA8IOrwPeHEL+3TLqQZbxvJ9HTpn/M6Yr4TvH+O/K9iL1+F80
         8jh581vIgxw/+j3A2ExYmCFkm2NBscmzu57LIB2aT6efiFBFNEwTcS1wpF8kVuDall2Z
         YFKfCOAYy8odaJOQsabE2qCqGkpJyr4jY+9QDkrfwfxqM9boNmKbF2Kt4lTeMIFlXgez
         s9ZQ==
X-Gm-Message-State: AAQBX9cGRM+z54GYXJbdm1edsq3M8bruEzfz8dF302ieOoVR7zhjB9zI
	AtRTmFuYPgCqTe37CnCKyk/Jbcc7imNacbRUjL8=
X-Google-Smtp-Source: AKy350Z47+6bGxd1xRNHZnacl2G7aVI+x9MNtKPtsyKz0oTUv0XV1DinXFuPbSmxP5mkntBADuGSYGcFlwRkwkGdGGQ=
X-Received: by 2002:a05:622a:1a9b:b0:3e8:f79d:bdfa with SMTP id
 s27-20020a05622a1a9b00b003e8f79dbdfamr3499947qtc.0.1681639328272; Sun, 16 Apr
 2023 03:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZDuhnLPczec5qJnq@yoga>
In-Reply-To: <ZDuhnLPczec5qJnq@yoga>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 16 Apr 2023 13:01:32 +0300
Message-ID: <CAHp75Veaqp4O1jcBHZZh2L5ReMU1+2vH+FfRzfLyY8CdwZwq+w@mail.gmail.com>
Subject: Re: [PATCH] Staging: media: atomisp: include: mmu: include
 <linux/processor.h> instead of <asm/processor.h>
To: Anup Sharma <anupnewsmail@gmail.com>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	gregkh@linuxfoundation.org, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 16, 2023 at 10:20=E2=80=AFAM Anup Sharma <anupnewsmail@gmail.co=
m> wrote:
>
> Fix following checkpatch.pl warning by including
> <linux/processor.h> instead of <asm/processor.h>

Missing period at the end. But the entire patch seems unnecessary
since it's all about x86, and we have more arch headers there anyway.
Anyway it's up to Hans. Also see below.

...

>  #include <asm/intel-family.h>
> -#include <asm/processor.h>
> +#include <linux/processor.h>
>
>  #include <linux/i2c.h>
>  #include <media/v4l2-subdev.h>

This seems a bit chaotic with the ordering of the headers here.

...

If you want a good patch, you need to understand what headers are
_really_ being used in the header file. Then drop unused, try to
compile that and fix all files that will have missing headers after
that. This will be a very useful clean up!

--=20
With Best Regards,
Andy Shevchenko
