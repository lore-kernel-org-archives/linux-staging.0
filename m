Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795241025;
	b=rcSt+JOu+G0nXbX6apQBjpF8Orw095qzA1WzSUQf3DzCp9BCzbSyLhkDYf9vb33tbcdL
	 yNVhQZTVnUhZoCA2MEbIgx5SkUU1smZ7RKF8Z6ihHs3cWmp3EMle+IE1qyFCB5munQn3/
	 snMdl516i3se4TLSV+ah/kci9sy5ND4v9UwPMqYQsU9CcTasqv5pE2/mDL4nwCtpze5Kk
	 IzzVGx8+9DDGfyyHunSkcfFp4kG5Epilq4YoCugluZ+ywjgwXiVgyoiCljrfHCqce070J
	 eeuiWjHOSsQ0W+arvfphQDrnmmSuTwt4z+halij5eZ967fG4kb2aApEYsdv6NNGzqLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795241025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
	b=pUWPUx+eAmYaSsuJorz04W9l4zuWXHT1m9g6oeJ3irIHZ5K15PLx5c5QqF2kbmV+34Ry
	 f999PpD504ZK948+yqeg0+hB/pJD+eC6m1GRuzSypTZjfeGRjcz5WlgV6qxovbjFKhI10
	 6oPRAf/wj71OKAKw0MHSO3G1wU/tvIqLKT8OeyoOEQJNuAXJS01rz1dmST7/mxuGwQ5jd
	 ZVeIG2c/YJ4/SaHK2vBgXXiVZFxDYrgNWG1YdPbmaQE8mhkXW0m2sHQovnm28Ri+vL+9U
	 w4CqOHxaqNZwmt1FqJbBHWI4Bc20dznpflJnm8bQoYTagnsA2BS36cjvnB3WrM1GzEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e0WfiNJo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8136C606A33E
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 06:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8136C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e0WfiNJo
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a315ed211so1848860eec.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 22:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795241024; cv=none;
        d=google.com; s=arc-20260327;
        b=okQ3fwzpgxTMgseqzK3TTvQo9MpWivzzXlwWbDCVezZgB+AHSKjVt//0/7x/d3i3VR
         JIuPU1vWqi4JFMSdqkhiq9XY0Bw5GGsmLaqipAHI5N75ZjB5HPQmq+6PjzfRnk3GmtmU
         KwfNlorWgtN6qqWNaR1rb1ulfYNhuhkEqTheGpDSYNiMXvEivd25sR4cTKs3DECqBCz9
         PnlGv8zYxB2pf9XbEJPRmvemQDRQ+Su2gWsM3V86FAJNaOlMP9isS2DPhXcOGLJEvA/G
         th3+CYbBTlMaoCzURkMUz99Bj10XsdcP/exjJn0tKu9vjycsDnKcGlKh6sB5NQ67c9XQ
         FdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        fh=BlMUcIUePbk9ilg0xMWabp/YpgNWz9YGuiT9vP7Rq/4=;
        b=Exg3cX0uG/23fwVObyloFXz6f9JyB8HCxhip4Q7csvyJwzawsKbkWF3mQO2fbOodXf
         eBJwCqNKKKo2TV0W7oa9gWq/Ae/DThtZXZh146KnmbtITWI1ayTJvXrTyAJbPuBqvDi1
         uvmi7ulyCOfd4Ixx60C937PNYUl3pgJgLT7L3l6qn9KVSkGEDcxzBo/Z6xFOjBtAsRaz
         7SQgDVuNLoJUSbeiA8Csg87byNymTwyus4C/qDB+nGGwr9ciJXk0AzpSBkUCgWcZyIW0
         0Up9YY1LT4WonzuA3vINMrvbEthUIs7LA6jK191H2BhsLwSf0XUn5x++NUNbKbMfIIRK
         CExQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795241024; x=1795845824; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        b=e0WfiNJoyrkdutTUIVBqzy/WEphZGkri1BqvTAEVtbLVAgHnByKbQGiY9PrG2lFhXP
         EpsPoXjypxuZb9IS/9HmR1RT4O9qGdWhA6f5RDmHMWqcqctQs33+5+vEwDnEnc3OZbLt
         kMM1x0e5UNBJZoRkTwAID9BNBx7LGJzL/K8ZZw0JZIjGNTc50fam+PudR6RGThQLlxdh
         KN0jWCR0nptDghXSv87Ie8Evbh3eCgyvDgwN6ZgbEYwCJp3fXnBikPkvxcLYImzgrtqb
         Yi+sB7NHqFPDqqdy1TdngcvmxIwsQSXItOxD/QR7VB4r8TMu3pFqDWhtDlHkFmx0M5/u
         bTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795241024; x=1795845824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkIcDSC/bFxcu22I88GO2krkZZKs2yf41B/Zw2+/nk0=;
        b=UBzxqmv6U43Kb6Y7YErgzDUNw2FJB0Hk+6o9h+kOuqdHCZtasUIn5nXDRyuaBMl3rt
         6ezgXAFqXiGaghk6jOL9Dmax/KIvdb0ntGoW85/Ut4SgNf5cpy1LmaJrNJsrcTcZeJ8t
         GGULRnxQHj0tBK//robnCDN/ef1MZazzAVa/8gB0ZSESWtGgFXvdIHH5igzpMkyNI5bO
         3/pvLtgQ978LDfkIQ4B2lPtdz5/1oY2E2syzaxt12QWYycvjRYY+Eq0JjYIO8rTG7LEj
         hA0ebGC2r+sgBDxfdA/bqHKbuCukgxby9F32XWEUMSSJtTrmepqdCc3PsCeBw7cU0dIp
         mNyg==
X-Forwarded-Encrypted: i=1; AL+hErEQcliDABTssOCKYpkrsuPRz/MVWcDLvhF4+aQqXEZ8M04jVTK8SBpUCkkjokv7QBB2Q5nmVq6kLcZkt9Op@lists.linux.dev
X-Gm-Message-State: APuU4Z9R+YoxVnUD2mBbJbkXs2jituCUnkpq+KHQkD3yTWTMtynEiNaY
	DTAgKYd6UDCyQBbtZ4BkPldnHCjUh/q8s4ua6aYipoWyciW0UfckZgntUSJaCXX7MxGt81jUyLy
	6BAsM1y2TYrkK0WHhGELEsElCo3c94ac=
X-Gm-Gg: AZFdTZdeaWMdvHY3HKTES5/EhzqsXLTL450XwSwLKUt3wIBrHdLrBajoB0v3bFGLM14
	2xci5WAjZeFeCMMlPEUd8yXTFdIDRvzEX2PfyrWuZ03pjWhl/BTr9gRvbXt9h4T2NWtyJ/CKvME
	o235mJsH7v8tc/9yhHDytJHoXzH2Gr1bwwdKU9ZuHKNavAAg+PwpzKBCiyYMUEEtqQyw3BviwGT
	GUTmcXYYFSVHTf19EW8D1cpBsQAYhKkD/7UCrCL6GeHm95drcCZ1oW2zPyjjuDTgINvvcq6C8/l
	VwllZs+VdEPq7q/kADZ5BFlJPME09X/HuscFeyToe8QM4QgviyEulEeA6ST2k4+aSgnnZY9Xx0b
	kpYQh05nVIIoKWsm4iONWHwQhpQUPmMcx7PLDy3cnMSW2l8r9BH+waLrzyqppM3cQzXSS+kLb3W
	EhbtHux01UFIMqO7AFD1RK8iadWnEKlw==
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id
 5a478bee46e88-3856c6b00fdmr6323139eec.2.1795241023623; Fri, 20 Nov 2026
 22:03:43 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113161819.36847-1-clamor95@gmail.com> <20261113161819.36847-2-clamor95@gmail.com>
 <20261120143147.GA2466366@killaraus.ideasonboard.com> <CAPVz0n3u3oe1+H_w9jE2afb9PQT0VLtYVqfHeVNc3D+tLN6NDQ@mail.gmail.com>
 <20261120213116.GB2472094@killaraus.ideasonboard.com>
In-Reply-To: <20261120213116.GB2472094@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 21 Nov 2026 08:03:31 +0200
X-Gm-Features: Aa3M54qOnB5G9GXqLIL-lPBYx8eezPpq659tGJ_BSKM-GqCEY4niHx2BKUlkMTw
Message-ID: <CAPVz0n0h6xd4DbnpNTW63agospeJFqoV8vnkPYdzB3NmgVRM5Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] staging: media: tegra-video: Move driver to media/platform/nvidia
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Cong Nguyen <congnt264@gmail.com>, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	Hungyu Lin <dennylin0707@gmail.com>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Yury Norov <ynorov@nvidia.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 20, 2026 at 05:31:17PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
16:31 Laurent Pinchart =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> > > > The Tegra Video Input drivers are mature and developed enough to be=
 moved
> > > > from staging into the media subsystem. No other changes are introdu=
ced.
> > >
> > > The driver should at least be converted to be MC-centric before being
> > > moved out of staging. I haven't checked if other changes would also b=
e
> > > needed.
> >
> > Does the media subsystem deny video-centric devices from even being
> > moved into it? I have not seen this restriction imposed; could you
> > please point me to where this is stated in the media subsystem
> > documentation?
>
> There's a consensus that devices that require control of camera sensors
> (i.e. "MIPI" cameras) must be MC-centric. That's not documented, we
> should probably fix that.
>

Yeah, stating this in documentation would simplify things.

> > I would like to convert this device, but that may take quite some time
> > and may case regressions if not done carefully. This patchset apart
> > from moving to media is mostly fixes to work correctly with mt9m114
> > and tegra114 bring-up which is quite simple and straight forward
> > change.
>
> Converting to the MC API will require some changes in userspace. That's
> why it's important to make this change before destaging the driver.
>

Noted, I will most likely drop destaging for now then.

> > BTW, may you ack mt9m114 get_fwnode_pad change[1]. I have updated it
> > to your liking, Sakari seems to ignore it.
> >
> > [1] - https://lore.kernel.org/lkml/20261006153619.304520-1-clamor95@gma=
il.com/
>
> In the review of v1, I wrote in my last message
> (https://lore.kernel.org/linux-media/20260721103845.GJ50424@killaraus.ide=
asonboard.com/)
> that the issue seems to come from a bug in the VI driver. Let's continue
> the discussion there.
>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/media/platform/nvidia/Kconfig                           | =
2 ++
> > > >  drivers/media/platform/nvidia/Makefile                          | =
1 +
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/Kconfig         =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/Makefile        =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/TODO   =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.c  =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.h  =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/tegra20.c       =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/tegra210.c      =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.c   =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.h   =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/video.c         =
| 0
> > > >  .../media =3D> media/platform/nvidia}/tegra-video/video.h         =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.c  =
| 0
> > > >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.h  =
| 0
> > > >  drivers/staging/media/Kconfig                                   | =
2 --
> > > >  drivers/staging/media/Makefile                                  | =
1 -
> > > >  17 files changed, 3 insertions(+), 3 deletions(-)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/Kconfig (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/Makefile (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/TODO (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/csi.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/csi.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/tegra20.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/tegra210.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vi.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vi.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/video.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/video.h (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vip.c (100%)
> > > >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-vi=
deo/vip.h (100%)
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
>
> --
> Regards,
>
> Laurent Pinchart
