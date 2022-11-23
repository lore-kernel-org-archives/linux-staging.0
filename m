Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67E11860
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 07:56:18 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-381662c78a9so167023467b3.7
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 23:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V+KTB0yCVy00ksfR0u4Zctg6mmMhF4ijcHC1EOhuum4=;
        b=ci9XwZGCABJJ8P+PbOMoIT+tN/dhXjJWbSRrY2gBs92AJpBEC9TUtqnwYYja0qnpau
         n467+caVA8Ir5xqj0D+47K9ZuAmHGV3qpy/kPa+igWfzvGIARrKeH+kBke87eb5gwWEP
         OxyWmZda7fEY1WYcyzoyZpnMbMUKx1ZZoWG9Hf/Ba/0qEVmRZkgyaTNjkjYdkY3gV97u
         /ZkfFVj6CiwNXENvnu6UYPiZ3GLZN9oNKKWj4BuvK4JHRi1OHjx05i3VmMc1aoBJtlpy
         X2KZRpm8Ed6pnjzNCqY897MShEgoSmCRM1T2hD6T9DtvcHfxifeYUI7lx+a4Y2q3TDbQ
         9Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+KTB0yCVy00ksfR0u4Zctg6mmMhF4ijcHC1EOhuum4=;
        b=eghfRaQl+wBG3zSNqm7vBnkm8WvcbjcaP+XrKzGyvn2PczGf6L92gM5HcLmXf3NIqj
         /Jnst1c1Hs3VY3UP3yXson4Kyrccit6eYZuwElMlbx5jG0m0kmsqC1w4bec7a4WRDqFL
         8mK2J4j9vGsIRECxxgyI4AHOlVq7sb+3FHm1v2ytJBthAXpDUNz5HYSjzovBc497ji6c
         C7FaHvNb61662l0TyFxGQ4Lwqfmctetke2NQNw3HgFfvWz8M9qXnuIoaPAGGGaeO74fP
         Rz/V5SATQ2vDr8OTfpAy4A0HN8S4KbiAC3DuHjqq8wvy9qSSHGEXGylzbCIodq77QzHl
         1VQw==
X-Gm-Message-State: ANoB5pl8s9vrKBGqdydvK4zxLAHr0ithRhxN1bi2oTms02J+bgc3IoML
	yoN9s9VT2igo+BhDLJ3Ij7Xpq3bf4lG91E8ksVM=
X-Google-Smtp-Source: AA0mqf5edvqImTS8UzpZAtFMg2nLoHcI5qbM0dKiZrOF6BmRciK/NHIVS1ynbpnUNMdGvG6DNsiKTu6n+6Dz3kWq9vs=
X-Received: by 2002:a0d:ca05:0:b0:3af:60cc:7496 with SMTP id
 m5-20020a0dca05000000b003af60cc7496mr1903074ywd.510.1669190177606; Tue, 22
 Nov 2022 23:56:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221122132330.30408-1-lukas.bulwahn@gmail.com> <20221122160937.GB39395@tom-ThinkPad-T14s-Gen-2i>
In-Reply-To: <20221122160937.GB39395@tom-ThinkPad-T14s-Gen-2i>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 23 Nov 2022 08:56:06 +0100
Message-ID: <CAKXUXMxk-YoG4TdB8Em+cEMF8NA7rdMAboQz8nmhfVmVQ8oATA@mail.gmail.com>
Subject: Re: [PATCH] media: imx: remove code for non-existing config IMX_GPT_ICAP
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 22, 2022 at 5:09 PM Tommaso Merciai
<tommaso.merciai@amarulasolutions.com> wrote:
>
> Hi Lukas,
>
> On Tue, Nov 22, 2022 at 02:23:30PM +0100, Lukas Bulwahn wrote:
> > There never was a config IMX_GPT_ICAP in the repository. So remove the code
> > conditional on this config and simplify the callers that just called empty
> > functions.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> >  drivers/staging/media/imx/imx-media-fim.c | 54 -----------------------
> >  1 file changed, 54 deletions(-)
> >
> > diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
> > index 3a9182933508..19a48eb445fd 100644
> > --- a/drivers/staging/media/imx/imx-media-fim.c
> > +++ b/drivers/staging/media/imx/imx-media-fim.c
> > @@ -187,54 +187,6 @@ static void frame_interval_monitor(struct imx_media_fim *fim,
> >               send_fim_event(fim, error_avg);
> >  }
> >
> > -#ifdef CONFIG_IMX_GPT_ICAP
> > -/*
> > - * Input Capture method of measuring frame intervals. Not subject
> > - * to interrupt latency.
> > - */
> > -static void fim_input_capture_handler(int channel, void *dev_id,
> > -                                   ktime_t timestamp)
> > -{
> > -     struct imx_media_fim *fim = dev_id;
> > -     unsigned long flags;
> > -
> > -     spin_lock_irqsave(&fim->lock, flags);
> > -
> > -     frame_interval_monitor(fim, timestamp);
> > -
> > -     if (!completion_done(&fim->icap_first_event))
> > -             complete(&fim->icap_first_event);
> > -
> > -     spin_unlock_irqrestore(&fim->lock, flags);
> > -}
> > -
> > -static int fim_request_input_capture(struct imx_media_fim *fim)
> > -{
> > -     init_completion(&fim->icap_first_event);
> > -
> > -     return mxc_request_input_capture(fim->icap_channel,
> > -                                      fim_input_capture_handler,
> > -                                      fim->icap_flags, fim);
> > -}
> > -
> > -static void fim_free_input_capture(struct imx_media_fim *fim)
> > -{
> > -     mxc_free_input_capture(fim->icap_channel, fim);
> > -}
> > -
> > -#else /* CONFIG_IMX_GPT_ICAP */
> > -
> > -static int fim_request_input_capture(struct imx_media_fim *fim)
> > -{
> > -     return 0;
> > -}
> > -
> > -static void fim_free_input_capture(struct imx_media_fim *fim)
> > -{
> > -}
> > -
> > -#endif /* CONFIG_IMX_GPT_ICAP */
> > -
> >  /*
> >   * In case we are monitoring the first frame interval after streamon
> >   * (when fim->num_skip = 0), we need a valid fim->last_ts before we
> > @@ -435,14 +387,8 @@ int imx_media_fim_set_stream(struct imx_media_fim *fim,
> >               spin_unlock_irqrestore(&fim->lock, flags);
> >
> >               if (icap_enabled(fim)) {
> > -                     ret = fim_request_input_capture(fim);
> > -                     if (ret)
> > -                             goto out;
> >                       fim_acquire_first_ts(fim);
> >               }
>
> As suggested by the checkpatch.pl:
> WARNING: braces {} are not necessary for single statement blocks
>
> > -     } else {
> > -             if (icap_enabled(fim))
> > -                     fim_free_input_capture(fim);
> >       }
> >
> >       fim->stream_on = on;
> > --
> > 2.17.1
> >
>

Strangely, my checkpatch invocation on next-20221116 did not show that
warning and I am unaware that I made any specific changes to
checkpatch or its configuration.

Anyway, checkpatch and you, Tommaso, are right and the patch can of
course be improved. I sent out a patch v2:

https://lore.kernel.org/all/20221123075216.28193-1-lukas.bulwahn@gmail.com/

I hope to get an Acked-by: tag from you now. Thanks.

Lukas

> Apart of this, patch looks good to me.
> Thanks.
>
> Regards,
> Tommaso
>
> --
> Tommaso Merciai
> Embedded Linux Engineer
> tommaso.merciai@amarulasolutions.com
> __________________________________
>
> Amarula Solutions SRL
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
> T. +39 042 243 5310
> info@amarulasolutions.com
> www.amarulasolutions.com
