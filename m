Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188690;
	b=VCYsChRznhwJkgHenrx7Dwl1Bfet90VEOy5/oPmayk7sOs/TXDoUpeqx7CUdQuKIizJ9
	 vkYZsVxxzE4Mlgq4kVlaaosWHKdTTrGAIUlF8lJmmIy7P1ayhrVsR4K3WZY+eUplDvHPT
	 N9KNQ0rkAzUCKw26fbgueZI5fj5wc6uQX15OyZxHc3XFR6SGNIsQzW6u4SUaMBX2BD0v+
	 lHYOkMJfQI97JKhtTZDpUZGtk4pOqvbMKs+bgEWSvUSL8zaA23NLezrh4TyFmvzTgzhLE
	 jZxK7VnPVdtoK8sun2GQjbB0ChBJbPIpi9oC31vMtwg9nPS0NuJpIQlcwtL8PSHCCng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
	b=fIZigPZ9jyGUvTw48TR33sJJCqqP+F6OvZq9s/Y1kuljP/xlAyVMfBRPfi9cunTRhYEj
	 /PAFPyb/NUjYx9pkoZorVSSIozPdSLnWCHVn2n6Bf1IYDo8OabWux3qN4YXisYggtVDXa
	 ver5Y1csIAsfggWKOw1niG3f/vm295KXFI1Xyq7PzZQ17FX1QZAMZL+EHpkHW2WCmBp00
	 ixfimy7/RSmKvSMODHED7HAMTiJV25TUINi9N/DIS/5PnCBroVexVBJ7z+czZOf7/Txkx
	 nWSBLazT6oU73bA7nLfDrr9kyr7tuRCrMkAVuccuQ/chmwiZb+FDJLwLPtdnlzBJPBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zbb3utd1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99617606A32A
	for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 15:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99617606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zbb3utd1
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3863db981d4so727802eec.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 07:31:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188689; cv=none;
        d=google.com; s=arc-20260327;
        b=XJn8CpdZF9ZC2GVB88vSWhWN2TDTGarjkuzgVk+q8SWG5IRauYLwhwY7wTG8jyhWTn
         06fZkHbW4EcsJvFGXb3/ATNeQZCs1AAFEIuY6e1wkBX9GTHZVOkMhVBxCfXp8Xx37N7d
         NwOCMOWO1Cs3VhEI2d6S7SFxT6ym3muF3eFH2rE8yRp57hX9j89y/Vew4FVoDyZIg/VT
         3/Tzoq0eCNC8mdwhsUnYVphWUXHMuG1Pg/LmTLgmGoXRLgfno+fLFQgmiU++uSLApz5g
         S1eRgQZWYibd/6Karox7GRZixmyLP6MrTjs/AOOcIyoZB4+sGgXCpw6mtybVM6kFDr4w
         OEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        fh=Ipj8CBYjp0RX4XDwbHj1mpIkDKNz1xlSDBnAZ/ZZDVc=;
        b=fWweXj5Z90dpZFQf5fjav7PLyBY5R7M9WvJA7IqOJ1zDxraHwdKdNd2xbxx8HFcCR6
         j9/m8ida/I9fG4qQxWw82vevvnFIxdxp7A+LSgBrD5etvmKEm10uGFEg6UZB6UZT3IOR
         vx4iyGI1s3LXgyxt830LtlkPyaHJaa0fnOAy2nk3qn1l9AXR8RdHMGm8Bso3PzRk5MNO
         UKNRNyQBswkiCrniNpwGoRjSpNsDGLJxIv1j0NLlr6zpbMAIYRLbv4Wl36PUfdMeHb2i
         q1Xi2HFV3m1nh0rqi0YcmMU27adUrWKzwqf7NiUz23aFoCuqKMC3JF9KH5WX/YUH7miG
         Ql6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188689; x=1795793489; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        b=zbb3utd1c63n793XMkM0822NT2wP7b3F2HCJ6nEEeEe59HJqaUTMuxqSrn3NNlgEq7
         ZZEDso7WvO2fAJOu/P7rC5irqathurlYbtNlvBcrUiAipSqQq+qhEjXlx9LFJ5VkCGQc
         6OOPFpatuxz9r8EacLHKLLEwu1sbs5XChQGWywVJVjbipFkQFWr5dn9Euy8idTeirHAb
         8rP8muFADF3+S5Prf6tCmkrIUVUdgKmAgSpN3c2hoeuYRInwYx6lkULC7czmZ/R7/S37
         AHT3cmcRiMaRM+3uMJvIEPJ9vvVIcOE40CPRsZSV2c9hwy1vfQe+2x0jTSEhfCODyXCY
         dDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188689; x=1795793489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        b=UnxGQsxUffQcdIGNEXcnq92VWyq552IX3Ayq1UMq7slmDD4ZRSiiLYWhbEnPtSxS53
         2IlXQBEkgAlTYICZ19sbtSBcK2t9NapqrUPg5yl/glxl+YtSmnuFfKX9w3xY5Z5FBBtf
         QypucgAFvcKdtdfvZNKJw96z7qICb9jjqcjvsoj8dijolHLBitTEeNkK+qxr5aqR8Qc0
         Tf7DiPySZ4lpMFQef6PV8gmxmUQXZgZart2fyilrdz2GSXVxt+yh1uCfrwp3+yh57e+o
         OJdkty6c7xwYhxF/1omEOv6EPl/8gure526infZ+HlJWSSEpByWiu0XmBDDKPqZ+Qwjk
         M7lw==
X-Forwarded-Encrypted: i=1; AL+hErFba8gfbPDWzfeNr5P0hc9e6Mu67RjKzP5zIfbWz1XJG4LnAiCKXdnge4ZIyGZNjBd20jNdIDCOfgJUs1wU@lists.linux.dev
X-Gm-Message-State: APuU4Z+bkMv16SCxGYAUaeANDDsEONQAfZRaeZBiviRMT/bk2ZbXSvbD
	uZKfR6YJ/meTOWK3OBXZF8o8kKDjBa6dAjAYQ607nnYw/nzEotFSYXaJOQTwvtHmerxAcfQpvYg
	2UCH8zBuTmKsnqvOUHizyjtseWUJInDg=
X-Gm-Gg: AZFdTZdMtQ05Php7hrOiH6/GcTUSzW3Kvyb3Akm57Tza7WpoA1YvFsOMLs4DVHBoo2d
	mykDeCz5z0il63nZJkRwAm9mrW+3icFy8DSn+GAmFgNOcAZ9WFODdSvaw80y2t/U2Mibr8/bKnO
	l5LVe2+W4TYDZ9whm0hhKimrKuNBUKR///6Uu1HiHzhLKvI1nAtzvoTSYXArOPS8KB/YO11RBGv
	td65H6l7+uTHhZS4s82F7AFIheglZ46aawnCvVL4kBNlioxObZNLBU5Jhb7sk9LK1/kI7oLVG/8
	3GIMzUodHxJoh3/4cCAu5WJ6KE9JqZ3u59JUFiBcBGsreCLwslyP4jl9pLWDAj27DGpLnQdvDNp
	kQhHJTbgLB30HZaGXRWwtLI+kpeuOtGwPGQUDw9y2Lgv5m5TcVwenjYQbzVJvr8k0I65bGMsdaC
	szzE4Yo8q3Yqgp/977q2AEHRDuiBtc9sdg+zo5HAY1qK31yEqdSIg=
X-Received: by 2002:a05:7301:6408:b0:383:1bfc:f1c0 with SMTP id
 5a478bee46e88-38570f27a56mr3129077eec.32.1795188688670; Fri, 20 Nov 2026
 07:31:28 -0800 (PST)
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
 <20261120143147.GA2466366@killaraus.ideasonboard.com>
In-Reply-To: <20261120143147.GA2466366@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 20 Nov 2026 17:31:17 +0200
X-Gm-Features: Aa3M54rmNUuNZyda5qhpJslp9i1jTMK9Hg275DVhPVt4wZMMMc9yhIUe9r0PTkY
Message-ID: <CAPVz0n3u3oe1+H_w9jE2afb9PQT0VLtYVqfHeVNc3D+tLN6NDQ@mail.gmail.com>
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

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> > The Tegra Video Input drivers are mature and developed enough to be mov=
ed
> > from staging into the media subsystem. No other changes are introduced.
>
> The driver should at least be converted to be MC-centric before being
> moved out of staging. I haven't checked if other changes would also be
> needed.
>

Does the media subsystem deny video-centric devices from even being
moved into it? I have not seen this restriction imposed; could you
please point me to where this is stated in the media subsystem
documentation?

I would like to convert this device, but that may take quite some time
and may case regressions if not done carefully. This patchset apart
from moving to media is mostly fixes to work correctly with mt9m114
and tegra114 bring-up which is quite simple and straight forward
change.

BTW, may you ack mt9m114 get_fwnode_pad change[1]. I have updated it
to your liking, Sakari seems to ignore it.

[1] - https://lore.kernel.org/lkml/20261006153619.304520-1-clamor95@gmail.c=
om/

> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/platform/nvidia/Kconfig                           | 2 ++
> >  drivers/media/platform/nvidia/Makefile                          | 1 +
> >  .../media =3D> media/platform/nvidia}/tegra-video/Kconfig         | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/Makefile        | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/TODO   | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.c  | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.h  | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/tegra20.c       | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/tegra210.c      | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.c   | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.h   | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/video.c         | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/video.h         | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.c  | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.h  | 0
> >  drivers/staging/media/Kconfig                                   | 2 --
> >  drivers/staging/media/Makefile                                  | 1 -
> >  17 files changed, 3 insertions(+), 3 deletions(-)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
Kconfig (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
Makefile (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
TODO (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
csi.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
csi.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
tegra20.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
tegra210.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vi.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vi.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
video.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
video.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vip.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vip.h (100%)
>
> --
> Regards,
>
> Laurent Pinchart
