Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B7A613C
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 16:37:20 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9ad810be221so862441566b.2
        for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 09:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695659839; x=1696264639; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XCsL9O31+ub/w4O62oibz3JG1gJ1/+3uXSRPucbY31Q=;
        b=2TXfuogEa8Tn35wM0vy6SLTVgNfgXgNFISiC7wLkGh8VE/5QM0eQiCAFQ+NTrY5a/d
         VixedTifm67DLL2PfbrhxB/fB8Q5jRrd47EUIXlSipBfBuVh5Lm6KmirUtud3FUpXMD0
         zXyUBNI1gULMoAAf/y9Ja7JXQKFiauszPwoTYVC+aQ/088hFXVPXQL8ZSAuyKeEQ51rT
         TnXngepSmbgwIBN6RIOi/Dtl34jE9C7Y48sGy0ohOcooffATwHxveBfW024UmqfjZcVE
         0Pz5hP5p5lF28fkvOK62MLmbi56VAMkavyANVA/23b+VYINWbTAlOqT6Vq0hQc9CVlO/
         VTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695659839; x=1696264639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCsL9O31+ub/w4O62oibz3JG1gJ1/+3uXSRPucbY31Q=;
        b=mjL7IywUgjKQ+kk0it5c3cOzozpcncnO+wNLS9AO2r9YkK3sm6xz9XfLdEPj273/Ut
         puXN7A+MhK9fgIlGTyR0Wl2Wi8gyHhqKqAYEZ6zFJupJEsH5wwhNBm7i/dIAqhJGRNqa
         iL5YE+C0lSn19UNUZ3U4tZxRdM9nzrPmbE2YHFkBdzttSnw5h7oCs7D4MZc4CLHuSuYR
         lQP7m1MnR/KjqW/aTghwGPoTttZflTgaSnpvhppHUytpOgn52m+quQ1BmqdohUUQmpll
         U89qmUKKWeVVLkkLqQf6jjmuRwfbrEx7Gx7J+/7wYqr/Oz4c+pUEscYcG3uk89Q1NJNm
         Jvvw==
X-Gm-Message-State: AOJu0YykyF2fJzHu3oQQV8+2qJ91gptQk3nCBC6tz3ajHwdres6zjUtJ
	dI3MpHq5PSzlJQ5A9PAXGm8x/V/3wMAQ4D0K8EKB9Q==
X-Google-Smtp-Source: AGHT+IFD7lzXMvCXQOFmekS6RNokyWqG7NHLM0il8mO+/QOBoiAPubZ810+kAeu1PedLTs6VzXhNk88WVq2e3EOI64o=
X-Received: by 2002:a17:906:c14f:b0:9ad:a4bd:dc67 with SMTP id
 dp15-20020a170906c14f00b009ada4bddc67mr9258502ejc.50.1695659839417; Mon, 25
 Sep 2023 09:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230921144400.62380-1-dlechner@baylibre.com> <20230921144400.62380-10-dlechner@baylibre.com>
 <20230924185902.579a444b@jic23-huawei>
In-Reply-To: <20230924185902.579a444b@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 25 Sep 2023 11:37:08 -0500
Message-ID: <CAMknhBEsiaSu87Xi1J4BZHrrz4wOovHUVCJz1BgcG00LGJk+gw@mail.gmail.com>
Subject: Re: [PATCH v2 09/19] staging: iio: resolver: ad2s1210: use regmap for
 config registers
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

> > -     if (ret & AD2S1210_MSB_IS_HIGH) {
> I guess this was meant to be a sanity check on the chip responding.
>
> > -             ret = -EIO;
> > -             goto error_ret;
> > -     }
> > -

Yes, according to the data sheet, if this bit is set, it means there was a
configuration parity error. This test has been moved to the
ad2s1210_regmap_reg_read() function.
