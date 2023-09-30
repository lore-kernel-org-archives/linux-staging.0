Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90871138E
	for <linux-staging@lists.linux.dev>; Sat, 30 Sep 2023 21:23:33 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-533c4d20b33so4116875a12.0
        for <linux-staging@lists.linux.dev>; Sat, 30 Sep 2023 14:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696109011; x=1696713811; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig8A07CWjYmG/EAk3sHFUJZdpg9ocf6hfO0M1rWBntA=;
        b=x+PXW8R8QJdlnmktLsrUqhWK8uZ/qqs5JD0g7ZapYZBESCBj9nAx9lJTqO3/+FqqNJ
         KGDHn01COOUw90p8drD0/P0bPL273N9qNp2484HMSTS3X/Id/P65hvKRZsuRVtlex7zP
         EOyFq8DxrHY/iMBZay3LY5C+wNtaCW5UzvQM0a1ZlT8muSv6x7kueSoO022rC0cakFqK
         8MdhwgKqhM143BHcHmFSgXHRay6swdv8Phs8z2jlktkc2XjRy8Y6vTpNCw630j2tBNeD
         CvJWNPEJi2k+LYWgu5sArkbEyq1MUAzZCabCnIxlbGO1rmeu0/ieCnIAWJJXwdCPZAkN
         JQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696109011; x=1696713811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ig8A07CWjYmG/EAk3sHFUJZdpg9ocf6hfO0M1rWBntA=;
        b=Fw2rfuBtprio2AYt5VSJjkie6fUsjjx3AGfLV4EnznrTZh/2xazEwg/+ZHZ2+LraDJ
         2eM+cv6Pb0mkF2uMgt6xkgNGcbk9X9vGxGVQ0Ym576YfYy7rBJL/DU+ACwifEtAeN5G5
         f35KjHtXGYSf6UIaMsn/D2OeF+6eTRUEPdvqs0d1ZeasyvHfj0wF3jMcVAF9TElAOgKQ
         ejQzNJFiD7LqPaMDGKL6k5uxW+AfHtXSqYgI1dxg2vNFPep6LHbezM4rFBVSfwoI7Dpo
         nSpgbyJGigBBkdzreBVMkNfcKzy9ZvVtkX8MBCgFjxARIIUb5XXIRbO4aoGSpqSF5pY1
         TP/A==
X-Gm-Message-State: AOJu0YxCTGV5hUpZdHMd59GOrGEIc4qZIB6MHVujyN+N3Lk4tcRNWNMM
	xKCS5J0sE7JfwqiniKL9Ia3MVKoHUoJVG7+xR64M1g==
X-Google-Smtp-Source: AGHT+IEMgv5dtBgdlt910cOgip0Q3cABT/dTosRxWbh0cEThvcDhjE5KB0u9YKD1XnkQINK0tF8fkvezrCfMtjw8uxA=
X-Received: by 2002:a05:6402:40cf:b0:531:14c4:ae30 with SMTP id
 z15-20020a05640240cf00b0053114c4ae30mr6781828edb.0.1696109010653; Sat, 30 Sep
 2023 14:23:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
 <20230929-ad2s1210-mainline-v3-14-fa4364281745@baylibre.com>
 <CAMknhBGFBwQQouhsPMgCuMn6+eQfDCcSzJvF-DwJAnoEPvMLAA@mail.gmail.com> <20230930160047.0c5a5388@jic23-huawei>
In-Reply-To: <20230930160047.0c5a5388@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 30 Sep 2023 16:23:19 -0500
Message-ID: <CAMknhBHdcLNxX8mzTyjSBeoDdXjyT_8LebtzCthBPHeFwYyjsA@mail.gmail.com>
Subject: Re: [PATCH v3 14/27] staging: iio: resolver: ad2s1210: implement
 hysteresis as channel attr
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

On Sat, Sep 30, 2023 at 10:00=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Fri, 29 Sep 2023 12:53:00 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > On Fri, Sep 29, 2023 at 12:25=E2=80=AFPM David Lechner <dlechner@baylib=
re.com> wrote:
> > >
> > > The AD2S1210 resolver has a hysteresis feature that can be used to
> > > prevent flicker in the LSB of the position register. This can be eith=
er
> > > enabled or disabled. Disabling hysteresis is useful for increasing
> > > precision by oversampling.
> > >
> > > Signed-off-by: David Lechner <dlechner@baylibre.com>
> > > ---
> >
> > ...
> >
> > > +static int ad2s1210_read_avail(struct iio_dev *indio_dev,
> > > +                              struct iio_chan_spec const *chan,
> > > +                              const int **vals, int *type,
> > > +                              int *length, long mask)
> > > +{
> > > +       static const int hysteresis_available[] =3D { 0, 1 };
> >
> > This is basically an enable/disable. Should the 1 value be changed to t=
he
> > appropriate radians value since this is hysteresis on the position
> > (angle) channel?
>
> Good point. However it should be in the _raw units. The text is
> slightly more explicit on this for
> the variant of hysteresis applied to threshold events as it's
> added or substracted from a threshold (and thresholds are in
> _raw readings unless only _processed is available).
>
> Does that make 0, 1 correct as we are talking about LSB only?
>

It is currently only correct (as a raw value) if the selected
resolution is 16-bit. So I will need to fix this so the value is `1 <<
(16 - resolution)`.
