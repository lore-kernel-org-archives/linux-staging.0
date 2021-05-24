Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A9D17F
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 07:53:28 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id e22so3771262pgv.10
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 00:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YPfHUyoin9pTzx/DIO0b7eyaBI/hHiN4OVeEyxlvBCM=;
        b=HEYEqhIKMqaxASa/zbV8Zw652IizPKZtHK/TkEsXmRVA0NlDPGpKcLtQoewQaSf3ah
         ty/h0FSF624/lCzINZ9wa/MEsDJKPcbhKdn6o62p/64SOVH3TxJLT9MxyDFcPsHsPLKz
         CTXYHB1o6p1E2povnmw8lgFkUKYzMZuHxCwvCzjuVNln8/ehfnK4HMcyJSU6Qy1tFNb6
         hFy3p8O6V7Goo6urX5L0QclhFHqzZSjVIIwWYBAY+/moeKrM+19pmE/zNqUD1gTAYqyt
         4YT/nM0ob1BqMc2ZxdbZr1CiceN2HSaFUXJKuBbm9v1L/vofRAe6C/9XgY1Guu2m8mY1
         nTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YPfHUyoin9pTzx/DIO0b7eyaBI/hHiN4OVeEyxlvBCM=;
        b=ZXKPySDDo1taLOxoaqS29RQIGB4DR+FotYGD+mR8QamNRPTPMsIcgU97GfQUKzElua
         94AgFNLEyLBkV8w9pszpeBMQnHCMnGNvL9plFfJTq1DMqCUHuoFTmnkqVAuwLDtKOyPj
         RAlcCuNaKwfsGJoxvm/7EWi0zk0/prgMKp1OLJA5phxmVSzMm1UykyRLEZhtDIzLTadi
         ZstEAoMmM7osa3f0vhmBanhAT9GdtL+yK5KesKV+Dt4NcznmDag96Es7WJfyjbBAT+Ua
         D2dbAFjEYxCw9jLoe0KwSpUVcLipx4gxVcSM+N2GpGq4Z3GdPudg0Ay6hF0rP9qbZQ0t
         WNxw==
X-Gm-Message-State: AOAM531r8Bh1k2HRjoY1pEIVkLkBN5KuUkJkH1wZ9xEGm7YA9MuqoLg4
	xZkKnd40meSmYpMuhnTjszFi+0Oe05WIZSqXrAw=
X-Google-Smtp-Source: ABdhPJwH3D8bee8UXImea+42nDIf9DsLn0BVBXpkA66vfMYyEdSpPMjqOxchyw0LSnambnVBFZCf9UUCaF0bUTLnB44=
X-Received: by 2002:a05:6a00:8c4:b029:2b4:8334:ed4d with SMTP id
 s4-20020a056a0008c4b02902b48334ed4dmr22977758pfu.36.1621842808375; Mon, 24
 May 2021 00:53:28 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1621786036.git.lucas.p.stankus@gmail.com> <45443b8306893576824effaff57d40231de8e813.1621786036.git.lucas.p.stankus@gmail.com>
In-Reply-To: <45443b8306893576824effaff57d40231de8e813.1621786036.git.lucas.p.stankus@gmail.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Mon, 24 May 2021 10:53:17 +0300
Message-ID: <CA+U=DsrwK-ae1DSHYp8eLgJoeSF9u+tAw3FsVBCGRzYN3ksV_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] staging: iio: cdc: ad7746: clean up probe return
To: Lucas Stankus <lucas.p.stankus@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-iio <linux-iio@vger.kernel.org>, linux-staging@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 23, 2021 at 8:12 PM Lucas Stankus <lucas.p.stankus@gmail.com> wrote:
>
> Slight simplication of the probe return on device register.
>

Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>

> Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
> ---
>  drivers/staging/iio/cdc/ad7746.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
> index 12b2554a85b5..367a5990ae35 100644
> --- a/drivers/staging/iio/cdc/ad7746.c
> +++ b/drivers/staging/iio/cdc/ad7746.c
> @@ -734,11 +734,7 @@ static int ad7746_probe(struct i2c_client *client,
>         if (ret < 0)
>                 return ret;
>
> -       ret = devm_iio_device_register(indio_dev->dev.parent, indio_dev);
> -       if (ret)
> -               return ret;
> -
> -       return 0;
> +       return devm_iio_device_register(indio_dev->dev.parent, indio_dev);
>  }
>
>  static const struct i2c_device_id ad7746_id[] = {
> --
> 2.31.1
>
