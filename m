Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5FA71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 16:13:01 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id w8so1853264plg.9
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a0nh7PkOrzhDVc48M8ceeax73DyRdMNEI8tcCCeX7yQ=;
        b=DHTPpxWTemVqBmUl/moqm5OFwpc1ccQOJBflreTIxWgU2xi98CKRE+A9YvQz3Uv7oC
         eMoDNiT/JO1biWMwumCx3VQhO+PC/P4d20WEj/YMS4T/igHnXano1fh3R3hLzfj66YpA
         59ZPlD+pwAcMc4JQUUSnVVHrpHhK884Xnkdw1k5/kKVjuusFN58rPjfdM0Hzlb86uoGD
         D/+yjp0QrfsRzIhtlOL721G+65QyF8fFtW9Q8arNyA8EyhoDTblL8mmySwOgS8Lg5ZWm
         nRkc3p/Uhxr1vZuCN9EBiN8KWPHx6moS254qGiVvmOFS9lOWgXBrr8pAjGV15IKYLSFZ
         j2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a0nh7PkOrzhDVc48M8ceeax73DyRdMNEI8tcCCeX7yQ=;
        b=oIkf7BwB1wVuFwYFRuXlWkKgysKQ+ZeeHamosylt6+asMRg4Ew2hRKFE1y/8pVF5GN
         PucHbo5a0/Mmk7BXJEQKlpbkwreYwyn2gJouqP877BvokD9JkUI3yvXp1+VpAN9RUuqR
         ZMBYXvZIs91KrQMHKOQmpbhOcHY6e0F57p5/ZgM6wjx1fyn4V+FlW4sI4EFgRIrdEQ8s
         0HrZeSLNf9kHcfvyvNz1WCe1NZ+5rffeiCxuHSPpA5gTSF7kfX86XiCAr/UCXeW40C6V
         fAdl1keLkbdIil2GocmFFz3JY7NVH2MT4MTKo6EdcagTndV96AIgPTj5XoC8Qg6N3H8B
         cnBg==
X-Gm-Message-State: AOAM533FeQkAZDspxL0mp9LqXWTeroYZYtity8sftUmlLBR1SkSJnKGc
	sMshsO0SEtXdCNtSKrXBYw+CCnvSYXz8ypMqN94=
X-Google-Smtp-Source: ABdhPJyN8U9QeGE42JO/YdS2spG+z5kfK+rEAryAJqoiRBxWVU8T2QV5Eq8OwD1VYeyDcLroJ0jnOdtFp7s5LXtMqtY=
X-Received: by 2002:a17:902:e549:b029:e6:6b3a:49f7 with SMTP id
 n9-20020a170902e549b02900e66b3a49f7mr18876497plf.52.1618071180771; Sat, 10
 Apr 2021 09:13:00 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1617993776.git.lucas.p.stankus@gmail.com> <39486895e4e985d0220342f3accfd98a1e149ea7.1617993776.git.lucas.p.stankus@gmail.com>
In-Reply-To: <39486895e4e985d0220342f3accfd98a1e149ea7.1617993776.git.lucas.p.stankus@gmail.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Sat, 10 Apr 2021 19:12:49 +0300
Message-ID: <CA+U=Dsot+p76kaCAecN+ORdhZ_u+Bw1J8oVKZYAjoexHgiazVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: iio: cdc: ad7746: use dt bindings to set the
 EXCx pins output
To: Lucas Stankus <lucas.p.stankus@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-iio <linux-iio@vger.kernel.org>, linux-staging@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 9, 2021 at 9:51 PM Lucas Stankus <lucas.p.stankus@gmail.com> wrote:
>
> Ditch platform_data fields in favor of device tree properties for
> configuring EXCA and EXCB output.
> This also removes the fields from the platform_data struct, since they're
> not used anymore.
>
> Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
> ---
>  drivers/staging/iio/cdc/ad7746.c | 33 +++++++++++++++++---------------
>  drivers/staging/iio/cdc/ad7746.h |  4 ----
>  2 files changed, 18 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
> index dfd71e99e872..63041b164dbe 100644
> --- a/drivers/staging/iio/cdc/ad7746.c
> +++ b/drivers/staging/iio/cdc/ad7746.c
> @@ -677,8 +677,10 @@ static int ad7746_probe(struct i2c_client *client,
>                         const struct i2c_device_id *id)
>  {
>         struct ad7746_platform_data *pdata = client->dev.platform_data;
> +       struct device_node *np = client->dev.of_node;
>         struct ad7746_chip_info *chip;
>         struct iio_dev *indio_dev;
> +       unsigned int exca_en, excb_en;
>         unsigned char regval = 0;
>         int ret = 0;
>
> @@ -703,26 +705,27 @@ static int ad7746_probe(struct i2c_client *client,
>         indio_dev->num_channels = ARRAY_SIZE(ad7746_channels);
>         indio_dev->modes = INDIO_DIRECT_MODE;
>

[1]

> -       if (pdata) {
> -               if (pdata->exca_en) {
> -                       if (pdata->exca_inv_en)
> -                               regval |= AD7746_EXCSETUP_NEXCA;
> -                       else
> -                               regval |= AD7746_EXCSETUP_EXCA;
> -               }
> +       ret = of_property_read_u32(np, "adi,exca-output", &exca_en);

maybe a better idea would be to use:

device_property_read_u32(dev, .... )
where:
dev = client->dev.;

this would make the driver a bit more friendly with both OF and ACPI

> +       if (!ret && exca_en) {
> +               if (exca_en == 1)
> +                       regval |= AD7746_EXCSETUP_EXCA;
> +               else
> +                       regval |= AD7746_EXCSETUP_NEXCA;
> +       }
>
> -               if (pdata->excb_en) {
> -                       if (pdata->excb_inv_en)
> -                               regval |= AD7746_EXCSETUP_NEXCB;
> -                       else
> -                               regval |= AD7746_EXCSETUP_EXCB;
> -               }
> +       ret = of_property_read_u32(np, "adi,excb-output", &excb_en);
> +       if (!ret && excb_en) {
> +               if (excb_en == 1)
> +                       regval |= AD7746_EXCSETUP_EXCB;
> +               else
> +                       regval |= AD7746_EXCSETUP_NEXCB;
> +       }
>
> +       if (pdata) {
>                 regval |= AD7746_EXCSETUP_EXCLVL(pdata->exclvl);
>         } else {
>                 dev_warn(&client->dev, "No platform data? using default\n");
> -               regval = AD7746_EXCSETUP_EXCA | AD7746_EXCSETUP_EXCB |
> -                       AD7746_EXCSETUP_EXCLVL(3);

This logic is problematic now.
Because no matter what you're setting in the DT, it always gets
overridden here because there is no platform data.

Maybe a better idea is to do something like:
if (!pdata)
     regval = AD7746_EXCSETUP_EXCLVL(3);

but this should be placed somewhere around [1]


> +               regval = AD7746_EXCSETUP_EXCLVL(3);
>         }
>
>         ret = i2c_smbus_write_byte_data(chip->client,
> diff --git a/drivers/staging/iio/cdc/ad7746.h b/drivers/staging/iio/cdc/ad7746.h
> index 8bdbd732dbbd..6cae4ecf779e 100644
> --- a/drivers/staging/iio/cdc/ad7746.h
> +++ b/drivers/staging/iio/cdc/ad7746.h
> @@ -19,10 +19,6 @@
>
>  struct ad7746_platform_data {
>         unsigned char exclvl;   /*Excitation Voltage Level */
> -       bool exca_en;           /* enables EXCA pin as the excitation output */
> -       bool exca_inv_en;       /* enables /EXCA pin as the excitation output */
> -       bool excb_en;           /* enables EXCB pin as the excitation output */
> -       bool excb_inv_en;       /* enables /EXCB pin as the excitation output */
>  };
>
>  #endif /* IIO_CDC_AD7746_H_ */
> --
> 2.31.1
>
