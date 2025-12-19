Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981AB275AF5
	for <linux-staging@lists.linux.dev>; Fri, 19 Dec 2025 05:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123021; cv=none; b=Rybnu4cu8AlT3cWE3RpuruepgV9lOiZFWYwslZfqsnjazbKEyJ/j4AbL44mIXgM1y3v0v0eOA8jCg3bgnavenzksUbjUfM9H5V9m6YrxlNnHNp2pQGHFFtF0A4EhBTGGdq/t1qx1dQg4Cin92mSnL0DXbM1XLbdOeUN4ZOGrXFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123021; c=relaxed/simple;
	bh=olchUGNmj+A+qnIzj2ct7pmV079cgkWTHEnd61K24Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=htqx6n5bg0huHCPFWpMweCfauzwXrEzD55skIDluvmQIUhQrIMD0pZgUlrUpQP0UK5SsfIUS2n3DZLrHYpL2UYqLWBG3d55TY+rjYQ3eZqoM/4hGjEUROvraoaDnSC8WgrwajKJHMGbe7xlV6FMJfWCRBJgzrQFSFi7m5KXeiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDmusfRG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDmusfRG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0d5c365ceso16821865ad.3
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 21:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123019; x=1766727819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sEjpRHuoUQuSNfpUTp6o9J/plYbBOC8VgnoTelGo6Ag=;
        b=fDmusfRGVT8RoCIT8wxd8hLRfkM644/0swTA80jzGnbzxRNgmxapaE0pZ/Xr9VtPny
         ONEuYj71ua/Y+AntSu1OvWHumNelhRMQ0BMmYfTwSEO6jXGWhumG6l5iaLdg9PiTFoQh
         elm7GQ0qSXWpaSXm7cTUqHD+kInhsXzB7X4Bcv4+o+NJNzoTFRZ0mNydYm0S1aHIV/5Y
         5fPkuWjkP3s+oZHgoV/igmOxyT+UT7mAYZkhWmPz8KeCEQZnSa5aHueDflMb+9OHQwIO
         5XqLX5WRV0xiQvdD2IxBdR8/kn592SAFMpfygVCi12VjEPc0zh/vdZQlSkxyR536l8lb
         2UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123019; x=1766727819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEjpRHuoUQuSNfpUTp6o9J/plYbBOC8VgnoTelGo6Ag=;
        b=cuW2Xa7SN27Fx75rP+1aHURDRIQ/rL7OJ8xAw885e8/aPrJ4MYLzwr1iq6n0PVEnjm
         tp6DC2DpFoPwOaA4dDeybtrNShO40pP4GqWjktGksaEDxR3wCgrm7ydwPxPHZYWkcG51
         /UhaA8iGDnn4ooV+1gkhxnvsEMEjviwh5N9tiRi5FhDEdtHnwKDzen9S5AYHjyNXMtsr
         DjIOdcC9P8FG97F5JFvc5ZVjuoOzZwORToqEPZ0migqah5QtTe8bALy8JazBM8BOE+Yw
         eW38IQkP7ScmKH0LISXolMSTnJd6lxqVkbk/patFO1QENeJQfXEtFUy2MHvHNiyt0/8c
         I/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcjCb0GDjq2jzuYdW4TQGjbeQ6qRuiH6RNrKDH+CdwzU/fAyRB3NCg0YOBQPdreo2vh8xp82BDS5Gyz0av@lists.linux.dev
X-Gm-Message-State: AOJu0YxnqLglzyLYvfEhaYNgEV35jUayX3L4rnNlsI9ivFOFRsw+42tE
	LV3TtBUQQy8bKOiI8doLoAfOeisXeV6GwXn2MLNuGeqpX/QWYUI2sQ6E
X-Gm-Gg: AY/fxX5IIT3zFRZ4a6IIFR3tI5TtAerI9Y1bZLDcsBhrd5DAI6aBn5wYgu4Ev5MFF+X
	+uUAUPpMb+R1R1CSGcYfVVX+aXzNGCL9WJy+z4UxPS7nj/2c4jP58hO0NTOz+B8gmyT/HoTkC4C
	oW1ptTDSD+2p7myK07kG/ZMZZxtIoq2EI7faJhHmbHKWKS9rxL7hIKhO2dNQRCh5U+emSWYmGrk
	XlOlwgWLH31IOfQNJv3cC3hqWMu6wT4rPNeKMFK626EWZArOJCl4eQaA82IRHRC30TgSdvHPc4l
	3hbV7c36kh6r3Wki6wuaCOo0+XxV7xD88ZRBQpea1MK1grg3xBAdu5stZYyJIjRKSVJu72NV0Bi
	dpJSGKP/Fpsr4bVddCYuHh+8h1IfION86dXuTnyXGR2GB7Sx/kt0kKjl3kX6yWgBDsxrtf/Egda
	vNBIlP1xg4Dsp6M11L3tEOZBWH257/i42FNf6QyQy3v7w=
X-Google-Smtp-Source: AGHT+IHctISdxJ6hWwW5bBx0NwJSgL9qDkTNsgriPOBWh2QM/6lUZdbbSRVd/mE4FUYhXiJRoQ1jPw==
X-Received: by 2002:a17:903:2301:b0:294:f6b4:9a42 with SMTP id d9443c01a7336-2a2f21fad06mr14413895ad.9.1766123018955;
        Thu, 18 Dec 2025 21:43:38 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:43:38 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	andy@kernel.org,
	deller@gmx.de,
	gregkh@linuxfoundation.org,
	Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v2 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Date: Thu, 18 Dec 2025 21:43:15 -0800
Message-ID: <20251219054320.447281-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
it only for sysfs interfaces, addressing Thomas Zimmermann’s TODO to
remove hard FB_DEVICE dependencies.

The series introduces a small helper, dev_of_fbinfo(), which returns
NULL when CONFIG_FB_DEVICE=n. This allows sysfs code paths to be skipped
via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
full compile-time syntax checking.

Changes in v2:
Add dev_of_fbinfo() helper (suggested by Geert Uytterhoeven)
Replace #ifdef CONFIG_FB_DEVICE blocks with runtime NULL checks
Switch to fb_dbg() / fb_info() logging (suggested by Thomas Zimmermann)

Chintan Patel (4):
  fb: Add dev_of_fbinfo() helper for optional sysfs support
  staging: fbtft: Make FB_DEVICE dependency optional
  fbdev: omapfb: Make FB_DEVICE dependency optional
  fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional

 drivers/staging/fbtft/Kconfig                  |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c            | 18 ++++++++++++++----
 drivers/video/fbdev/omap2/omapfb/Kconfig       |  3 ++-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c    | 16 ++++++++++++----
 drivers/video/fbdev/sh_mobile_lcdcfb.c         |  9 +++++++++
 include/linux/fb.h                             |  9 +++++++++
 6 files changed, 50 insertions(+), 10 deletions(-)

-- 
2.43.0

