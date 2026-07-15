Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1F537205D
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 14:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125501; cv=none; b=Kh1/k/ig63IFK2nHwmyZibg1qQTjHbFwn2rVOMYdh2pav7s2yLpzfzp+5xbJCHqWbZf0zpb6/zrSMAAI7lvHN5d/K8lkGcrD+6hokzSZ5b41WPCeIMjrZMimHOcjv/1xjj/5RNsMdTjYcLjDyqmZq6MR9Yo/Lnd+3ZWGGZSUj7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125501; c=relaxed/simple;
	bh=rwPDXsTip2O50qVw7MVaMEE2q0Alcc9GaVCCh+wa6Ys=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mA28QnadOTjLt/7iIxCOTFvtg9+4x1Vk1RcJpAb6DHfFdHqbOu4amh/piJwaiZeUw9C85+C+HVqC689MFBXJ2S0Hlln16AFu1jauy/rISx9RQHs/xa/WuJqbJERi/1zZDTLS3HC1YISh28QuuTyobyETBEf26Pg6BnqXFPbWwhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ke1JTIuC; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ke1JTIuC"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c74722e27so22590811fa.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 07:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784125496; x=1784730296; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ACfTUsYc5cSIDcygJYvmfOEuoTU9YLmEZsn/dlKjqbk=;
        b=Ke1JTIuCrj0muYsf5PezhRn5S/JUo/dQwd9FHJ1UIybe2DAdGyfT+fSl+XO3et4XvF
         cyvF5xw2J3Etx9alVbn4umJIBq1ZLeLDVaQJqYF812eDhicwJVfSZnuc9f8GJWQqqY0j
         533s/ope6xvWvyE6ubrLTkunrAVRe+ff+iC/MVSqOs1nivCH8XCgP2QboDiUu66z5Dw7
         ByClC45fnOifh+QR3AbnNYj/PY3Ep+xoHY3KvCzRQ8/4vV/uQTzxQ04+467inUoZZJAF
         aLp25cSgnctxLXowyKvJgvER2ByzsRJnxZUpxiGYwmgfL0L+wDDOenzE5HHKCfWfmIVN
         ChrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784125496; x=1784730296;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACfTUsYc5cSIDcygJYvmfOEuoTU9YLmEZsn/dlKjqbk=;
        b=mWmFvbp7UZG7APlIhmpK79+/uTcFjWbltOgxa76H3bWaKJxnb+RRFA3vtfNCWjfxi3
         Ht/KFSwC7rAWKSUyEJ7D7ow4VPQ5Gsmr5TN1hKifrMq0UkO8LQ3ikPkurHDRnSdBD368
         x039ce0xKr09SVCcZdXehmffN97nVkaPXD3jfg/xENFMllZKwzGk2qBKASIPZPqbkAs4
         zOqqWENPNFDOZS1vNVVd1COk4ysteObFZ4GiHyMzHUfGao3GZUpzPWlwBT+NeNzVDRu6
         nCboXqAxXY2fAdQWB0bPamkR1HAj3Fp684y1LHOv6k9psRJbW657GLj4FTUW8l9qBSVY
         NXnA==
X-Forwarded-Encrypted: i=1; AHgh+RrxuTWlOOh7O8N3UsqzWGXrp+m61Z9FCV0T14cSafHztKmsJOzJBsPhUnPPrE8zsWlTw3hn/W5AZxVX3mlw@lists.linux.dev
X-Gm-Message-State: AOJu0YxAQ1UsFa+IZOjdm/7EInq6jdBU48447YZs1beaPX9KkK26DyId
	cA4PB3cuE+jJleGnx0YDMqf6GwpXH4Itg5+AROtybdnI4rSLWyg7v9dx
X-Gm-Gg: AfdE7clhWrL/MVDX2dFiII3YTwu7J9rklapyLls7oIjhOz4LUvqKzEAUV/3lr1ed9ps
	08nfMPogE09OKBIlCws2cA28jm7deMD6/2O9g6L02nEr72UhY/dnfBXpcKD3SZnR4JTomPnSOUc
	Ob8XghmdQwMw7bNW2Dm0L6jztY376jBJJfzl7OueKbs1Vh+CZBMCRNOKr8c7V5/row2Aq2ilid0
	Lpx1/w1YcJpXqUr6Rkw7+JfuXdcMCbHUiCaLCASbagj8DdxnGt1YpYvJ/w6vhBj3xCtXOaxSqYL
	WolFL2NFh9axPX8p0NZzpIPrsX8KA8AG1RyIV0aNoBHKQAkDXqPOcTOXKA3r+58wRkq6fM5trU7
	hMpqOfR91w8E6kVE8B+tl5neszBX9zm83TpPa5ETZLZ0Ay+JQQGVn2JF2whpfZKrCIkBFrB45Ne
	EFz+y6CZ5+QQ5/Dm++qZLRQXZQKTmmUitwoyy3yq/Xa+hp6KEUNsCI
X-Received: by 2002:a05:651c:b28:b0:39a:fef1:ad7 with SMTP id 38308e7fff4ca-39c94cde536mr48470341fa.21.1784125496005;
        Wed, 15 Jul 2026 07:24:56 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180f3sm36977811fa.4.2026.07.15.07.24.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2026 07:24:55 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race
 conditions, and stability bugs
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
Date: Wed, 15 Jul 2026 18:24:39 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DRM DRIVERS FOR AMLOGIC SOCS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Doruk Tan Ozturk <doruk@0sec.ai>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8DCA30D7-46DA-41A3-BB05-4C841D20BC0F@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
 <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)

> On 14 Jul 2026, at 11:23=E2=80=AFam, Anand Moon =
<linux.amoon@gmail.com> wrote:
>=20
> Hi All,
>=20
> On Mon, 13 Jul 2026 at 17:38, Anand Moon <linux.amoon@gmail.com> =
wrote:
>>=20
>> This patch series addresses a collection of critical race conditions,
>> memory leaks, use-after-free bugs, and resource management issues
>> within the Amlogic Meson video decoder (meson-vdec) driver and
>> associated components.
>>=20
>> The primary focus is tightening session lifecycles, safely =
synchronising
>> the V4L2 m2m framework callbacks, hardening work queue operations
>> (esparser_queue_work), and correcting buffer validations to prevent
>> stability issues like KASAN out-of-bounds errors or stream-on =
timeouts.
>>=20
>> Summary of Changes:
>> * Race Conditions & Synchronisation: Fixes multi-threading and
>>  execution races across stream-on, stream-off, job abort, and
>>  teardown pathways.
>> * Memory Lifecycle: Eliminates memory leaks and use-after-free
>>  vulnerabilities by safely pinning, canceling, and sequencing
>>  device removals.
>> * VP9 & Buffer Hardening: Addresses payload handling bugs in the ES
>>  parser, properly tracks ongoing buffers via atomic counters, and
>>  prevents invalid memory writes.
>> * Platform/DMA Adjustments: Adjusts DMA segment configurations,
>>  canvas handling, and buffer sizes to match modern hardware demands.
>>=20
>> Note on an outstanding issue:
>> An execution deadlock occurs in the driver workqueue path during high
>> stress or long playback sessions. This stall is triggered when the
>> Amlogic hardware internal video FIFO buffer becomes completely full.
>> When esparser_queue_all_src runs, the capacity validation check is
>> tripped due to a design limitation in how buffer exhaustion is =
handled.
>> This blocks progress and leaves the workqueue worker waiting =
indefinitely
>> on a core mutex lock.
>>=20
>> The resulting hung task call trace shows the worker thread blocking
>> on the internal lock:
>>=20
>> Workqueue: events esparser_queue_all_src [meson_vdec]
>> ...
>> __mutex_lock
>> mutex_lock_nested
>> esparser_queue_all_src
>>=20
>> I have tried to address this issue, but the underlying deadlock =
persists
>> under extreme conditions.
>>=20
>> Any feedback on this new appock is welcome.
>>=20
>> Testing was done using v4l2-compliance and active decoding pipelines
>> on Meson platforms (like Hardkernel ODROID-N2+ and ODROID-C4) SBCs.
>>=20
>> The v4l2-compliance tests passed successfully via:
>> $ v4l2-compliance -s -v -d /dev/video0
>>=20
>> Pipelines were validated using the following GStreamer script.
>>=20
>> [1] =
https://gist.github.com/moonlinux/08295ba1f17ce7155550773f2d2cb6e5
>>=20
>> Previous changes:
>> v6: =
https://lore.kernel.org/all/20260530094326.11892-2-linux.amoon@gmail.com/
>>=20
>=20
> I will review Sashiko's feedback. I will look into these suggestions =
and
> work on incorporating them to improve the code quality

Hello Anand,

I=E2=80=99ve picked this entire series into a LibreELEC image using Kodi =
22 and
ffmpeg 8.1 (using the RPi source that improves v4l2_m2m behaviour) on a
7.2-rc3 kernel and run some tests on a GXBB/S905 board.

Without this series H264 plays and seeks well and the unmerged H265 =
codec
also plays well and seeks well but with minor artefacts (something that =
I
need to look into). The experience is not perfect (this driver has a few
flaws) but it=E2=80=99s consistent with the =E2=80=98usable=E2=80=99 =
behaviour of the driver in
the last 1-2 years.

With this series H264 plays but seek seems to hang everything with no =
logged
errors anywhere. H265 results in a black screen and again everything=E2=80=
=99s hung.

It=E2=80=99s possible that kernel changes need to be balanced with =
userspace? Can
you please share details of how you have been testing things (and on =
what
hardware)? - I will attempt to replicate and poke smaller portions of =
the
series to see if I can isolate which bits are problematic to the =
otherwise
usable current experience.

Christian



