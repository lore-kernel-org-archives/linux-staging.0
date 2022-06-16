Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610706AA6;
	Thu, 16 Jun 2022 21:46:57 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id v1so5145711ejg.13;
        Thu, 16 Jun 2022 14:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XSQFRDEgINvllunQauaH/Y1t743uBR9C06AXn0bzorc=;
        b=nmc/dM5JUlhcEft9FPy/eplFzUsCkuLjPVZaNRiDmWURygEBDqb0aXTLxiv9NR+RSo
         ZT1QPR0WVGWlMe5AThCzwv/NynIvNYlQzsIjYKs9ml+iB3JQSu6xEoHifjwyT3hJ07js
         OxM4WkhcfSJHbezMWWroMUjz92O5vIRIAxKPUYex+I/E0xEKtJpmpFlVJVj4Z1OsEHMS
         2IYOUam0bpzAG0EPYHGp5HtuhIH4CyR+zYiKTEsA6wr4zM+7YWkDA9BvpOAfapuZB485
         /CBHJnIkd9qvW5E0zjlxy4icjxzSoVjJwcZOneM61V9z2taSFVhfCa5NHSG40UN0bRT/
         77mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XSQFRDEgINvllunQauaH/Y1t743uBR9C06AXn0bzorc=;
        b=RkS+iTQ6Zf2/UeKRu+8IZN5V2VcyL1T2iEJajh9SInwxPdTygXLnQpzjcV9/W6VE92
         CLm8FJZKhc6rsLjFB6yCKrfTxD8yfScpdeSjemg5ljZbJ8e5QC4jRKvYfQp2jUnU7Yij
         ZjQBY5EZhI4nIsGpcEv+SuBm7HlML2ZAkyItWCnP4HWcweUVLfShi8DFvzADw9ShMSmD
         rWu/SH4MtWoKsp8TVtM9DgW2eAJfv5nm6Ix+fSNueGU0WuRl1CW2xNo7oWDN0knmN0i6
         x8nn6FvuhP9xPKfR75UPxSeqHnGzIvcqNGOgqyLcRQiB9Sdibjeb+9Lx38Hg3foGVnTC
         tiuQ==
X-Gm-Message-State: AJIora/g87rbngNaJDYinGdzADy6OtVJ81knTX18wYx0WL0XuPgoA0Np
	kcyTBxMDuAUblXweLj/jtrc=
X-Google-Smtp-Source: AGRyM1s//zJocBYAERflvIMVweP8k36M2aFY3OToGe+LovnfFlApOLb64M0/TXuacgm6plsL0Roi4g==
X-Received: by 2002:a17:906:4a13:b0:715:85cc:9224 with SMTP id w19-20020a1709064a1300b0071585cc9224mr6372285eju.267.1655416015665;
        Thu, 16 Jun 2022 14:46:55 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id g8-20020a170906538800b006ff05d4726esm1262372ejo.50.2022.06.16.14.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 14:46:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, paul.kocialkowski@bootlin.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: mchehab@kernel.org, wens@csie.org, samuel@sholland.org, benjamin.gaignard@collabora.com, nicolas.dufresne@collabora.com, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] media: cedrus: fix HEVC decoding
Date: Thu, 16 Jun 2022 23:46:52 +0200
Message-ID: <3178102.44csPzL39Z@jernej-laptop>
In-Reply-To: <39a83a7e-caaf-1dac-1072-72cd2f5d8bf5@xs4all.nl>
References: <20220615204436.137377-1-jernej.skrabec@gmail.com> <39a83a7e-caaf-1dac-1072-72cd2f5d8bf5@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 16. junij 2022 ob 09:14:05 CEST je Hans Verkuil napisal(a=
):
> On 6/15/22 22:44, Jernej Skrabec wrote:
> > After detailed comparison of register names to vendor library I noticed
> > that one register has completely different name. After some testing I
> > discovered that it was misnamed and used incorrectly. This patch series
> > fixes it. With that, 3 more reference bitstreams are now correctly
> > decoded. It is also possible that this fixes instability issue I had
> > after decoding such bitstreams. Running Fluster test suite very often
> > locked up my board, but after applying this fix, I never experienced it
> > again. It might still be completely coincidental, but I doubt this is
> > the case.
> >=20
> > Note: Patch 2 clashes with HEVC uAPI destaging. In current form, it can
> > be easily backported. However, there are few users of Cedrus HEVC and
> > skipping this fix wouldn't be that bad.
> >=20
> > Please let me know which way to go:
> > 1) wait for destaging, send rebased v2 and not care about backporting
>=20
> Let's go with 1. There is not much point in backporting since destaging
> the HEVC API will also change it, so userspace will need to adapt. It's
> a staging driver anyway (although hopefully not for long).
>=20
> If you post a v2 on top of the latest series from Benjamin, then that
> should almost certainly work fine when Benjamin posts what will hopefully
> be the final version of his series. When it is all OK, then I put both in
> the same PR.

I actually have several patches for Cedrus HEVC which I plan to send soon.=
=20
They would apply on top of series from Benjamin and would implement all=20
missing decoding features, except maybe 10-bit support. I'll include these =
two=20
patches in that series.

Best regards,
Jernej

>=20
> Regards,
>=20
> 	Hans
>=20
> > 2) merge before destaging, but v9 of HEVC uAPI destaging would need to
> >=20
> >    be rebased.
> >=20
> > 3) something else?
> >=20
> > Best regards,
> > Jernej
> >=20
> > Jernej Skrabec (2):
> >   media: cedrus: h265: Fix flag name
> >   media: cedrus: h265: Fix logic for not low delay flag
> > =20
> >  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 29 ++++++++++++++++++-
> >  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  3 +-
> >  2 files changed, 29 insertions(+), 3 deletions(-)




