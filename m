Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857644C8C
	for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554117; cv=none; b=tBLU1EUJYCpbFy+V+8pzd9eIqBDgiCmtuzOVKJaHnymTu2dsot/6RKTY10m5vCfOVB54afl0T/r/7KjkW62bV5O0DiKrge5T4Cgt7vYPVvqn/zcMnGFmW02SZ8TUujqsMGMs2q0dBPUS1vadpBeOlkfy/d1ODElyIMDj6sshEoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554117; c=relaxed/simple;
	bh=OW9ZXqxEkr9RUH5IYYordISjGdWv1zhb8JCl6eodq94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iB1TIz6KleT/uCnSP+F+EWMX7ZUqNVnSpCdURXV+PWGh6mt7NRG/GcHx0CT7xwipfnFNrZYlcllA+NjI5SB3JKHdv4at8SFt6bLjFbrBaSq9X00X0Gi9rv9W6vG4ICaEUXF+VEbEOvus7EX8hHI47v0KpZDcaZkm2sKAHNbcTYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nUrLY6WZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nUrLY6WZ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a728f74c23dso593528966b.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723554114; x=1724158914; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZ3qkhG6IpTE9k1+4JdfEiuc6iwsZmU2tud2hbQlnTM=;
        b=nUrLY6WZu1HDSfmZqL7DZs9VBiQcHqtFrqGkMEe60AVEcQ65o/DQJ1IApeRw8XEcl+
         JEop0Lqltjc2nyNJiWsrc3NrUssu/CayGTQu//ZBr7E9tOgN6ossMd09IVpAoGpmar97
         fOLqfDtz3gSXJdFpIbl338bEr5tLUhATLWPEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554114; x=1724158914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZ3qkhG6IpTE9k1+4JdfEiuc6iwsZmU2tud2hbQlnTM=;
        b=IeSu4JACGVY/ZQ0imumkGIHh8tL3ksFWvREIZkCtVD7KjIvRpJhRDQwKhoj2pKpcww
         YdPeRNYQr0C+RPiagcGqfLlf59T73rsWSbqUJnphHOGX7cG2/uja6vzWJ1fe4B7tQvjs
         dAPWk5bPa1IjGqXbtPOXLMRUuxX8TOnJowKTl/GaIg9NuCM/b9xP309Lyqk4G90oyQpN
         7DtyNx1+T1Gb83rV10734dk4ojru1AD4mH6g15Vr+++Wa8BMzAtJZ99fK8URQ4Gr4L3w
         HtFItNzKYoVgAaSdDU+ISDEPd6xB1GJejymRH16D6ey1h2qm4pXEkB4HBS6f60+qbG+g
         eQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPj9DsToWhbKkzF7xbRiW5ws3/EHojuzjf2jbl77zVZPvr6rmU2uRh83M4EmadJ2LEvCbEdUL3KrCh7S5zYb7HIPUAQeAMUMp1H8XfCA==
X-Gm-Message-State: AOJu0YxSdzlsPeLt+GaqBAf7wzDIFa1cknAOU7wFvIo/xse+LattvvKb
	CtV08+vjlmfCPboCyJlr22cw8z6w74sNkHNMQcBmAMvGRxF4lfU7XDQgy908yZjBLCNtUr50VUB
	sxQ==
X-Google-Smtp-Source: AGHT+IHIMdfjTjLw/GVj6fVlRSo6/bqAqGQDxCuUpxQbRfJyyNvYMSFSO8xtg1vVFba1RqgxTx/l+A==
X-Received: by 2002:a17:907:7212:b0:a7a:9ca6:531 with SMTP id a640c23a62f3a-a80ed1b59ccmr233445166b.4.1723554113607;
        Tue, 13 Aug 2024 06:01:53 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3fa4646sm69505766b.54.2024.08.13.06.01.52
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 06:01:52 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7a9e25008aso92040366b.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 06:01:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsXHV9E8yRQGAyTXDrj2DS8mJsTzTq0yWDcsQPzFyQF+nHk1vK7e5VcOlugETH70S6y+Sgz1dVo3ejDmwnzFeHqjnRu073W3X3t1tCDw==
X-Received: by 2002:a17:907:d2d9:b0:a7a:ae85:f245 with SMTP id
 a640c23a62f3a-a80ed258d19mr244135166b.38.1723554111718; Tue, 13 Aug 2024
 06:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
 <20240813-smatch-clock-v1-1-664c84295b1c@chromium.org> <ce0ed949-5e57-4193-8190-9e4aa9cb62be@stanley.mountain>
In-Reply-To: <ce0ed949-5e57-4193-8190-9e4aa9cb62be@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 15:01:37 +0200
X-Gmail-Original-Message-ID: <CANiDSCu6BUdJt1sjmbOq2s4KU1JUN9D+HfnvSG6OqMhD-dKekw@mail.gmail.com>
Message-ID: <CANiDSCu6BUdJt1sjmbOq2s4KU1JUN9D+HfnvSG6OqMhD-dKekw@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: ar0521: Refactor ar0521_power_off()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Tue, 13 Aug 2024 at 14:54, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Tue, Aug 13, 2024 at 12:13:48PM +0000, Ricardo Ribalda wrote:
> > Factor out all the power off logic, except the clk_disable_unprepare(),
> > to a new function __ar0521_power_off().
> >
> > This allows ar0521_power_on() to explicitly clean-out the clock during
> > the error-path.
> >
> > The following smatch warning is fixed:
> > drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 912.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
>
> It's better to just ignore false positives...  The problem here is that
> Smatch can't track that to_ar0521_dev(dev_get_drvdata(dev))->sensor is the same
> as sensor.  What I could do is say that "this frees *something* unknown" so
> let's silence the warning."
>
> The problem is that check_unwind.c is not very granular.  It just marks things
> as allocated and freed.  I could make it more granular so the free and the
> alloc have to match.  Or we could match based on the type.  This frees a
> "struct ar0521_dev" so mark all those as freed in the caller.
>
> >  drivers/media/i2c/ar0521.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > index 09331cf95c62..2c528db31ba6 100644
> > --- a/drivers/media/i2c/ar0521.c
> > +++ b/drivers/media/i2c/ar0521.c
> > @@ -835,7 +835,7 @@ static const struct initial_reg {
> >            be(0x0707)), /* 3F44: couple k factor 2 */
> >  };
> >
> > -static int ar0521_power_off(struct device *dev)
> > +static void __ar0521_power_off(struct device *dev)
> >  {
> >       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >       struct ar0521_dev *sensor = to_ar0521_dev(sd);
> > @@ -850,6 +850,16 @@ static int ar0521_power_off(struct device *dev)
> >               if (sensor->supplies[i])
> >                       regulator_disable(sensor->supplies[i]);
> >       }
> > +}
> > +
> > +static int ar0521_power_off(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +     struct ar0521_dev *sensor = to_ar0521_dev(sd);
> > +
> > +     clk_disable_unprepare(sensor->extclk);
> > +     __ar0521_power_off(dev);
>
> You had intended to remove the clk_disable_unprepare() from __ar0521_power_off()
> but forgot so these are double unprepares.

Ups, thanks for catching it :)

Will send as v2, unless you fix it in smatch first ;P

Regards!

>
> regards,
> dan carpenter
>
> > +
> >       return 0;
> >  }
> >
> > @@ -908,7 +918,8 @@ static int ar0521_power_on(struct device *dev)
> >
> >       return 0;
> >  off:
> > -     ar0521_power_off(dev);
> > +     clk_disable_unprepare(sensor->extclk);
> > +     __ar0521_power_off(dev);
> >       return ret;
> >  }
> >
> >
> > --
> > 2.46.0.76.ge559c4bf1a-goog
> >



-- 
Ricardo Ribalda
