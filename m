Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5803783D7
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702656; cv=pass; b=OaOa3V7JkHXGn6/aOFXbKzMj1saQ2N0MnYBqqA4ZeWX6zg5WxPsiDWWG5c2eSm208W7HGHLJ4tU2AjeLsizW/Ob+dIa+DE1/3ynjEzcRLal3h7VdO/aqIcAYE6d48+mlr7mObbjv8Yyey0+fxswLd44DDEeytf6+a3u4bndWZ0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702656; c=relaxed/simple;
	bh=fzjMnKx5Dmvaj+/abZHnJr4+kb8ctg0Lcon//6mFsgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXBx+iyc4aSkv623haSbh2xXkeUeoy0u0TwwB3q029lT7BO/IcujBaxQoKvWeGlzWTqIeORT0u8lfd08tHy8nEOXGZh0mU1+kd0fEQ8Ohn8wLaf+XRX8N8OsQ4vAru64XcrA3DnKApgHN4E70mgGiWJkv6/CQX6BgmL/SXV1lfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0Sm32OO; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0Sm32OO"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b9b1900bso3025670f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 01:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772702653; cv=none;
        d=google.com; s=arc-20240605;
        b=ECMG1ApMkDPuRAyBmnkCiT8FhM8hSHvVvortAN7EzaWCp51jnGxTbR2+Pi9u4cBOs3
         JMlPOIj42klR2NiRgCiV0CC2xI75Xx6Tr33J4+HXyJrRMvkXQYnr5cjfZ2t5TwW383Ek
         bnbWYs7mGNQRAiwYd7rQO+b9Gwmpb3MkpHiLsCEa9lVEkG5owoBBY1NvbkE4mm1EG9Ow
         28dmhqTidL0b4F/lMFb1fRIMvlwtUbVrU733VpWl0lOqM1GFaRHdScoBwvE4nx9mexRS
         cV8tISab5O+Hz45y6KeSDZ96UGDvOH93+2DdhXsUAE63l1OpiOAgHaa+1xnqkfUqG90U
         gcag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
        fh=8ccFMb9z5AuKqgJ/mSfAfkMJC918J0M3W5p2wT3zf1w=;
        b=kFc0ZPdxkOkkbRUye2GkIN3GBeyoLQplCGe79LdZOuXSI3GEjnO29oqdYFPDX7YgOH
         p9iYDqGKrtpsLf3oc+XIQAv7Sn9wiRBM7PNE/FGYvWWkWafbWEymL8/k5oUxd+GfrZ0k
         rgf3qpZK8btAF4nXkSM1ghTmas6fWu8Si0YcUMPVjRNbbbAIlvi2Qw889tartBC9z9U7
         krLF6T10wXV6eat+qZXAMLhNi6OV6lnokwG9+gwkE39KalZYIeBMEJPahCetV5/Pclrp
         sxFmYtGSCqbMvE3DTGFHaNWQrYFOPzvMoApgNTxRxMTBt0x80ptJB9dNTD2suWVe0B67
         pHBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772702653; x=1773307453; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
        b=I0Sm32OOQ/nMl/UfG5qo7nS4h2BZz4KgKf18K3oVepnT68QQbACFB5tgLCHQ2EvTfQ
         8hcUaLX+evUo5qGHg28LDHzYclCMY3LBXf8XZC40mO4FceZUWypxQhfA/bLyZLPK1nXo
         UU+h0BW4mUiIWDv2+EKLHCNwfddTmphMJCHT+XC5pvAsvB1ukbonDdnVURHZ9PGn9q35
         YxoTbJjh7EO34xJa5puXfs3ANa5HvXMsxGDqqC87vPCz7OQAMOGjyx952pEd+uYrSmTQ
         27XS6JvTzYJ/F3Yjlb7F3kSwz56MqVgbrCp1soPBO743YNeYUxd+AJjCKOEtSLSYSQh7
         sEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702653; x=1773307453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
        b=lsOVbFx5t4wCGQI7C1rvHLQhLp4Wc2PhMV0NZBo07SUCeL0Cknt48pQeAMRm68PUGW
         J74Mh9PA+iBpo1ixH7z/dD7E+n33Vht3ahKahc0BTandiayYBke6NJvH/j4YIY/2P+Vf
         VbkXUnImAemXLu5/b5pas1XFOBdh4pEhM5BHaDmxHjJe1HNMEr7RiTXhdLYhiufPOLi7
         GLySL2x1RSLcnuGiwAp+dLsWJXFp0KSKtmgd/Kmw424Y4eop1E8LcnsnbkPAAEQ7l+eA
         R5GEvSstiunpRXb2EojjCLTK7GCgChqThLX+etEdfAt3NecOwBLtsJX8kb0GFwTjcoQ7
         PuIg==
X-Forwarded-Encrypted: i=1; AJvYcCVinisJodT57jCKRTn6+6zu0x8Q5Ke6Nyv4g44HRPENCH6XSANJfzd18huGqm5G2bk0b1HC46yBCFVHOrDf@lists.linux.dev
X-Gm-Message-State: AOJu0YwskXfz8ItoP0qub/GfwbQYB+Z7ALbH/gpaMgSydh6hRyTGy53k
	c9aC6lA5wBWneUkKTTiXftmtQvCuVh8z0bWiN9yxe9CfGQcDR0v/21mow25ojElrRnWmDlc3sEs
	yPVIhnEw8zJoYOVWAWGATmWWyQ1xpubg=
X-Gm-Gg: ATEYQzybdxQ46aKcay1fOcBLkgkWbWBMeHCiOdyUWvsvvs9EJ7+9xzsfJXLogrJ5C2r
	0zes7ZlZ7aROKlrVVaB/XB6XBfIueJUQNLo5eQLZ8icJnDgaKKEJoGGNMpgOEjMXDihzYAeDA+w
	Bp0ldtahYEkNZaLOM5EjgC0LyzWWvuQwjT7azkVTonIO2CuNdLTSAV9T8AgrPaBYHHtKjLtXkAg
	H1zvfLIM9A1OwrPBVqNWjH5ZoDcgsyTbN0arSbE3Z4YHy2NvxBuUArcZnLCjJc9qC7WyYg2hRWK
	eRIiDocp
X-Received: by 2002:a5d:5303:0:b0:439:cb5c:b18d with SMTP id
 ffacd0b85a97d-439cb5cb1efmr5687097f8f.38.1772702652808; Thu, 05 Mar 2026
 01:24:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303084239.15007-1-clamor95@gmail.com>
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Mar 2026 11:24:01 +0200
X-Gm-Features: AaiRm52U1-rp7kxII13ghlYufHfzAUdiofPyz6Xw8QG4vZZsa74ZdbNb3EWlC9g
Message-ID: <CAPVz0n0+FDAsRxCaPy65_N5O0KKE0tQ=zQupEM6VAR5LPLuOcg@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] tegra-video: add CSI support for Tegra20 and Tegra30
To: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 3 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 10:42 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
>
> ---
> Changes in v2:
> - vi_sensor gated through csus
> - TEGRA30_CLK_CLK_MAX moved to clk-tegra30
> - adjusted commit titles and messages
> - clk_register_clkdev dropped from pad clock registration
> - removed tegra30-vi/vip and used tegra20 fallback
> - added separate csi schema for tegra20-csi and tegra30-csi
> - fixet number of VI channels
> - adjusted tegra_vi_out naming
> - fixed yuv_input_format to main_input_format
> - MIPI calibration refsctored for Tegra114+ and added support for
>   pre-Tegra114 to use CSI as a MIPI calibration device
> - switched ENOMEM to EBUSY
> - added check into tegra_channel_get_remote_csi_subdev
> - moved avdd-dsi-csi-supply into CSI
> - next_fs_sp_idx > next_fs_sp_value
> - removed host1x_syncpt_incr from framecounted syncpoint
> - csi subdev request moved before frame cycle
>
> Changes in v3:
> - tegra20 and tegra30 csi schema merged
> - removed unneeded properties and requirements from schema
> - improved vendor specific properties description
> - added tegra20 csus parent mux
> - improved commit descriptions
> - redesigned MIPI-calibration to expose less SoC related data into header
> - commit "staging: media: tegra-video: csi: add support for SoCs with int=
egrated
>   MIPI calibration" dropped as unneeded
> - improved tegra_channel_get_remote_device_subdev logic
> - avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
> - software syncpoint counters switched to direct reading
> - adjusted planar formats offset calculation
>
> Changes in v4:
> - removed ifdefs from tegra_mipi_driver
> - document Tegra132 MIPI calibration device
> - switched to use BIT macro in tegra114-mipi
> - pinctrl changes moved to a separate patch
> - ERESTARTSYS workaround preserved for now
> - tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
> - reworked bytesperline and sizeimage calculaion
>
> Changes in v5:
> - dropped patch 1/24 of v4 since it was picked to pinctrl tree
> - added reasoning for tegra132 comaptible into commit desctiption
> - moved clocks into common section in tegra20-csi schema
> - added note regarding ERESTARTSYS
>
> Changes in v6:
> - dropped patches 1, 2, 3, 4, 10, 13, 21, 22 of v5 since they were picked
> - rebased on top of linux next/master
> - improved description of commit
>   "staging: media: tegra-video: vi: adjust get_selection operation check"
>
> Changes in v7:
> - rebased on top of v7
> - kzalloc > kzalloc_obj in mipi.c
> ---
>
> Svyatoslav Ryhel (15):
>   staging: media: tegra-video: expand VI and VIP support to Tegra30
>   staging: media: tegra-video: vi: adjust get_selection operation check
>   staging: media: tegra-video: vi: add flip controls only if no source
>     controls are provided
>   staging: media: tegra-video: csi: move CSI helpers to header
>   gpu: host1x: convert MIPI to use operation function pointers
>   staging: media: tegra-video: vi: improve logic of source requesting
>   staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
>     CSI
>   staging: media: tegra-video: tegra20: set correct maximum width and
>     height
>   staging: media: tegra-video: tegra20: add support for second output of
>     VI
>   staging: media: tegra-video: tegra20: adjust format align calculations
>   staging: media: tegra-video: tegra20: set VI HW revision
>   staging: media: tegra-video: tegra20: increase maximum VI clock
>     frequency
>   staging: media: tegra-video: tegra20: expand format support with
>     RAW8/10 and YUV422/YUV420p 1X16
>   staging: media: tegra-video: tegra20: adjust luma buffer stride
>   staging: media: tegra-video: add CSI support for Tegra20 and Tegra30
>
>  drivers/gpu/drm/tegra/dsi.c                 |   1 +
>  drivers/gpu/host1x/Makefile                 |   1 +
>  drivers/gpu/host1x/mipi.c                   | 592 +++-----------
>  drivers/gpu/host1x/tegra114-mipi.c          | 483 ++++++++++++
>  drivers/staging/media/tegra-video/Makefile  |   1 +
>  drivers/staging/media/tegra-video/csi.c     |  64 +-
>  drivers/staging/media/tegra-video/csi.h     |  22 +
>  drivers/staging/media/tegra-video/tegra20.c | 820 +++++++++++++++++---
>  drivers/staging/media/tegra-video/vi.c      |  58 +-
>  drivers/staging/media/tegra-video/vi.h      |   6 +-
>  drivers/staging/media/tegra-video/video.c   |   8 +-
>  drivers/staging/media/tegra-video/vip.c     |   2 +-
>  drivers/staging/media/tegra-video/vip.h     |   2 +-
>  include/linux/host1x.h                      |  10 -
>  include/linux/tegra-mipi-cal.h              |  57 ++
>  15 files changed, 1482 insertions(+), 645 deletions(-)
>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
>  create mode 100644 include/linux/tegra-mipi-cal.h
>

Hello there!

May this patchset be picked if everyone is fine with it? v6 iteration
was hanging for a quite some time already without any actions, I have
rebased v7 onto linux-next but no other major changes were applied.

Best regards,
Svyatoslav R.

> --
> 2.51.0
>
