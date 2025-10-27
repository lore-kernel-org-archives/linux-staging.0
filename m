Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D663C314D3D
	for <linux-staging@lists.linux.dev>; Mon, 27 Oct 2025 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761582747; cv=none; b=ZxItN/84Y9JkT9pT90el+6TaMA2+gAh/bVbCd4RRVR+p64i2QTSn3TdW/WXvFQTP11+lhml5L+487ElQf6Sm5USuImbLb8jhWYqduByW2UIsu3cVBYguhARLSj/zld2l87FuN8Zsd8pAVfFQwLxU/gJAvVLnbeJHchoVHqxhn0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761582747; c=relaxed/simple;
	bh=YHmmpySQqjP83Ou3NaqWaXxraBHJUZ+AF544Z54Pr3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOCh2jlFHSh9ZJn0/oZ2Uo4ItpYYVd3H+FxP374/z/xpm/omqBDIlQ1O0rDc6UoyUNcvFq9BnFjFLCM3dxwNQrA11dfiModePIWDLfKZL5A75g6XrExlrv0ylEdD6BcD3nQNjJxTUN56YqxNDQ8Ll6qYx5+75Tupc6Sxuz6fSXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktqTSouu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktqTSouu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so29536855e9.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Oct 2025 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761582743; x=1762187543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF5KpKL469fVTXgAkVCiESe8ar89l86aILwHhnCjqVw=;
        b=ktqTSouu+i0iG7tyNWSFb9n11Bs3MzSVYZGzgOAUv3QLXVvSGyZicvR/sN+vsUL+1S
         1e5zmvTpeJerf6JiD1fjKy+qt/MW8CV2MotdbIS9LrFVmeDBQEqR9ey3WktoFqSEWZPm
         3ecO4UAO5u0A1H5O6+7o1ZOHdDJRRXPHUd1N3hD2a8+DwQeljfggo5BU/hXp7azv5eFE
         EmBMnY1D3IXgNQxBIn0PJT5jq5UhqhuDQUK3DI5Y/e2srmhp/HAdlYtWCUnQsJ+71FFP
         CmSHgh9DrcVhKmGvw5R8aeQgduOyhMR1gmY8PTzZHOoCOvTeCgArdfZPJJMELdA5Q8Qe
         wGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761582743; x=1762187543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PF5KpKL469fVTXgAkVCiESe8ar89l86aILwHhnCjqVw=;
        b=QorHJF1VjxkHyWWolozpibfG2Ds0vigp5auEAAboizBY1Qna3OkXo+LZ24PpTuQlGr
         2MLUL+UAQZf8HWSJX76V5xbNYxxQEN9WQ872kwaG6+Y4NdQwEo8dt/SMUspZ8vYqjaVJ
         96jIR1RXp5OO9y2sYl52uiw3rHE463U0TrQaDuXf56TdvjDdnAhHUCIRpAdfBg3GXoCO
         5h+F3ulKunTYqWYahQeJFOwJC+26AOFamFPThTwFTfVHM6qYLCB0yq6XokcugzgSGWHq
         7Wu5O58u6TZWoJaDRq5mQWmqL0/DSfksZLbZAjf4G0OmKHbGRftlz6OyVS+fXr5CzEoC
         7kQA==
X-Forwarded-Encrypted: i=1; AJvYcCXIQhzPyPoPS/sk7uWavZTpilAz5lNJbEq9o5ntzvaH/upUKs2K82SYUNuAPcBdrP7fyV4HpWiEqWfBWX4t@lists.linux.dev
X-Gm-Message-State: AOJu0YysV+QLCHNIjlErBh3D+bgQJjCFVdoed3U0j8cYtG5wec1aWN2z
	Zf1BDxmJS1ICBGPlwj0ghbY9Q8Ck/ezU8EpsObcBsCe7iDQRa7z4LOQEkpKS8hrXJcSj/m3rh9S
	GnOdfVYix4u/oIr76lN9646nCVrwSFOQ=
X-Gm-Gg: ASbGnct+YWX+ATaYzmNQUp1WC26vsleZzM077BLt+y7B1b/w6o8jdIQdyD10Got7+me
	eEFVTIlOrph7h+Znnm+65UJxFFnkrjxBzvQCXe2l8MuD7bXM/KbgpfW8NyEjJutjJmpsq8Q/uwt
	+i1MouIBNBCg9hMiznjfLNkeUE/ZV0WdGugHsH2ygzTvkGbjBH9Vy8mR+f0zlEMjExgvDHrcUaz
	B+dcJWDz0KaVtOhwIxmb7qYGRKxucVLbIm+dqFq0pgFAirHEg9LXQQ/90RsB3/LOSkcdVBM
X-Google-Smtp-Source: AGHT+IGnQKSD8LLMcix6lZzwNF5GRcP/d5ntwfmO8bYJcqFggKCrAfVq/BMs9d8iTrMYt/ReQHX0zgxmRp5XUkKSJ3s=
X-Received: by 2002:a5d:5f82:0:b0:426:d5de:e454 with SMTP id
 ffacd0b85a97d-429a7e84487mr290406f8f.31.1761582742690; Mon, 27 Oct 2025
 09:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251022142051.70400-1-clamor95@gmail.com> <7c5a1a6e-cad2-46c3-b5cd-3e92ca6d99a7@kernel.org>
 <CAPVz0n1aj8A5L50WcO-W4jSH2t6kfi6qXN-2FkmZxiAYJUN3vg@mail.gmail.com> <f1ac1e4a-09cf-4cbc-8555-87111ef5810a@kernel.org>
In-Reply-To: <f1ac1e4a-09cf-4cbc-8555-87111ef5810a@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Oct 2025 18:32:10 +0200
X-Gm-Features: AWmQ_blYaK_-CilYY_DzPCPq1WabsGLOdAlNNG0enxXFT4qytUlg4j6qbAg5jHY
Message-ID: <CAPVz0n1nZqhnDQfSHOK3uixJd_t1b04CrWzoTa3smXXD8g0mCg@mail.gmail.com>
Subject: Re: [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 18:3=
0 Hans Verkuil <hverkuil+cisco@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 27/10/2025 17:26, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE =
18:08 Hans Verkuil <hverkuil+cisco@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> Hi Svyatoslav,
> >>
> >> On 22/10/2025 16:20, Svyatoslav Ryhel wrote:
> >>> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC alon=
g
> >>> with a set of changes required for that.
> >>
> >> Other than patch 06/23 that looked iffy (although the original code wa=
s iffy as
> >> already), for which I posted a review, this series looks almost ready.
> >
> > 06/23 addresses issue I have encountered while testing with mt9m114 I
> > will add detailed explanation later in the 06/23 commit discussion.
> >
> >>
> >> Should the clk patches be merged together with the media patches? Or c=
an those
> >> go in via the clk subsystem? If it is the latter, then I'll need an Ac=
ked-by from the
> >> clk subsystem maintainer.
> >>
> >
> > I suppose this should be discussed between staging and clk subsystem
> > maintainers I am fine with any conclusion.
> >
> >> Regarding the bindings: all except 21/23 are Acked.
> >
> > Maybe you did not notice, but 21/23 has reviewed-by from Rob Herring.
>
> Ah yes, Rob replied. Good.
>
> >
> >>
> >> I have one question regarding testing: in the past I tested this drive=
r with a
> >> Jetson TX1 devkit and a camera sensor. One of the main reasons this dr=
iver is still
> >> in staging is that I never got that to work reliably: after 10-30 minu=
tes it would
> >> lose sync and streaming would stop.
> >>
> >> Unfortunately I never had the time to dig deeper into that.
> >>
> >> So have you tested this with a camera sensor? And if so, does it strea=
m reliably?
> >> I.e. just let it stream for 24 hours and see if that works.
> >>
> >> If it is reliable for you, then I think this driver should be moved to=
 drivers/media.
> >
> > Streaming works but I did not tested for such prolonged periods of
> > time. Scope of this patchset is bringing CSI support for
> > Tegra20/Tegra30, extended testing and move to media can be done in
> > followup.
>
> I'd really appreciate it if you can do a duration test. Perhaps start str=
eaming on
> Friday and let it run for the weekend?

With all do respect this will not happen any time soon.

> Regards,
>
>         Hans
>
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> ---
> >>> Changes in v2:
> >>> - vi_sensor gated through csus
> >>> - TEGRA30_CLK_CLK_MAX moved to clk-tegra30
> >>> - adjusted commit titles and messages
> >>> - clk_register_clkdev dropped from pad clock registration
> >>> - removed tegra30-vi/vip and used tegra20 fallback
> >>> - added separate csi schema for tegra20-csi and tegra30-csi
> >>> - fixet number of VI channels
> >>> - adjusted tegra_vi_out naming
> >>> - fixed yuv_input_format to main_input_format
> >>> - MIPI calibration refsctored for Tegra114+ and added support for
> >>>   pre-Tegra114 to use CSI as a MIPI calibration device
> >>> - switched ENOMEM to EBUSY
> >>> - added check into tegra_channel_get_remote_csi_subdev
> >>> - moved avdd-dsi-csi-supply into CSI
> >>> - next_fs_sp_idx > next_fs_sp_value
> >>> - removed host1x_syncpt_incr from framecounted syncpoint
> >>> - csi subdev request moved before frame cycle
> >>>
> >>> Changes in v3:
> >>> - tegra20 and tegra30 csi schema merged
> >>> - removed unneeded properties and requirements from schema
> >>> - improved vendor specific properties description
> >>> - added tegra20 csus parent mux
> >>> - improved commit descriptions
> >>> - redesigned MIPI-calibration to expose less SoC related data into he=
ader
> >>> - commit "staging: media: tegra-video: csi: add support for SoCs with=
 integrated
> >>>   MIPI calibration" dropped as unneeded
> >>> - improved tegra_channel_get_remote_device_subdev logic
> >>> - avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
> >>> - software syncpoint counters switched to direct reading
> >>> - adjusted planar formats offset calculation
> >>>
> >>> Changes in v4:
> >>> - removed ifdefs from tegra_mipi_driver
> >>> - document Tegra132 MIPI calibration device
> >>> - switched to use BIT macro in tegra114-mipi
> >>> - pinctrl changes moved to a separate patch
> >>> - ERESTARTSYS workaround preserved for now
> >>> - tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
> >>> - reworked bytesperline and sizeimage calculaion
> >>>
> >>> Changes in v5:
> >>> - dropped patch 1/24 of v4 since it was picked to pinctrl tree
> >>> - added reasoning for tegra132 comaptible into commit desctiption
> >>> - moved clocks into common section in tegra20-csi schema
> >>> - added note regarding ERESTARTSYS
> >>> ---
> >>>
> >>> Svyatoslav Ryhel (23):
> >>>   clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and
> >>>     Tegra114
> >>>   dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
> >>>   clk: tegra30: add CSI pad clock gates
> >>>   dt-bindings: display: tegra: document Tegra30 VI and VIP
> >>>   staging: media: tegra-video: expand VI and VIP support to Tegra30
> >>>   staging: media: tegra-video: vi: adjust get_selection op check
> >>>   staging: media: tegra-video: vi: add flip controls only if no sourc=
e
> >>>     controls are provided
> >>>   staging: media: tegra-video: csi: move CSI helpers to header
> >>>   gpu: host1x: convert MIPI to use operation function pointers
> >>>   dt-bindings: display: tegra: document Tegra132 MIPI calibration dev=
ice
> >>>   staging: media: tegra-video: vi: improve logic of source requesting
> >>>   staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI =
to
> >>>     CSI
> >>>   arm64: tegra: move avdd-dsi-csi-supply into CSI node
> >>>   staging: media: tegra-video: tegra20: set correct maximum width and
> >>>     height
> >>>   staging: media: tegra-video: tegra20: add support for second output=
 of
> >>>     VI
> >>>   staging: media: tegra-video: tegra20: adjust format align calculati=
ons
> >>>   staging: media: tegra-video: tegra20: set VI HW revision
> >>>   staging: media: tegra-video: tegra20: increase maximum VI clock
> >>>     frequency
> >>>   staging: media: tegra-video: tegra20: expand format support with
> >>>     RAW8/10 and YUV422/YUV420p 1X16
> >>>   staging: media: tegra-video: tegra20: adjust luma buffer stride
> >>>   dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
> >>>   ARM: tegra: add CSI nodes for Tegra20 and Tegra30
> >>>   staging: media: tegra-video: add CSI support for Tegra20 and Tegra3=
0
> >>>
> >>>  .../display/tegra/nvidia,tegra114-mipi.yaml   |   1 +
> >>>  .../display/tegra/nvidia,tegra20-csi.yaml     | 138 +++
> >>>  .../display/tegra/nvidia,tegra20-vi.yaml      |  19 +-
> >>>  .../display/tegra/nvidia,tegra20-vip.yaml     |   9 +-
> >>>  arch/arm/boot/dts/nvidia/tegra20.dtsi         |  19 +-
> >>>  arch/arm/boot/dts/nvidia/tegra30.dtsi         |  24 +-
> >>>  .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |   4 +-
> >>>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +-
> >>>  drivers/clk/tegra/clk-tegra114.c              |   7 +-
> >>>  drivers/clk/tegra/clk-tegra20.c               |  20 +-
> >>>  drivers/clk/tegra/clk-tegra30.c               |  21 +-
> >>>  drivers/gpu/drm/tegra/dsi.c                   |   1 +
> >>>  drivers/gpu/host1x/Makefile                   |   1 +
> >>>  drivers/gpu/host1x/mipi.c                     | 525 ++---------
> >>>  drivers/gpu/host1x/tegra114-mipi.c            | 483 +++++++++++
> >>>  drivers/staging/media/tegra-video/Makefile    |   1 +
> >>>  drivers/staging/media/tegra-video/csi.c       |  70 +-
> >>>  drivers/staging/media/tegra-video/csi.h       |  16 +
> >>>  drivers/staging/media/tegra-video/tegra20.c   | 820 +++++++++++++++-=
--
> >>>  drivers/staging/media/tegra-video/vi.c        |  56 +-
> >>>  drivers/staging/media/tegra-video/vi.h        |   6 +-
> >>>  drivers/staging/media/tegra-video/video.c     |   8 +-
> >>>  drivers/staging/media/tegra-video/vip.c       |   4 +-
> >>>  include/dt-bindings/clock/tegra30-car.h       |   3 +-
> >>>  include/linux/host1x.h                        |  10 -
> >>>  include/linux/tegra-mipi-cal.h                |  57 ++
> >>>  26 files changed, 1657 insertions(+), 670 deletions(-)
> >>>  create mode 100644 Documentation/devicetree/bindings/display/tegra/n=
vidia,tegra20-csi.yaml
> >>>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
> >>>  create mode 100644 include/linux/tegra-mipi-cal.h
> >>>
> >>
>
