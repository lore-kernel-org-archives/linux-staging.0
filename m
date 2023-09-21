Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC0944C
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 09:40:44 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9ad8a822508so86716866b.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695289242; x=1695894042; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpzQyHHzEyWIms3Xvm/C3MN/zZk6cMQQr8BMD0wmneQ=;
        b=b/FfMiMB+q/5PeLyD+35c/AwUNDq93TYwAYAldtPjkjYux1fH1nxXCElDIUv7UdiNc
         JRYS+3XsSbmWUMrO2XeKBvZo892tCr0U926ESPXapdsQQJS4IMAdKjfbu8LBg/ROBd3Q
         FYxKm/7D0fXiI9b3GdJOUgJkgUxasyWDQcC7We77DzATs/PTNysjAo/0l/G3lhnoFm6G
         zpj9ahYlXHTCaM4lZWkEeNt3j8TD0CUoDLEId9yDqaB7EU7UKeJgtxACtcxC2qgkd1DN
         9GCDSUL4RsDB8+Hzfm/jr9nkjJ8DCx3W0/i9ncH7UfamCCyDGU08qQKxkFxc0VEwD2vm
         7L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695289242; x=1695894042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpzQyHHzEyWIms3Xvm/C3MN/zZk6cMQQr8BMD0wmneQ=;
        b=IHshqV2VTbicJ79i/0xAig3hAa9PnShSy86DMFyLzaVCW3wABCnTw9s/dj7oOpjLR8
         25QyeP841zextxjwMtbKuzQ9pXjotYRcgC4MUublNImPwjSBgd1rg7Gqm7EIQHdS+kyn
         C30o+8QZ2ak4RENw/KtKqfSqjBSfLnf7ODsneG3GeMF0gO00yB/wcAAd9WgRUYDR2gEm
         /nNM5q++8+jX0dZPsp805L+eoB0xt/+4N8a47uMR+zZhWrbrZK3UJADci2+p4YmaXC1o
         FuyKG3xSHdAlv7ZgBqeECozUHhuZVDzc1xOw1CjDLLdi6WbP7nkWD5mkNJbvYJMqiqwk
         Rakg==
X-Gm-Message-State: AOJu0Yzm5JN9lnosQhE/B/2MjRpSnbz4zZTBClFC5M+eRHw34mAp1ey+
	JP++071TFNCMy3Hd86lg6U3dY+S3krg/8sxEjYmp0Q==
X-Google-Smtp-Source: AGHT+IFpyIuxAeI+zJtqVgso5gl/oZPdQPJ8OzyoLwfbQ+BnxcwAYhxcZ6tg7lLrRy8p1y2N9Tuf2kP/Jg+Cn/6HtPI=
X-Received: by 2002:a17:906:30c6:b0:9ad:e43b:1ef2 with SMTP id
 b6-20020a17090630c600b009ade43b1ef2mr4584204ejb.16.1695289242308; Thu, 21 Sep
 2023 02:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920170253.203395-1-dlechner@baylibre.com>
 <20230920170253.203395-2-dlechner@baylibre.com> <20230921-b304d3fd05b37a8588e101a2@fedora>
In-Reply-To: <20230921-b304d3fd05b37a8588e101a2@fedora>
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 21 Sep 2023 11:40:31 +0200
Message-ID: <CAMknhBFfxWy4mWDVYkmaEBx3KkJnRvo1CsNSuab2Rj0TdtozQA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: iio: resolver: add devicetree bindings
 for ad2s1210
To: Conor Dooley <conor@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>, 
	Apelete Seketeli <aseketeli@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 11:06=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> > Signed-off-by: Apelete Seketeli <aseketeli@baylibre.com>
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
>
> Missing a From: or co-developed-by?

Missing Co-developed-by:. Will fix.

> > +maintainers:
> > +  - Michael Hennerich <michael.hennerich@analog.com>
>
> Why's this a chap from analog, rather than the authors?

This was written by my codeveloper so not sure about the why. Michael is
on the CC so he can clarify if this is not correct.

> > +  sample-gpios:
> > +    description: |
>
> What do you need the pipe for here? Don't see some formatting requiring
> preservation. Ditto below.
>

It is just a habit to always do this for multi-line text. Will remove.

> > +
> > +  assigned-resolution-bits:
>
> I figure the lack of a vendor prefix here is "inspired" by the same
> property for stm32?
>

Correct.
