Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7978111E
	for <linux-staging@lists.linux.dev>; Tue,  1 Aug 2023 12:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690894368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqHpulfg/7XM7GDyUdhyOh4ZbAD3qwfSZn4ueyH7Dqg=;
	b=XyKAUaZvcBPdKtXqU9VXMKQ0xc+EJ/tQiEjISYDbmVJJEPyUHoCarNfIZ0aCZhbLr7xOE/
	9QRNI83thh6UYNQm37V85hSRG8FiwV0SWRPZzehFjpyZq8X75l2fiKIHSMqxYI0l2o95Oz
	phLLpIFf731L5YCzkajTJ+TR9BOV1WM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-COG3l5rBO0KwXvVwkTDlYw-1; Tue, 01 Aug 2023 08:52:47 -0400
X-MC-Unique: COG3l5rBO0KwXvVwkTDlYw-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-26814a0122dso4147142a91.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Aug 2023 05:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690894366; x=1691499166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqHpulfg/7XM7GDyUdhyOh4ZbAD3qwfSZn4ueyH7Dqg=;
        b=a1FTSqK/kNcdLnK27WZThtql92gE29sk2f819JBzFalLg75KS6gz6ZyMqL+apENYVo
         vvSjBhaDAgU4WjByj5euA2HcYtJZcrp6tLX+x/IIBtSw9G/06D6opurBygHKsUm6KVeD
         9DFhy3agd/cCN/2g4O/rINOShGGiQIZAQc7UQlMKaazpuTBk49VJ4kN0h239Q2OX35fc
         r4SePSOKDlFvckfElHxyQoXwHlYEvB144vHWcRRfNQ4RQPbIneNZRWT9Z2+vQ5m+s2HK
         vzZ4v1igjh+mm+NMiBzCbnJY4h5qUiDA40u2SF1QX9qIsQy2hmuv5363JhFYwRgRJod/
         xkTQ==
X-Gm-Message-State: ABy/qLZxcQ2NBbwAgvAJjH3a6bwQ15LiZk+vE5811megY4zJ2RXePYpY
	25AQjEwyBH3F14x6yNVH5YmHfF4a+K1jIBe8xyVSbfHqw+t89jVyyV5xBuD/wvAGAtziwxUl3LG
	zPHIXYVS2tgGYMM2p4NrQUCoIkk2wSuZGkM+gUHHy+g==
X-Received: by 2002:a17:90b:1e43:b0:268:e30e:e92f with SMTP id pi3-20020a17090b1e4300b00268e30ee92fmr3835261pjb.18.1690894366341;
        Tue, 01 Aug 2023 05:52:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEHLRCWmSqJcl/ukMicTsVT2r8zFujVt/LtJrb1lu4q/PmWd5W9vIpHHHk/aD3CnUFbE+pWkJGF0eEOnDFTPJ8=
X-Received: by 2002:a17:90b:1e43:b0:268:e30e:e92f with SMTP id
 pi3-20020a17090b1e4300b00268e30ee92fmr3835239pjb.18.1690894365962; Tue, 01
 Aug 2023 05:52:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230730153343.22033-1-hdegoede@redhat.com> <20230730153343.22033-2-hdegoede@redhat.com>
In-Reply-To: <20230730153343.22033-2-hdegoede@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 1 Aug 2023 20:52:34 +0800
Message-ID: <CAEth8oGULWxGpfXs-=C_XjnkND0Wb3=tjBQSVDdW9hQVZYU8EA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: atomisp: Fix me->stages error checking in sh_css_sp_init_pipeline()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Sun, Jul 30, 2023 at 11:33=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> The current error-checking of me->stages in sh_css_sp_init_pipeline()
> has some issues / weirdness:
>
> 1. It is checked at the top of the function, but only using the atomisp
>    custom assert() macro which e.g. smatch does not recognize
>
> 2. It is first dereferenced in "first_binary =3D me->stages->binary", but
>    outside of the assert it is checked much later, triggering the followi=
ng
>    smatch warning:
>
> drivers/staging/media/atomisp/pci/sh_css_sp.c:1255 sh_css_sp_init_pipelin=
e()
> warn: variable dereferenced before check 'me->stages' (see line 1224)
>
> Drop the custom assert() calls (note 'me' is never NULL) and instead add
> a regular check for me->stages not being set.
>
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Closes: https://lore.kernel.org/linux-media/7c8fc5b4-280e-844e-cdf5-b6ec2=
a1616aa@xs4all.nl/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_sp.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/stag=
ing/media/atomisp/pci/sh_css_sp.c
> index 4ef1c9e61ea8..eba70d4800a1 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> @@ -51,6 +51,7 @@
>  #include "ia_css_event.h"
>  #include "mmu_device.h"
>  #include "ia_css_spctrl.h"
> +#include "atomisp_internal.h"
>
>  #ifndef offsetof
>  #define offsetof(T, x) ((unsigned int)&(((T *)0)->x))
> @@ -1210,14 +1211,15 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *m=
e,
>         struct ia_css_binary         *first_binary =3D NULL;
>         struct ia_css_pipe *pipe =3D NULL;
>         unsigned int num;
> -
>         enum ia_css_pipe_id pipe_id =3D id;
>         unsigned int thread_id;
>         u8 if_config_index, tmp_if_config_index;
>
> -       assert(me);
> -
> -       assert(me->stages);
> +       if (!me->stages) {
> +               dev_err(atomisp_dev, "%s called on a pipeline without sta=
ges\n",
> +                       __func__);
> +               return; /* FIXME should be able to return an error */

Agree, an error handling is needed for the caller.

> +       }
>
>         first_binary =3D me->stages->binary;
>
> @@ -1250,8 +1252,8 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
>         } /* if (first_binary !=3D NULL) */
>
>         /* Signal the host immediately after start for SP_ISYS_COPY only =
*/
> -       if ((me->num_stages =3D=3D 1) && me->stages &&
> -           (me->stages->sp_func =3D=3D IA_CSS_PIPELINE_ISYS_COPY))
> +       if (me->num_stages =3D=3D 1 &&
> +           me->stages->sp_func =3D=3D IA_CSS_PIPELINE_ISYS_COPY)
>                 sh_css_sp_group.config.no_isp_sync =3D true;
>
>         /* Init stage data */
> --
> 2.41.0
>

It is good for me.

Reviewed-by: Kate Hsuan <hpa@redhat.com>



--
BR,
Kate

