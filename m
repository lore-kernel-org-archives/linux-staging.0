Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8D911C91
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 15:54:28 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9b1ebc80d0aso548039366b.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 08:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695657267; x=1696262067; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHJtu6podpfARapK3BPhPtM/BxasDmazGp1qQa6N3I4=;
        b=pSbFUrbmUyzqbg1d+HTzB7lLE8CCIdsS+EvtI6wDriAhbllLxa0RghkEH5mn4uQecA
         wX4sEaXWlK53Ldg/VWp9l43/UgmI+s8S5aUNhXLh2oMOxd0Q2FW6c/QtjIqklkZhRDA2
         cIaziSmCOqvmBAsdyYuvLr1hF5GWmW5EzoatOZ8qsGmnV4/LclvCNaLUQ2diLSTdXZiM
         83tMxV516twy06YIVkqU4SLbrhbYjsrA4hL8VjukzL2RJfvk+1l0T/vgrroG4hQgfKZ3
         EDz4cPorkpV4s3SOa7J9TJ4S85rCWJkIk2viL1i4g343AHBHzWb+J8kKbO9I1E3RHEvk
         JVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695657267; x=1696262067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHJtu6podpfARapK3BPhPtM/BxasDmazGp1qQa6N3I4=;
        b=D/69ilVRkaYwUIwyFWWr5prEvpf1TryL8irk9DtPrRFpjBSVQRkeOlKKeoRrj5tn8X
         RuxNw+ZlC/ttg8x61W7CWuLmzqX7E8TSwFcYQQqjPewwpOlkTn3gMh6GrNRMWWkKFK8b
         YAfCUHpRTnbn4ZjQo+QgE/jaRuqWt7Js/5xvNHd6w0pNksbQ+6wMwdjJQ1V8UZz7Khs8
         e9uXumYLBZQc3NmfK6/atXRVCDQyu/zQqSk7On0aPrAU5OpGcF58jtXYbB9mKAUNPJtz
         INrXT3QfY8YugjcppZqHEFUZFEQcDkdH9c0ZkJGBNEGUEUcQGqJuXnhn/7eM5eeeWmB9
         x1Uw==
X-Gm-Message-State: AOJu0YxaFKudXYMhwo9+1O+RtJ8ZcOUj1bYxtuuYSeSNFPcLxsQUkwU2
	6Nz33cMg/XBnuv4MNCslUKQQGuBSjteehMtDH2FLjA==
X-Google-Smtp-Source: AGHT+IFK6F50zQGV+rPZvvFCcUISHHonlUWkooK9m2LrV9WmWEzFMFKZSZUY4LT7DPrua2UQFWGYkh/M8Iiqyyf0n58=
X-Received: by 2002:a17:906:74c5:b0:9b2:7148:dd59 with SMTP id
 z5-20020a17090674c500b009b27148dd59mr5590808ejl.37.1695657267020; Mon, 25 Sep
 2023 08:54:27 -0700 (PDT)
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
Date: Mon, 25 Sep 2023 10:54:15 -0500
Message-ID: <CAMknhBFRe-M9VxHSBA9A7Royneg4zshrf42_2HtYZWRKQ4CCYw@mail.gmail.com>
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
> > +  fault-gpios:
> > +    description:
> > +      GPIO lines connected to the LOT and DOS pins. These pins combine=
d indicate
> > +      the type of fault present, if any. As these pins a pulled low to=
 indicate
> > +      a fault condition, they should be configured as GPIO_ACTIVE_LOW.
>
> What if someone is being odd and connected only 1 of them?
> It's annoying how often people run out of pins and do things like this.
>
> > +    minItems: 2
> > +    maxItems: 2
> > +
In this case the two lines are not independent. If both lines are
asserted, it does
not mean that both LOT and DOS faults exists but rather it means that a LOS
fault exists. So it would seem problematic to allow one without the other h=
ere.
