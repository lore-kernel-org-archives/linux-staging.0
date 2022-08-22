Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7A17B
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 13:04:21 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id b9so7754388qka.2
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=KcX7ckfFUtiHcdet+AiR0QWuHM0/dQTQxELMoB4uI60=;
        b=ldpifsCCYszxEAXgTQzDv/bafpAXpVyCus6EOAM3oHgm08MzDl3luHViyiQLo7pWvF
         ATHLKHsR1x5OXPmrPVgUsffO8RBLCBuWM5INcwHkYOSuGOz/ww7EwUaARIHSBQSl0h6t
         h+OHQRdry2zV39FijQ3ZZVIBnNUTNoEvGp20zhUf4DS6qvxR64Jaf3Q1BaYAOSEpeIAd
         jF4f0Uwk7nZD2juaKG/wSW6m6G2bNPSXCozka00P+pe8aOxOxUIDlmhqUbbdkpy8d7BH
         itdq6MszS58lEcVzRW51UYPexY87MtDBR37mzR9B3GsVWs/cIy77OS1dHSJhZq/APFtH
         Dlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=KcX7ckfFUtiHcdet+AiR0QWuHM0/dQTQxELMoB4uI60=;
        b=WdyoN+YAUIESn7E/Hk2VxYKxBzywX05fatsEdGUMA9ahgK19PScF8ATy9kTvooSJgt
         2qn5Uy+X/w+iEPAYBd1dj6qshOZxT4FfTe7O5+dQCoprLHtlXA7Vwv3Z8mBhjRthjEGE
         PJNSlghZrgS81JqZGaKZrMKHRmVYduF0pWs4tupUGJ4gkhy68og537TUjtIHwPQDM+nU
         XFkkz2CcuzlTp74QcGpKN/Fwa5QtZLTpeCL6vd9wrBxp5kzmXxbLVDAbBf7lIb+zwPWF
         m7fkGDmCRESHUhHCbVnlq18gJ8qalklJXW8+Jbu5ppAc271IAlx9qXm/iForh/c2aS4H
         deig==
X-Gm-Message-State: ACgBeo2BlyE6ywCyfIb6v01ewtKRHjRlcbn41m72dTmChESYgkWBxiMd
	gul8WHEKp4qw0Q5aM4azqVzPt6cZBqSWWlBxgu4=
X-Google-Smtp-Source: AA6agR4BFlpKGK3V236Sps73C2mTbHhDlJRXSY5jzzm7xgc/39BA0fExqDO8cw1NBDs6YPu+NFflGX2qP0y9a/o4fOE=
X-Received: by 2002:ae9:e311:0:b0:6ba:e711:fb27 with SMTP id
 v17-20020ae9e311000000b006bae711fb27mr12367682qkf.320.1661173460190; Mon, 22
 Aug 2022 06:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220821215027.461344-1-hdegoede@redhat.com> <20220821215027.461344-13-hdegoede@redhat.com>
In-Reply-To: <20220821215027.461344-13-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Aug 2022 16:03:44 +0300
Message-ID: <CAHp75VdJETEOf_t_F0f591zOj3U_ALuadE4LHzF-8sXPPgUnEQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] media: atomisp: Ensure that USERPTR pointers are
 page aligned
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, 
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 12:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The atomisp code needs USERPTR pointers to be page aligned,
> otherwise bad things (scribbling over other parts of the
> process' RAM) happen.
>
> Add a check to ensure this and exit VIDIOC_QBUF calls with
> unaligned pointers with -EINVAL.

...

>         if (buf->memory == V4L2_MEMORY_USERPTR) {
> +               if (buf->m.userptr & ~PAGE_MASK) {

offset_in_page() ?

Further we may utilize helpers from pfn.h in the driver.

> +                       dev_err(isp->dev, "Error userptr is not page aligned.\n");
> +                       ret = -EINVAL;
> +                       goto error;
> +               }

-- 
With Best Regards,
Andy Shevchenko
