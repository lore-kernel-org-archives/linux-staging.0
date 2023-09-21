Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99614BA26
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:27:09 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so1211671a12.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306428; x=1695911228; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtfnLMS48uOMTYFLHrC4VI+xPTOGEubCm+FExSzwlTk=;
        b=iPVoDMpla3TzbdYb208jBQMPt7Nbr7sah2/juMW0roz7a/m9we2Y8yDp3+Now2ce8b
         PK3q5fQoD2+0d3dY8XjWe0f3dw9WkcwTqqYRFo+poT7A0ZwPbE+Xlyb4+HtyhjcdKuJG
         Kj1xlFdw73/zV/ze6O3JOAzsAcT6/zk8PH0+I5gRd7PcD2ERnaB66lKOvcsf7NeVUqpZ
         CkNHlsOma+K91b08kir/BwleLsARJctcgeRx+oDtu/pIA16+y5yatqG7beZyaJqtiv+y
         M4Vbev+2DkL4TF6b/qtr2h4kwz0nb5ZZKj6JRlzRIQi3jnMDsIu50/QP7UKYQ8/u91AL
         DV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306428; x=1695911228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtfnLMS48uOMTYFLHrC4VI+xPTOGEubCm+FExSzwlTk=;
        b=Yj95e26bIZwhdqMKmRIGVbatnc9W/rTCEV9tr533B2wEbUUWjjg0q14C1VwXyUZUW+
         mAbgruZO2V3lQNEv+rtW9RRGTAOReq75CBZDHqZxvVdCVKQ/HZSGaUN/btsWp/N5z8jg
         23p1mY1U0rLoI2RFe4/nA7UtcwOr8OOdo7O8FLMvVCfsFM/VLy0F2jcuJIQfgWR0zHcn
         L6OX9RVcP8YpSsIN+dpgJoT9ouwRgDuHtMQ3l8ImA3T+itZCB2vmzLrZKCQDyA++IC+D
         AC2JMa9j2e8/VZbrL5Ze0qxG5sRlsU7oFI9FHjrIf5it9nVIRvKe1Z/PVCCpLUywwwTl
         58bg==
X-Gm-Message-State: AOJu0YyOPCepM0RHfhmjIgosY8dma5z6hnC6enrZ1kphN2a1Qne9EuOd
	au2GiLspuBbcA5PmeRAWXC+g6aWLPap4nox9iqgkrw==
X-Google-Smtp-Source: AGHT+IHDdCW8l8v6OhDqZiyja7I2+F2x5WsRgSux5VP1tVFRRWSTYBCB9TdkqRkvd27HKrJXY3PRK7lDy+BsjgySXvg=
X-Received: by 2002:a17:906:d044:b0:9a2:474:4aa0 with SMTP id
 bo4-20020a170906d04400b009a204744aa0mr4171303ejb.48.1695306427980; Thu, 21
 Sep 2023 07:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230921141947.57784-1-dlechner@baylibre.com> <20230921141947.57784-21-dlechner@baylibre.com>
In-Reply-To: <20230921141947.57784-21-dlechner@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 21 Sep 2023 16:26:57 +0200
Message-ID: <CAMknhBFrQivxmE=3voeYgHAtQBf0FSTep7oHfWOAnBTwBogXGw@mail.gmail.com>
Subject: Re: [v2 18/19] staging: iio: resolver: ad2s1210: add phase_lock_range attributes
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like I got some wrong patches in the get-send-email. These two patche=
s
are included in the series "[v2 00/19] iio: resolver: move ad2s1210
out of staging"
so please disregard this copy of the two patches.

On Thu, Sep 21, 2023 at 4:22=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> This adds new phase_lock_range and phase_lock_range_available attributes
> to the ad2s1210 resolver driver. These attributes allow the user to set
> the phase lock range bit in the control register to modify the behavior
> of the resolver to digital converter.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/staging/iio/resolver/ad2s1210.c | 58 +++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/ii=
o/resolver/ad2s1210.c
> index 71f0913b7e2e..f5b8b290e860 100644
> --- a/drivers/staging/iio/resolver/ad2s1210.c
> +++ b/drivers/staging/iio/resolver/ad2s1210.c
> @@ -259,6 +259,60 @@ static ssize_t excitation_frequency_store(struct dev=
ice *dev,
>         return ret;
>  }
>
> +static ssize_t phase_lock_range_show(struct device *dev,
> +                                    struct device_attribute *attr,
> +                                    char *buf)
> +{
> +       struct ad2s1210_state *st =3D iio_priv(dev_to_iio_dev(dev));
> +       int ret;
> +
> +       mutex_lock(&st->lock);
> +       ret =3D regmap_test_bits(st->regmap, AD2S1210_REG_CONTROL,
> +                              AD2S1210_PHASE_LOCK_RANGE_44);
> +       if (ret < 0)
> +               goto error_ret;
> +
> +       ret =3D sprintf(buf, "%d\n", ret ? 44 : 360);
> +
> +error_ret:
> +       mutex_unlock(&st->lock);
> +       return ret;
> +}
> +
> +static ssize_t phase_lock_range_store(struct device *dev,
> +                                     struct device_attribute *attr,
> +                                     const char *buf, size_t len)
> +{
> +       struct ad2s1210_state *st =3D iio_priv(dev_to_iio_dev(dev));
> +       u16 udata;
> +       int ret;
> +
> +       ret =3D kstrtou16(buf, 10, &udata);
> +       if (ret < 0 || (udata !=3D 44 && udata !=3D 360))
> +               return -EINVAL;
> +
> +       mutex_lock(&st->lock);
> +
> +       ret =3D regmap_update_bits(st->regmap, AD2S1210_REG_CONTROL,
> +                                AD2S1210_PHASE_LOCK_RANGE_44,
> +                                udata =3D=3D 44 ? AD2S1210_PHASE_LOCK_RA=
NGE_44 : 0);
> +       if (ret < 0)
> +               goto error_ret;
> +
> +       ret =3D len;
> +
> +error_ret:
> +       mutex_unlock(&st->lock);
> +       return ret;
> +}
> +
> +static ssize_t phase_lock_range_available_show(struct device *dev,
> +                                              struct device_attribute *a=
ttr,
> +                                              char *buf)
> +{
> +       return sprintf(buf, "44 360\n");
> +}
> +
>  /* read the fault register since last sample */
>  static ssize_t ad2s1210_show_fault(struct device *dev,
>                                    struct device_attribute *attr, char *b=
uf)
> @@ -506,6 +560,8 @@ static int ad2s1210_write_raw(struct iio_dev *indio_d=
ev,
>  }
>
>  static IIO_DEVICE_ATTR_RW(excitation_frequency, 0);
> +static IIO_DEVICE_ATTR_RW(phase_lock_range, 0);
> +static IIO_DEVICE_ATTR_RO(phase_lock_range_available, 0);
>  static IIO_DEVICE_ATTR(fault, 0644,
>                        ad2s1210_show_fault, ad2s1210_clear_fault, 0);
>
> @@ -552,6 +608,8 @@ static const struct iio_chan_spec ad2s1210_channels[]=
 =3D {
>
>  static struct attribute *ad2s1210_attributes[] =3D {
>         &iio_dev_attr_excitation_frequency.dev_attr.attr,
> +       &iio_dev_attr_phase_lock_range.dev_attr.attr,
> +       &iio_dev_attr_phase_lock_range_available.dev_attr.attr,
>         &iio_dev_attr_fault.dev_attr.attr,
>         &iio_dev_attr_los_thrd.dev_attr.attr,
>         &iio_dev_attr_dos_ovr_thrd.dev_attr.attr,
> --
> 2.34.1
>
