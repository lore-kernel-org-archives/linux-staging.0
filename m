Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8F151BA1
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:53:13 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-533c8f8f91dso15299602a12.0
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696009992; x=1696614792; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MalbAsDSrxzjZfhI3UpJdjmgfxP084DXecPXrcCn5EI=;
        b=CXRyZssK0l+W3m1BcX5w9WtLarwpTiYCM4Sx8uPGsTZuttAzLUfiKJKBuxz4Sib9tA
         pCQ4sipaNApKz+PFAdBSfHF9FfkmKTVD3fhlT/oBf+QLBJP21NK2hmdvRSpl+CpqIb/z
         UcB9tpWUZM5AC4fZG4jXNk0Vi+bwDbHzojav97dsLv7BhSvvseZ/37Cjiy20jQ60bF6I
         DU6VwZtEGZPKUAakZxbc4Ag41KuFExzAxkZ7/YpKpsKGbYkcu5yMQ5VNHUdxnbBPaeE5
         U+Gr08BK0S0neE3b/xw2Vk0dPw97FT8Djb248SJYCurEuigkSp8OAU0ex5wmY2wbxo33
         FaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696009992; x=1696614792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MalbAsDSrxzjZfhI3UpJdjmgfxP084DXecPXrcCn5EI=;
        b=b1sU5S+i0u+uUVCCZVPKu1PLct8pRm68UP4K/0MRmhXe6NUtsot+fS1VpV1kzI7Xj9
         5VUT9i6wgK2vOFu3qAPNP2niN06jwwQ+udvxcqGy7ZDOpYYxTUR0eWnf3UhRAzD8rhWP
         P8XYceArB8E8gu0n1g46pbBe2uRQDb+tllJ6Lmm16ZBUEPMV5SHM+o5z0Z6djKVwE8sT
         E7mm98/WaXSqnRCCa31vcX9LWwf7FCT5dv5bFkiwxqZl0S2aFiJ09ewbHNJURgoJ5mKY
         HIqQhW9V8vmY2ebhyw/BHyg0OTXtWplcbGFFVY0upeZcrkoqYoY/ZNP73FqC2NXJ7ykV
         MnkA==
X-Gm-Message-State: AOJu0Yy73dvu8MOHFdUP5L/5WelcBBGKbkLTeKwhKrigKd5LM7G5ZdxB
	Wj/udPdg7Un2jJMkTvGrB3qq+v5u33Byrsdf3eEldw==
X-Google-Smtp-Source: AGHT+IEwVthYBKcUdzG5goS3Tz+AFoCkOi/JKiHPwq7Emnrwxe4IPK/TuAsuGn3/e6k3o6iloUXzLX5MXhaxLm3Wfko=
X-Received: by 2002:aa7:d607:0:b0:531:28fd:ad10 with SMTP id
 c7-20020aa7d607000000b0053128fdad10mr4564655edr.38.1696009991734; Fri, 29 Sep
 2023 10:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com> <20230929-ad2s1210-mainline-v3-14-fa4364281745@baylibre.com>
In-Reply-To: <20230929-ad2s1210-mainline-v3-14-fa4364281745@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 29 Sep 2023 12:53:00 -0500
Message-ID: <CAMknhBGFBwQQouhsPMgCuMn6+eQfDCcSzJvF-DwJAnoEPvMLAA@mail.gmail.com>
Subject: Re: [PATCH v3 14/27] staging: iio: resolver: ad2s1210: implement
 hysteresis as channel attr
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: David Lechner <david@lechnology.com>, Jonathan Cameron <jic23@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 12:25=E2=80=AFPM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> The AD2S1210 resolver has a hysteresis feature that can be used to
> prevent flicker in the LSB of the position register. This can be either
> enabled or disabled. Disabling hysteresis is useful for increasing
> precision by oversampling.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

...

> +static int ad2s1210_read_avail(struct iio_dev *indio_dev,
> +                              struct iio_chan_spec const *chan,
> +                              const int **vals, int *type,
> +                              int *length, long mask)
> +{
> +       static const int hysteresis_available[] =3D { 0, 1 };

This is basically an enable/disable. Should the 1 value be changed to the
appropriate radians value since this is hysteresis on the position
(angle) channel?

> +
> +       switch (mask) {
> +       case IIO_CHAN_INFO_HYSTERESIS:
> +               switch (chan->type) {
> +               case IIO_ANGL:
> +                       *vals =3D hysteresis_available;
> +                       *type =3D IIO_VAL_INT;
> +                       *length =3D ARRAY_SIZE(hysteresis_available);
> +                       return IIO_AVAIL_LIST;
> +               default:
> +                       return -EINVAL;
> +               }
> +       default:
> +               return -EINVAL;
> +       }
> +}
>
