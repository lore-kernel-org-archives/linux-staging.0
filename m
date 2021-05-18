Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E20270
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 00:50:17 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so7198626otc.6
        for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 17:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=11AmUmE+3jDAlknGZhIf8nvE4IgD55HSgs5v9hU/fF4=;
        b=Tk2IBTrjmD17gwRroO9Ojtyyjjd1yC1ZZgBrg1Nnt6MJpZcJFCn+VdYG051SeTsDG8
         9mxyv2s3HDR4WUtZv1rISYfyAF8wDfQMW+Vy1wUNTkmc3seKUPvVeqr06Oem5zuckEh/
         ugRxSBatwjf7lySgtcD0W6ghpwySNz9Jq60Xo/jnVsNrXpQA15gpyVGkpESRYyXf+GAm
         mKqy2TeZzGd71t9r8PZg0ymMaHbiojOd7xHvod+Kpw8PtKIvwJqocf96H9hbVFbSn56D
         K6OuQKSJ9uF6JCZF3R2X3i16wKTOpbCqpu50uzWGeBr6li3ovJmPiD22bXRZ/GlnQQe/
         HvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=11AmUmE+3jDAlknGZhIf8nvE4IgD55HSgs5v9hU/fF4=;
        b=jYuWlWRtYUrhDkebqGLQ3mboKNDbtHqGcFQpPFs3JLwqB1SzPKmRur9q2xn2B74jDr
         FG8qA3pUZ9MW9Fpi2oI3wWcJZOpBrvSKdhWgHtfj+50DV/B7F0VsCvvoT66I0KXiwx2k
         dwFqEa1AAeuqeINp2wll0+svxkIhBw1ZCRy6fc9w1yt8B6FCA6TIEyUX9CI6cuo60BIB
         puPMQBaJORAYVXlJC04e7M3Z4/8L+3DuyFnBpmRa6kYEdYtW/FzxIdscgUvb12UDB0Aj
         Ci2kazFNgsppbT7FZmwIZIYTzDR0oYgjLpuYKLLCyX0oimkSRa91u5qB4GNaaKIX+hZc
         liOQ==
X-Gm-Message-State: AOAM53046aYav/ZK0EWCrseVtgisSUtGOpDACW/6Cr6Omun41s0984Rh
	ylnaDpEo7VZ+eYq8vYn6HwMm0rTBD4rb6l7dVg0=
X-Google-Smtp-Source: ABdhPJwZ2dpUPKMrdAnJ/MmTD2FuOZLOhqkq45t9sKkqK+2naDSw5gdLeR8tu8odGHw+D7NbcugPrzeJso28BA2wUiQ=
X-Received: by 2002:a05:6830:10:: with SMTP id c16mr2025257otp.252.1621299016743;
 Mon, 17 May 2021 17:50:16 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1620766020.git.lucas.p.stankus@gmail.com>
 <09e65d3a235febfc4c3ee172b573ba8c9cde94b8.1620766020.git.lucas.p.stankus@gmail.com>
 <CA+U=DsptfNDut3984MJkKckgWBhNd_0p17RfpidEXwYhMRfxtg@mail.gmail.com> <20210513165236.586b8beb@jic23-huawei>
In-Reply-To: <20210513165236.586b8beb@jic23-huawei>
From: Lucas Stankus <lucas.p.stankus@gmail.com>
Date: Mon, 17 May 2021 21:49:41 -0300
Message-ID: <CACKVXZBc8DoBRMJ+NnwR1tXkaDk8Jg0Fe0vQGwOrje4=G=AK2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: iio: cdc: ad7746: avoid overwrite of num_channels
To: Jonathan Cameron <jic23@kernel.org>
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	"Hennerich, Michael" <Michael.Hennerich@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio <linux-iio@vger.kernel.org>, 
	linux-staging@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 12:51 PM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Wed, 12 May 2021 20:20:02 +0300
> Alexandru Ardelean <ardeleanalex@gmail.com> wrote:
>
> > On Tue, May 11, 2021 at 11:55 PM Lucas Stankus
> > <lucas.p.stankus@gmail.com> wrote:
> > >
> > > AD7745 devices don't have the CIN2 pins and therefore can't handle related
> > > channels. Forcing the number of AD7746 channels may lead to enabling more
> > > channels than what the hardware actually supports.
> > > Avoid num_channels being overwritten after first assignment.
> > >
> > > Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
> > > ---
> > >  drivers/staging/iio/cdc/ad7746.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
> > > index e03d010b2f4c..9e0da43b2871 100644
> > > --- a/drivers/staging/iio/cdc/ad7746.c
> > > +++ b/drivers/staging/iio/cdc/ad7746.c
> > > @@ -693,7 +693,6 @@ static int ad7746_probe(struct i2c_client *client,
> > >                 indio_dev->num_channels = ARRAY_SIZE(ad7746_channels);
> > >         else
> > >                 indio_dev->num_channels =  ARRAY_SIZE(ad7746_channels) - 2;
> > > -       indio_dev->num_channels = ARRAY_SIZE(ad7746_channels);
> >
> > ohh; good catch
> >
> > this falls into the category of a fix, so a Fixes tag is required;
> > this looks so old, that i did not bother tracking it before
> > 83e416f458d53  [which is 2011]
> >
> > so, maybe something like:
> >
> > Fixes: 83e416f458d53 ("staging: iio: adc: Replace, rewrite ad7745 from
> > scratch.")
>
> ouch.  Given I was queuing up some fixes I've added this one to the fixes-togreg
> branch of iio.git and marked it for stable.
>
> So drop this one from your v2 series with the changes requested in patch 1.
>
> Thanks,
>
> Jonathan

No problems, but I think I should've better checked the mailing list before
sending the patch, it would have avoided the noise.

Anyway, thanks for the review :)

>
> >
> > >         indio_dev->modes = INDIO_DIRECT_MODE;
> > >
> > >         if (pdata) {
> > > --
> > > 2.31.1
> > >
>
