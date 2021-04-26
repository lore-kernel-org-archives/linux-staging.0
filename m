Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95D771
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 00:55:20 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 92-20020a9d02e50000b029028fcc3d2c9eso28083760otl.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 17:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xMeskM3qvQ+RPXvaSi7kboN6+MjRLM3a4KbUx2qyhRA=;
        b=ovqaIrDcFi43+BLzQR8EIbZTD+/CmbrHV2RXDSE/8ib7NWJmGKdW4R9EHQ/fRh2Gz7
         lSwbgYvG03Tr0Fz9qx/OwWwYvkccquNFwzSTG7+ub2JOo1eNtPSRxNG/9cz+3+PimARn
         GqB48MWedXvIYba7DaN+nimBWhwCapfFCCgl/+Wr0yo5qwBRbqOLQJzAsFg9EJ+5r9HW
         JUz15BuvH1Ovv6XEbKlI4b6Osi8F/kbVDgVlpKgqtBG8mBP1PwESy2ZMedRRj2/flvTS
         PhGGG4CjxW+NDPQvnQKvzaZwvk6vcBRMsrfwF+OFYpMzmMLUnCIGn6cC0zJdI10wSWs4
         VkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xMeskM3qvQ+RPXvaSi7kboN6+MjRLM3a4KbUx2qyhRA=;
        b=W9zHsn4yNM0Z5/BrdSk+8o1fyjQXnoxZ+3GwagudOqwfmUzqUDrF4iGhPM41J9sI4J
         BcuZrn7lUXTGvqDcYy9p7juPGho5eam6Izd6zYQQ8xYf4xKfA5YDGHsekkmc0YjThyKu
         Y7Wp65Jlo52dLmyk4KUB0gLLkVkha0ij8ZqXH4WiJYhfPoFagVSnlxbs0LTVa+674AML
         dbgvtsfvCbeYBwf+8tzhngNNqugiCqnCNgoWM3RX3AoIIJ05q89lREZN4gjdmW6kR9aE
         0p+bV5KmucLZB8g6dhwjelV0Sn3ICh06qlR5YJEcgz/20ADKrxbNrJuiKE9a/BAeLSqP
         l2YA==
X-Gm-Message-State: AOAM5305hEzSlVO/FujiFgaIhfSiWRFbgMVzExdG+U5inYKeXzXy3ZtR
	3VAjKZ2U/at9HECJHkS3Yij1qdUuzTdzJ1iZpRc=
X-Google-Smtp-Source: ABdhPJzbAXR4lgkpKWEkocSHh3CwfiZog2WJ/ZWv+usj1p0Es3lolyuu12sd1i+jbh9p1ibpYLZ5b7vmEreI4O+PrW4=
X-Received: by 2002:a05:6830:1d5c:: with SMTP id p28mr12716574oth.362.1619398519870;
 Sun, 25 Apr 2021 17:55:19 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1618785336.git.lucas.p.stankus@gmail.com>
 <b0132613b82b17d63c8a91556c2c424015f202db.1618785336.git.lucas.p.stankus@gmail.com>
 <20210424131110.640cc152@jic23-huawei>
In-Reply-To: <20210424131110.640cc152@jic23-huawei>
From: Lucas Stankus <lucas.p.stankus@gmail.com>
Date: Sun, 25 Apr 2021 21:54:43 -0300
Message-ID: <CACKVXZDr9kxPuNdtG2e8qe59pXXBUrWStAVNiT+NzznGHHuR9A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] staging: iio: cdc: ad7746: use dt for capacitive
 channel setup.
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 24, 2021 at 9:10 AM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sun, 18 Apr 2021 19:50:10 -0300
> Lucas Stankus <lucas.p.stankus@gmail.com> wrote:
>
> > Ditch platform_data fields in favor of device tree properties for
> > configuring EXCA and EXCB output pins and setting the capacitive channel
> > excitation level.
> >
> > As this covers all current use cases for the platform_data struct, remove
> > ad7746.h header file since it's no longer needed.
> >
> > Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
> Hi Lucas,
>
> Just one comment which is that the permille to register value
> is a bit opaque so I think I'd prefer a simple lookup table even though it
> is a bit more code.
>
> Otherwise looks good to me.
>
> Thanks,
>
> Jonathan

Thank you!

> > ---
> >
> > Changes in v2:
> > Previously this change set was composed of two patches, but it lead to
> > regressions between the two. Merging them avoids the unwanted behaviour
> > without having to deal with the special cases.
> >
> >  drivers/staging/iio/cdc/ad7746.c | 42 +++++++++++++++-----------------
> >  drivers/staging/iio/cdc/ad7746.h | 28 ---------------------
> >  2 files changed, 19 insertions(+), 51 deletions(-)
> >  delete mode 100644 drivers/staging/iio/cdc/ad7746.h
> >
> > diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
> > index dfd71e99e872..c0e84c1cf4f1 100644
> > --- a/drivers/staging/iio/cdc/ad7746.c
> > +++ b/drivers/staging/iio/cdc/ad7746.c
> > @@ -18,8 +18,6 @@
> >  #include <linux/iio/iio.h>
> >  #include <linux/iio/sysfs.h>
> >
> > -#include "ad7746.h"
> > -
> >  /*
> >   * AD7746 Register Definition
> >   */
> > @@ -66,7 +64,7 @@
> >  #define AD7746_EXCSETUP_NEXCB                BIT(4)
> >  #define AD7746_EXCSETUP_EXCA         BIT(3)
> >  #define AD7746_EXCSETUP_NEXCA                BIT(2)
> > -#define AD7746_EXCSETUP_EXCLVL(x)    (((x) & 0x3) << 0)
> > +#define AD7746_EXCSETUP_EXCLVL(x)    (((x) >> 7) & 0x3)
>
> I'd like a comment on this maths, or just use a lookup table instead so
> we don't have to think about it and also enforce exact matches.
> The rounding this results in is a bit odd

To be fair this macro is a bit hack-ish, the permille binding can be 125, 250,
500 or 750, so dividing it by 128 maps these values from 0 to 3, which are the
expected numbers for configuring the device.

I decided to use the bit shift because it was more concise than a lookup table,
but the latter might be more legible, I'll send a v3 with one instead.

>
> >
> >  /* Config Register Bit Designations (AD7746_REG_CFG) */
> >  #define AD7746_CONF_VTFS_SHIFT               6
> > @@ -676,10 +674,11 @@ static const struct iio_info ad7746_info = {
> >  static int ad7746_probe(struct i2c_client *client,
> >                       const struct i2c_device_id *id)
> >  {
> > -     struct ad7746_platform_data *pdata = client->dev.platform_data;
> > +     struct device *dev = &client->dev;
> >       struct ad7746_chip_info *chip;
> >       struct iio_dev *indio_dev;
> >       unsigned char regval = 0;
> > +     unsigned int vdd_permille;
> >       int ret = 0;
> >
> >       indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
> > @@ -703,28 +702,25 @@ static int ad7746_probe(struct i2c_client *client,
> >       indio_dev->num_channels = ARRAY_SIZE(ad7746_channels);
> >       indio_dev->modes = INDIO_DIRECT_MODE;
> >
> > -     if (pdata) {
> > -             if (pdata->exca_en) {
> > -                     if (pdata->exca_inv_en)
> > -                             regval |= AD7746_EXCSETUP_NEXCA;
> > -                     else
> > -                             regval |= AD7746_EXCSETUP_EXCA;
> > -             }
> > -
> > -             if (pdata->excb_en) {
> > -                     if (pdata->excb_inv_en)
> > -                             regval |= AD7746_EXCSETUP_NEXCB;
> > -                     else
> > -                             regval |= AD7746_EXCSETUP_EXCB;
> > -             }
> > +     if (device_property_read_bool(dev, "adi,exca-output-en")) {
> > +             if (device_property_read_bool(dev, "adi,exca-output-invert"))
> > +                     regval |= AD7746_EXCSETUP_NEXCA;
> > +             else
> > +                     regval |= AD7746_EXCSETUP_EXCA;
> > +     }
> >
> > -             regval |= AD7746_EXCSETUP_EXCLVL(pdata->exclvl);
> > -     } else {
> > -             dev_warn(&client->dev, "No platform data? using default\n");
> > -             regval = AD7746_EXCSETUP_EXCA | AD7746_EXCSETUP_EXCB |
> > -                     AD7746_EXCSETUP_EXCLVL(3);
> > +     if (device_property_read_bool(dev, "adi,excb-output-en")) {
> > +             if (device_property_read_bool(dev, "adi,excb-output-invert"))
> > +                     regval |= AD7746_EXCSETUP_NEXCB;
> > +             else
> > +                     regval |= AD7746_EXCSETUP_EXCB;
> >       }
> >
> > +     ret = device_property_read_u32(dev, "adi,excitation-vdd-permille",
> > +                                    &vdd_permille);
> > +     if (!ret)
> > +             regval |= AD7746_EXCSETUP_EXCLVL(vdd_permille);
> > +
> >       ret = i2c_smbus_write_byte_data(chip->client,
> >                                       AD7746_REG_EXC_SETUP, regval);
> >       if (ret < 0)
> > diff --git a/drivers/staging/iio/cdc/ad7746.h b/drivers/staging/iio/cdc/ad7746.h
> > deleted file mode 100644
> > index 8bdbd732dbbd..000000000000
> > --- a/drivers/staging/iio/cdc/ad7746.h
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -/*
> > - * AD7746 capacitive sensor driver supporting AD7745, AD7746 and AD7747
> > - *
> > - * Copyright 2011 Analog Devices Inc.
> > - */
> > -
> > -#ifndef IIO_CDC_AD7746_H_
> > -#define IIO_CDC_AD7746_H_
> > -
> > -/*
> > - * TODO: struct ad7746_platform_data needs to go into include/linux/iio
> > - */
> > -
> > -#define AD7466_EXCLVL_0              0 /* +-VDD/8 */
> > -#define AD7466_EXCLVL_1              1 /* +-VDD/4 */
> > -#define AD7466_EXCLVL_2              2 /* +-VDD * 3/8 */
> > -#define AD7466_EXCLVL_3              3 /* +-VDD/2 */
> > -
> > -struct ad7746_platform_data {
> > -     unsigned char exclvl;   /*Excitation Voltage Level */
> > -     bool exca_en;           /* enables EXCA pin as the excitation output */
> > -     bool exca_inv_en;       /* enables /EXCA pin as the excitation output */
> > -     bool excb_en;           /* enables EXCB pin as the excitation output */
> > -     bool excb_inv_en;       /* enables /EXCB pin as the excitation output */
> > -};
> > -
> > -#endif /* IIO_CDC_AD7746_H_ */
>
