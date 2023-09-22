Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F5018C2D
	for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 07:55:10 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99c1c66876aso223392866b.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 00:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695369308; x=1695974108; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xo0lap6Lgs4aUClULX8HNoJkpzCnX/7Jsbfgdxnl/pY=;
        b=FUumDn+3U8ajCQd04+hnHEPCXoyokk9vp8cyG0tXyrW0oK+ciPrVvNRCHeCNlJ/cpS
         uJjVDMGy341mAqzmRWHxND892yW9AEUtP47lA0dnpG98MvbQTjPPKx7knturiqLu3qGp
         23ki9IPeKZ+RvbVCfd8YfThM1NK2pIjaw/hF2Em3HQz7CoSS2lctEUbH46aLsDOYOAs1
         SaI6woO8oXqu/VAG+YVKLLsBIaX3oUf9esNp6RMT6NLiHc/9dTfQzOr2oOLK1x4skvw9
         bGC58BuAm9oSXFJcTLtOLJ2TIKzZPa69s+YGTnJMOP6Xeifgyc24apk6nqCBbX4mtlNo
         hNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695369308; x=1695974108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xo0lap6Lgs4aUClULX8HNoJkpzCnX/7Jsbfgdxnl/pY=;
        b=vOKdQcmYpfjOi8gAX5EE9J/x8q38cm80evvqRSLPCDFBCsO3i2BLZfuPKUwl9ctMZK
         zGNGZBFy2171nI7gK+gMwBOMSpoU/+fHUhz1t2ZRWDp/5ArCt6ROukixjAM7JJZFC+2B
         Bd6a3L1amARL/V/KcHnKuf7A4TQJI8SXW3HnnlD2GWQZIaMWHocHYQb56KJn/sseKWGI
         yFrGjj+GXlvWnl69xWKLHkoyzxFaB7EI4R1uBmqNX80iyJITXSC0r2zTHh9Qmo5oWv+1
         O9ntjBbaFgf9/akwSMKdz0CWTTqjDRQoVmrRJaGB2fpmMFXMuipWzddNRV4OSP+54mBp
         vhoQ==
X-Gm-Message-State: AOJu0Yxw6afw47g8BwIN0Jx20zqLYjGr5PVKGI8PS1wKb0P289LyJb+l
	2G913sajBC88ohVru2n9WJLKfmW34371YKfjJNxw8A==
X-Google-Smtp-Source: AGHT+IHSS1vKwEC9knLhqPNk1Y0RB0kqAke1ZsK8aoLkzIhsG+WewxcfwopOZUPCJajquFT5HL9JcQU2cuAIG7Q6jvU=
X-Received: by 2002:a17:906:2009:b0:9a5:c49e:7145 with SMTP id
 9-20020a170906200900b009a5c49e7145mr6718209ejo.69.1695369308485; Fri, 22 Sep
 2023 00:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920170253.203395-1-dlechner@baylibre.com>
 <20230920170253.203395-5-dlechner@baylibre.com> <20230921154514.GA383967-robh@kernel.org>
In-Reply-To: <20230921154514.GA383967-robh@kernel.org>
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 22 Sep 2023 09:54:57 +0200
Message-ID: <CAMknhBEVLZYQieKPCCf8QHp7H06Vsdobg_7qGm+MsbL8Kg-VCQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] iio: resolver: add new driver for AD2S1210
To: Rob Herring <robh@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 5:45=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Sep 20, 2023 at 12:02:53PM -0500, David Lechner wrote:
> > This adds a new driver for Analog Devices, Inc. AD2S1210 resolver to
> > digital converter. The driver is based on the staging driver with the
> > following improvements:
> >

...

> > - Use devicetree to specify resolution instead of sysfs attribute.
>
> Why? sysfs allows a user to change at run-time. DT is a firmware
> change. What/who determines the resolution? Unless it's the hardware
> design/designer, it probably doesn't belong in DT.
>

This one is a bit of a gray area since it could be either way. The chip
has two input pins for selecting the resolution. If the hardware
designer decides to connect these to gpios, then they could be changed
at runtime. But if the hardware designer decides to hard-wire these pins
then we need to supply this information via the devicetree.

The choice of the resolution is determined by the physical requirements
of the full system. This device measures rotational position and velocity.
So the main reason to pick something less than the full 16-bit resolution i=
s
if the max rotational speed of whatever is connected is going to be greater
than 125 revolutions per second (assuming 8.192 MHz clock).
