Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39C814A83
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 16:50:55 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9aa2c6f0806so841438766b.3
        for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 09:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695660654; x=1696265454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZK0Wa94mxZD4Pin962qT1kXm8aCjboYY+1emX2oQt8o=;
        b=lrwIuocVhOo3YQiEPA3Qi0utciM5PeNEJQ7AuucsQeDYsGopc9fhlwjiZTNUJrF47y
         rwEiH4JRZJq+eKaNiMJP6uZnK22BAt3I36JWVBNVtK5qTx9+T2W0jvXFhE8xZNZgsZxv
         dGmpn54pXr3rHv3JM288KiEEZEsEx8+f8AoNx+27/6TMAnHHHZbo8+2d/HpAQBNji35e
         aZF44UVw5+MHW9mDUtMt/fJT1YxXR4JCizFVhgRAdZJ2b2LOp2l+InGmVXgjTjjqxM/H
         tkB7G0s8XBGH/zsIsgrinvVKUIz5n6lVXPxH7LY2dOcGM3HBum447mSC3GAhLFYhepa7
         Iu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695660654; x=1696265454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZK0Wa94mxZD4Pin962qT1kXm8aCjboYY+1emX2oQt8o=;
        b=CcXD03I0dawqKojYTmDFINt+1V4g+EDXatJfjGYuDc9IGLhSzoRE6mF3+k5QpdVPkZ
         SXwG3YuYgka7HyZwGPg2VOWwXjxu5airdTMrMMnfi6UBWoWqeCpG3p1xcrhStROPSDUg
         DmSkw5JCEgjn8nSyCD3NEq5SeBP8v7rzJD6bTOvFRtQWHdStqcUGOirfwS5C5WbVG48U
         y+9F4ZwNiM4fMYb7C8Vxqz/OUqqWo0g+bPiYftQkoYMHEhN5d8QK31W487UI/2kTrezJ
         kkh0fx4SUriRV2ChMIBiWhcPUfCVSaB4Hgu1pi7UsGBq9QDXH5dlei4gzXhdl+ez3hyl
         WzKg==
X-Gm-Message-State: AOJu0Yyfrd8S1ep79XwvI1c94aqxvHhmpbQPdS6SF3vk3lQeJfdl523J
	YsyVxWRA3Jj8enhH8XBGgmsvTXWNgO1HH2hH+UO2VQ==
X-Google-Smtp-Source: AGHT+IGsoV4g2+LteE9K/8LeYzh2EooZgBJOexrqD04mHD3rKyBP8T2APAtV0W+DIdvP1cPsq3xQo6gHIvL+/9I2E1o=
X-Received: by 2002:a17:906:51c9:b0:9ae:82b4:e309 with SMTP id
 v9-20020a17090651c900b009ae82b4e309mr6645063ejk.0.1695660653836; Mon, 25 Sep
 2023 09:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230921144400.62380-1-dlechner@baylibre.com> <20230921144400.62380-20-dlechner@baylibre.com>
 <20230924191711.244ec842@jic23-huawei>
In-Reply-To: <20230924191711.244ec842@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 25 Sep 2023 11:50:42 -0500
Message-ID: <CAMknhBFE49iGkZyP4rdqAmJwY5KnJ0X9UAPC54=BdQFfNuA+kg@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] staging: iio: resolver: ad2s1210: add triggered
 buffer support
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2023 at 1:17=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Thu, 21 Sep 2023 09:44:00 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
...
> > +             /* REVIST: we can read 3 bytes here and also get fault fl=
ags */
>
> Given we have fault detection outputs, does it make sense to do so?
> Or should we just rely on those triggering an interrupt?
>
> > +             ret =3D spi_read(st->sdev, st->rx, 2);
>

I'm thinking the former would be better, but I have a pending inquiry with =
ADI
to get more info on this since the fault pins and/or fault registers
don't seem to
be working quite like the datasheet says they should (I am seeing fault bit=
s set
in the register without the fault pins being asserted).
