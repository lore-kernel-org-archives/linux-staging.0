Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0913518E00
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 16:43:31 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53406799540so17129181a12.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 09:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696265010; x=1696869810; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x93iIN0fNUqVoRi/c/6JJ+kFUaB/mOrDLlTEcgIl4+M=;
        b=mLpQbegwLuJN64M6sSNsOyWGSHl4mMa+mgok9c3MXXAsIDrX9+cYypNVqO4cZuh6zM
         /pIk4mA5UIqwoNPCBmNwdNUbAxA4UW/qt74n5Pd1AoYLrStKBAt4P45dPsAPgrAz3qxU
         4LYAhWZYSfGyCPmkTS9DtKrg8xP0i4bxZR/7n8nw9hS+jOYVlK4c/kCGN6ogtoWYiDkb
         4+xt9USDEigAVyJNgJZYAsATiEc+s6y+If8wtT7VGAI6pO7AKtwVstcrKAj2d2CNVbdP
         kiiRsCfvODbPwaUQG23/ivlHiRXSTqpCeUA8HcllTTq8fflesT2JEQYUmc7EiADYsIWY
         yikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696265010; x=1696869810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x93iIN0fNUqVoRi/c/6JJ+kFUaB/mOrDLlTEcgIl4+M=;
        b=Y6IGrdMzHNypwV5lSAfKe1/jy0nGIjVuKGi+mJgXYACsUKgElq8dU6AYQ8oHR9yo9u
         qcR8O2t+w+BiEIpN9cmj68k9oc35ux+xs+jr2Qx8qONgija2pQdTxCuEQs+wPcyfmSIB
         krYCPJZQIkzrTXWpiWPtZumbqeGMiDxWGuNW5aeHP1JkLqL9bNDt+cS2jKyATePl9/0G
         O90UeS2Sw52vG5BM4iTExBdjYRXBFdZ6s1fzCpKI70AxCzFE5xv/8UCfw6g8udZOh0EN
         8FV5VIw9RybKuxqlFUZQFHStwhO//ft066xoQtnpAVq0CA+8qK7T84zpzWmaf1G9Qdp6
         /73g==
X-Gm-Message-State: AOJu0Yzldj+5BaHgn10x+1dsik3zlFpJF4bXSK8SRK/U+WEMKFBo/GX2
	4wuQ7UB/D7NUz0RZDg7+ijWb2ajZBEPqh8YIE0eJjQ==
X-Google-Smtp-Source: AGHT+IHDDMMxoHK1rMkkwfVFldZ+KWxjIjoU9+PtnwHrVewlRhb5UP5vNxEhatM3whdpv4O1/RWIUBsxnkMjfmKqjDE=
X-Received: by 2002:aa7:c157:0:b0:533:4c67:c911 with SMTP id
 r23-20020aa7c157000000b005334c67c911mr11352514edp.19.1696265010143; Mon, 02
 Oct 2023 09:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
 <20230929-ad2s1210-mainline-v3-26-fa4364281745@baylibre.com> <20230930170046.36637e9c@jic23-huawei>
In-Reply-To: <20230930170046.36637e9c@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 2 Oct 2023 11:43:19 -0500
Message-ID: <CAMknhBE0CfASN9Vb0aZWt4Cebik2cF8QVBaXCvyJy9dNF-PjdA@mail.gmail.com>
Subject: Re: [PATCH v3 26/27] staging: iio: resolver: ad2s1210: implement
 fault events
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, David Lechner <david@lechnology.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 11:00=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Fri, 29 Sep 2023 12:23:31 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > From: David Lechner <david@lechnology.com>
> >
> > From: David Lechner <dlechner@baylibre.com>
> >
> > When reading the position and velocity on the AD2S1210, there is also a
> > 3rd byte following the two data bytes that contains the fault flag bits=
.
> > This patch adds support for reading this byte and generating events whe=
n
> > faults occur.
> >
> > The faults are mapped to various channels and event types in order to
> > have a unique event for each fault.
> >
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
>
> Use of x and y modifiers is a little odd.  What was your reasoning?
> Was it just that there was a X_OR_Y modifier?  If so, don't use that!
> It seemed like a good idea at the time, but it's not nice to deal with
> and requires a channel with that modifier to hang the controls off
> + make sure userspace expects that event code.
>

Yes, I was perhaps getting a bit too creative here (the two inputs
come from transformers mounted 90 degrees apart so measure X and Y
component of an angle). The only reason I did this was to take
advantage of the possibility of an "OR" event to avoid double events
for a single fault bit. We can just go with the double event on the
two different input channels as discussed in "[PATCH v3 22/27]
staging: iio: resolver: ad2s1210: convert LOS threshold to event
attr".
