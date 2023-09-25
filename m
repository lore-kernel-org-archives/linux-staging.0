Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01418210F2
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 17:48:02 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-99c1c66876aso857513166b.2
        for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 10:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695664081; x=1696268881; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/UN+h0syPysLtxsvFcqWbygnTfY7kE0+mV4pd8zbOE=;
        b=cT1+ZnKt8n1AXIqaJB/vu3r5nriQ6BDyqeOcLISNKkCqjnzR8+9v+d9HA3en6S4ZQ4
         0Vt/2MB0geqkOREUKAt4H7Dw/3k7Sqa5UfYttSFub+9HZ5q+abS7Evltyz04e7OUaPuV
         O4ln19AyY0o+UNFaQkl6p87KGwkIJpsUElhQtXJd+tB1xUtf1l+dj/0kk3k8ohScqBfp
         sarAPrUv+y+fv6hRYF5JWvQiHFv6W1nTeZe2VC8X6sSDx09YvxTvdMOSleQnn+oo4AYU
         HJByMHP24nNdwGlbusGANwVf6tgIVQ8M3L/j5xnNYw9ABFu66PdwVbPcIhDCtyU/JEGk
         8okQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695664081; x=1696268881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/UN+h0syPysLtxsvFcqWbygnTfY7kE0+mV4pd8zbOE=;
        b=qG16tNZv96cXeSQITuvlVzAOP91iEG4trUGeFtJLLoDdMa94SJkApRYJKKM0R1aUXy
         nDm8pXFMk1k2UUlG4plP8mNxygqV9wrEf08kM2MwMBLN4RBRD96iRGJIT7z1M931h++f
         1noQ9TeuM2zDFec2e2iZiByCkLfBq4PLCCi+z4Zvtq2Y017LGh93fkGyx8qpTrJkkEwd
         dZx6Q0+mkXxInwASgnJL9gyJ5RbpErarft39jkxrsqA+1HRuTABrjeERCA+s3krqpQKS
         NOY5JV8OWleHjqsqyWKbdEEJK9/4Og/UUlXIvdnTZam7VVuPRlbX6DPw8RJ+etPm8MV0
         jkFw==
X-Gm-Message-State: AOJu0YzrbVDbu8Z1K5Q+w2U0tZhDApaf6hCjQXIgX96ft+a8PPlNE+3I
	TGSnnqamSdaqVhaqriTqc4ILFQU4GRuv852ilYab0OaQWP+Op4gkr7sD6Q==
X-Google-Smtp-Source: AGHT+IFopHnRoAlyF6POHIUhcvwlhiL61OgNYhhH4qY+wuY7Lc/f7rCYUm4UIz9VvEggFLjrRogYHi+m9F2UFzb7uQQ=
X-Received: by 2002:a17:906:2189:b0:9a1:e941:6f49 with SMTP id
 9-20020a170906218900b009a1e9416f49mr6620490eju.44.1695664081274; Mon, 25 Sep
 2023 10:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230921144400.62380-1-dlechner@baylibre.com> <20230921144400.62380-2-dlechner@baylibre.com>
 <20230924175720.3be2540b@jic23-huawei>
In-Reply-To: <20230924175720.3be2540b@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 25 Sep 2023 12:47:50 -0500
Message-ID: <CAMknhBF56CWKNZ-xvsiaC3c+av8Dvyh+i-op1YxvXv2g8BPYWg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] dt-bindings: iio: resolver: add devicetree
 bindings for ad2s1210
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>, 
	Apelete Seketeli <aseketeli@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2023 at 11:57=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Thu, 21 Sep 2023 09:43:42 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
...
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - spi-cpha
> > +  - clocks
> > +  - sample-gpios
> > +  - assigned-resolution-bits
> > +
> > +oneOf:
> > +  - required:
> > +      - mode-gpios
> > +  - required:
> > +      - adi,fixed-mode
> I think this allows for both.  It's fiddlier to exclude that but would be=
 a nice
> to have perhaps rather than relying on text above that says 'don't do it'=
.
>

example-schema.yaml says that oneOf is XOR (anyOf is OR and would
allow both).
