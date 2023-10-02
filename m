Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C8D1EA8C
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 18:50:04 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-538575a38ffso26484a12.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696272603; x=1696877403; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lci7aE9Nr12rnsuBj8lxjXGwqKY+F3Jq4/Wt3MfIP2I=;
        b=cNDH0cBfghdsIIJ9hJzREhrqak5gmuD09KcaHWEfnD/SnhLVvReUCi4BUazbSKywtB
         HNXrPqRUH2UDZ7wmAmmA46H3+PBV581+Se94b0BwdvuMM5YGJqOjvagBwf0RuDl1ZIBE
         1RJ1HG8uYaJFzXrffgbKw6eKT9toSZaKL2DcjQe107TW3i3pKzOVFWQoocN5z9EUXw4w
         GyM72CgbL550ot+RCkQgQfA2vhXGZDFYAUkO19e+hxfLuW0iD9jQdADMA+Rj6KsQoU55
         dzVot9GHgBL+iVu4UYoy1bQWJSZeqNKdvxlB8iVFc7qzlgWzoyMKq3KFK0gDpSZwwygB
         DO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696272603; x=1696877403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lci7aE9Nr12rnsuBj8lxjXGwqKY+F3Jq4/Wt3MfIP2I=;
        b=WTvMYr2Q+Y1mvExuEc/Tb5XFZT5+rEIerB/UkziCvbcEY9nKxq8+YFRJoyFxdnWfQF
         Q40JqEiC0+cjIqOVh2nCfY6p2sG2a/7xJuhzfTBFwbHveWLgRcANRg5NdYWbfavKFRUQ
         sEncGb2AGZlOU9MxUvVXfWfxLOvgPg7frvTDu1saQV0dSTXLi5Ixzl0ZWS7Ag9VKNWV1
         dn98ed7hM16c8msS7BIdpfPlAS2o31c90zRIvAktjLWFtyqSB/tHpFUxkyxThx2cTLri
         Gx3zi8JclYqsV3YCKJKib7XRtKEKQbGHhgryvMiCQlzQcn/O9RKWI2/Fn4VLNpU9HCCq
         WsRA==
X-Gm-Message-State: AOJu0YwWvj+I2z9peAZSBo38sMQmfoXaz1uL33Dcks4j9quW3esFOh3j
	tGPLZy8gBpUvr7lyu1i65PEu549C3Bt+ANZFhtnM4A==
X-Google-Smtp-Source: AGHT+IGL+kcb6ZIi1pHexQ8Fkm4S3zA9EjTyFErM4ZJzlSAeQCJ0yHHY0K9LT47stqhw9jK05IhHUx7c6c+C9uoQT4Y=
X-Received: by 2002:a05:6402:1a28:b0:531:1241:3e98 with SMTP id
 be8-20020a0564021a2800b0053112413e98mr9957195edb.9.1696272602654; Mon, 02 Oct
 2023 11:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
 <20230929-ad2s1210-mainline-v3-26-fa4364281745@baylibre.com>
 <20230930170046.36637e9c@jic23-huawei> <CAMknhBH4+cUSX_j3-Y0xuTEiZHd3Ke4Zm8FdxLZJwn5gr_d-ug@mail.gmail.com>
In-Reply-To: <CAMknhBH4+cUSX_j3-Y0xuTEiZHd3Ke4Zm8FdxLZJwn5gr_d-ug@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 2 Oct 2023 13:49:51 -0500
Message-ID: <CAMknhBGFpYx3oYqJgVgKZpoeANmVmXtUn+V3VnAW7woc7ytTow@mail.gmail.com>
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

On Mon, Oct 2, 2023 at 11:58=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On Sat, Sep 30, 2023 at 11:00=E2=80=AFAM Jonathan Cameron <jic23@kernel.o=
rg> wrote:
> >
> > On Fri, 29 Sep 2023 12:23:31 -0500
> > David Lechner <dlechner@baylibre.com> wrote:
> >
> > > From: David Lechner <david@lechnology.com>
> > >
> > > From: David Lechner <dlechner@baylibre.com>
> > >
> > > When reading the position and velocity on the AD2S1210, there is also=
 a
> > > 3rd byte following the two data bytes that contains the fault flag bi=
ts.
> > > This patch adds support for reading this byte and generating events w=
hen
> > > faults occur.
> > >
> > > The faults are mapped to various channels and event types in order to
> > > have a unique event for each fault.
> > >
> > > Signed-off-by: David Lechner <dlechner@baylibre.com>
> >
> > Use of x and y modifiers is a little odd.  What was your reasoning?
> > Was it just that there was a X_OR_Y modifier?  If so, don't use that!
> > It seemed like a good idea at the time, but it's not nice to deal with
> > and requires a channel with that modifier to hang the controls off
> > + make sure userspace expects that event code.
>
>
> Regarding the point about "requires a channel with that modifier to
> hang the controls off...". Although that comment was about modifiers,
> does it also apply in general.
>
> There are several fault events that don't have any configurable
> parameters, namely _sine/cosine inputs clipping_ and _velocity exceeds
> max tracking rate_. So there won't be any attributes that contain the
> event specification for those (e.g. no `events/in_angl0_*`
> attributes). It sounds like this would be a problem as well?
>
> Should we consider a IIO_EV_INFO_LABEL so that we can have some sort
> of attribute (namely `events/<dir>_<channel spec>_label`) so that
> userspace can enumerate expected events for non-configurable events?

Well, I didn't think that all the way through before I hit send.
IIO_EV_INFO_LABEL is clearly not the right way to implement a
`events/*_label` attribute, but however we consider going about it,
the point of adding such an attribute was the main idea.
