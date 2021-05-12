Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8408472
	for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 17:20:14 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id q2so18972252pfh.13
        for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 10:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/mRM7q1w9KEfWo7XLMCrlXg4WbYJ598DsMPCReIKFcI=;
        b=NNxJOC23SFvUX3yQW92nyLFzLFHNPZr8wDnfRRzMSlqB2XWlW6gkv9Pgwv1joc/odL
         kZUSxA62ue/klNVU1liSmFbMBwJyzDwt86W1jUoMTLxjwfQxWO8hCSlzWrYERHAfmD0S
         HgUnaOJWhGXY+4JXADcXpKI9iJCWYvKgwLcFQsBjh8yIKYDK2scSHFKXs2xGOvsCzcQd
         uiOGUIgi+lyiMA8uK7nuZXyxhRDdUOBTBQEBCTfnAEz7pAlfr7ANsPBg43I4VCHqGh6Z
         bbulzkuoffV1gybJb8q00vrxEt7M46JwL5cD9pxAWd6bAtom880pBUVmOcX28MNfRe2A
         MfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/mRM7q1w9KEfWo7XLMCrlXg4WbYJ598DsMPCReIKFcI=;
        b=C08Rl53FFiFqMJQJWvZi+IqZZOTL0+qWzkEgdz+1Yrrz0uFKF97CFPaEoiM1Mdr52A
         +WrTTRodoC0b9Wa/d8LRF+FQo+X8LtXHqXkufXOb6TvTdKVMxCPzJC0dIafE0dEq6IMc
         UizY8oyjA+5kaOKDZe7u+XoH/GEhRalbycu0Kan3pbK7tEUUe3g5DodXlyI+ZSAif0XF
         a+mcdz8S12KklvvHSisfrIB+eztqSQhKwYuHJ23Xp47xDjFOhEBVgRs53X7gtNwnVemi
         vayx5LyFbuOK+6jPVYvbnwCTPEHtDbV7A1EdXOWD1DuX4zewDDCGYOqfOVhByXz3sgC7
         zMbw==
X-Gm-Message-State: AOAM530q4vQg2J3eeplKiT5EgYAJa+l6o5+5pVxqqQ4hGA6LQqXwQtBT
	CLnNYlCXHD1G1ZqKEsy7OYlw16CIGLCMXZf6vCc=
X-Google-Smtp-Source: ABdhPJxDVWM6VC96SX/FrY4PNncdkd0pABiXC4DaOTQwHYXX7VS6NITQsa75eGgDVq4vOcFjWpkRADT1tlGm2bYJnSI=
X-Received: by 2002:a05:6a00:8c4:b029:2b4:8334:ed4d with SMTP id
 s4-20020a056a0008c4b02902b48334ed4dmr22170660pfu.36.1620840013879; Wed, 12
 May 2021 10:20:13 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1620766020.git.lucas.p.stankus@gmail.com> <09e65d3a235febfc4c3ee172b573ba8c9cde94b8.1620766020.git.lucas.p.stankus@gmail.com>
In-Reply-To: <09e65d3a235febfc4c3ee172b573ba8c9cde94b8.1620766020.git.lucas.p.stankus@gmail.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Wed, 12 May 2021 20:20:02 +0300
Message-ID: <CA+U=DsptfNDut3984MJkKckgWBhNd_0p17RfpidEXwYhMRfxtg@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: iio: cdc: ad7746: avoid overwrite of num_channels
To: Lucas Stankus <lucas.p.stankus@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-iio <linux-iio@vger.kernel.org>, linux-staging@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 11, 2021 at 11:55 PM Lucas Stankus
<lucas.p.stankus@gmail.com> wrote:
>
> AD7745 devices don't have the CIN2 pins and therefore can't handle related
> channels. Forcing the number of AD7746 channels may lead to enabling more
> channels than what the hardware actually supports.
> Avoid num_channels being overwritten after first assignment.
>
> Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
> ---
>  drivers/staging/iio/cdc/ad7746.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
> index e03d010b2f4c..9e0da43b2871 100644
> --- a/drivers/staging/iio/cdc/ad7746.c
> +++ b/drivers/staging/iio/cdc/ad7746.c
> @@ -693,7 +693,6 @@ static int ad7746_probe(struct i2c_client *client,
>                 indio_dev->num_channels = ARRAY_SIZE(ad7746_channels);
>         else
>                 indio_dev->num_channels =  ARRAY_SIZE(ad7746_channels) - 2;
> -       indio_dev->num_channels = ARRAY_SIZE(ad7746_channels);

ohh; good catch

this falls into the category of a fix, so a Fixes tag is required;
this looks so old, that i did not bother tracking it before
83e416f458d53  [which is 2011]

so, maybe something like:

Fixes: 83e416f458d53 ("staging: iio: adc: Replace, rewrite ad7745 from
scratch.")

>         indio_dev->modes = INDIO_DIRECT_MODE;
>
>         if (pdata) {
> --
> 2.31.1
>
