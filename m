Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD3E222587
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 05:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767072548; cv=none; b=IUynXLHr8wBF9526ARpzHHorFghIy5PFd+SgPBFPRbFx6idJnT59lXkNdbCmaHNUSqbEt3zWh2Tf+DzQLechlYnkJpGat+Cln9GHzydNxhZuFklKGmC0gFhhDhy5jXGR0KqHP69LsVpHWSB+sWBmwZK7KoG2t1O81TeAXBe+6Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767072548; c=relaxed/simple;
	bh=9ea4jF6P3TyrXMCdcTje93kbQRCfpteLO1tsmpVJYR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K+VIF2GtkEqjYMFT3SSVvfuZ2i8NlKZ1bWDrSpMolS1UTiELsILYusjm1XR7n26ObH+Mcgc54RkejOB8cn4XqZXyoII7LrzlHbZkbKir522b1fkkUFAFy3IrBmxWLL+906Es+jGtZSc8Xb79WGc1v3Fp8559XZn+yYflYRi//ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYvhZhQo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYvhZhQo"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a07fac8aa1so103237945ad.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 21:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767072546; x=1767677346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dj6McVGjym7Yb0fc3OqJWPUYkxg//XdJSHr/RV+rzYI=;
        b=dYvhZhQol5fBeSu8oRweH2147XZsxw/H1+PBJTgEliARMaT1UlClLXsC2vbQ6Q5AWW
         B7brdpYDhNqJ7S/z4HmuKJBiAEgUnf8rWGSPK4CZZakdYjM9Ivo2o4nf25BrYSmpz6qd
         e/I85nrjcw3W74LWj34Vm5SieiIWt/WbThhdS7GD4j1PUJ+3ZUBT42QXH4MVsXtipPwi
         dDIC7RSW9GX6dxZqJzqv2xfKVFfig7BWk9zwMjdnHCyZ6RNRC4jE+Ao9ljENFpBXL6TL
         Uxhik6Q4U4r1hYF4Qjc9QczsRxeXPclTuS0S2nJX/bJdYc+9u1cGYjnfmKyi4kR8vkQC
         pOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767072546; x=1767677346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dj6McVGjym7Yb0fc3OqJWPUYkxg//XdJSHr/RV+rzYI=;
        b=fdNaYB5/HxChfz+E8ufJZHzRl8mBgasRYDHVzxdgSCBZ5Q7RHQPX68x3Zm24nhspy2
         fvU44ryGlGIh+AqM22qfzfWQDIAix0QcJtYs6HTg6jOVf9IvPlU9x87S0//vT3aQmvtL
         4jkxZTFv+7muo3zF4WKavSX8QlW+VhuyHicarq2ga6cMiGFgcf9YkYIAdbJvU6YtBTQW
         KaUsMtJHIlt3DYcbMcukMMM79Y+KEY3jfXncDoNVD5MSJjgrnYI1nHaFCFnMQ3JA1Bf3
         xYw4fLqPu7x6vslREXD5JyU89AHTCu3rd4n32Jd5GhT/zF4421JHmxSlE4PX9/sBEoYK
         N+Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWj51tfs2+F3YWUA7Zo6oqim6eQ9L0ylivKxawRyJtJ4+CPhB1rZNODid5RpW4/miy0v/8FVUiXgR2xkdDt@lists.linux.dev
X-Gm-Message-State: AOJu0YyOSlj7/fcBWOYEh8bqACI7vfb2YKtVo3SaGqE7xBUKWe5Qd7nZ
	MeroeIKy9eK6YkOBMgvtSQPMiwl9QyC1o0UGmlICjM5G0A0VjJJzaAxM
X-Gm-Gg: AY/fxX4qPBayEkpsF0dUTZMaZWWPMywtbM8SL7RWpWskG39mGyllkvpJnIvlEqHQzez
	5E/w9MvwxUkByWu9EVUsNzz5lArcPGCBea0E98er7A1Ko+r7UNjuiP2jnF3pQteshYkEcW0yaqx
	1khw9+cQFQYaTSqDOxD9Ijdy/772gFFxDoCgIgVp1/QyGHlTwv8pxju6uwfcHIudYq5p0hybEJB
	HgubJhDUgJ122+i/yfQlidvDTKAbm7uvUOgHPOISsKdVxUnTh5/1gJ12u7QGYUGvp5ztHVLPltz
	LoIJ9EUNpvilouqoGYTr3liVZJb5a1AqEllW3ZciQXO33Q63nrbXP9ncRwpWC1pKX/O42mCZ6+S
	zKwFMdxCHYy1muFJwscrXDa7OAoGee+cRVR5JmQ4Dfp48PWexXltVRdC+fBpgVHApVpWzqPrNPi
	71qEMLMPtc8lb0dFH41yG/nloTUibGDLuPbhhWreDQkQ==
X-Google-Smtp-Source: AGHT+IHwTfpQdWaiGQID80ROPYBWipLKNMwbumSR5a0iV81jvx/Y/dNBzJjvj9L9pMYVwYJAGCLB/w==
X-Received: by 2002:a17:902:e785:b0:2a0:acf1:ad0f with SMTP id d9443c01a7336-2a2f22024e0mr275687215ad.12.1767072541794;
        Mon, 29 Dec 2025 21:29:01 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 21:29:01 -0800 (PST)
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
Subject: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Date: Mon, 29 Dec 2025 21:28:18 -0800
Message-ID: <20251230052827.4676-1-chintanlike@gmail.com>
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

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
Changes in v3:
- Use PTR_IF() to conditionally include overlay_sysfs_group in 
  overlay_sysfs_groups
- Decouple variable definition and assignment in fbtft_sysfs_init/exit

Changes in v2:
- Add dev_of_fbinfo() helper (suggested by Geert Uytterhoeven)
- Replace #ifdef CONFIG_FB_DEVICE blocks with runtime NULL checks
- Switch to fb_dbg() / fb_info() logging (suggested by Thomas Zimmermann)

---

Chintan Patel (4):
  fb: Add dev_of_fbinfo() helper for optional sysfs support
  staging: fbtft: Make FB_DEVICE dependency optional
  fbdev: omapfb: Make FB_DEVICE dependency optional
  fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional

 drivers/staging/fbtft/Kconfig                 |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c           | 20 +++++++++++++++----
 drivers/video/fbdev/omap2/omapfb/Kconfig      |  3 ++-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c   | 16 +++++++++++----
 drivers/video/fbdev/sh_mobile_lcdcfb.c        | 12 ++++++++++-
 include/linux/fb.h                            |  9 +++++++++
 6 files changed, 54 insertions(+), 11 deletions(-)

-- 
2.43.0

