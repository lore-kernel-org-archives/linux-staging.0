Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468E920B810
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 04:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760994; cv=none; b=XgikGwjnb0KBW+OsfQjzBQYXY/50xdtsG15P3QxfSCy2KiMjFzv6praDq+plASwxYnpqAEcPWIzi7eT8FSXtOeA37DDc+2pfi/4NTuroHAAjPfngreWOdWqYhZee1ckB3Fz4IbzwFizW5aM+5zvRo89lerQI57nb2QQbqxivj2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760994; c=relaxed/simple;
	bh=e3+WQHyFRW/3v5sP8KdsTaOplFA/7EjOOFOI/hwG3no=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G4UKUad1BnQaJLlumJuW1/E+wamA+gQDB2+f7e5uDo2T6LEMuls+gVhz81j1fbPjo0JsDAyyxIbroGm++2DJmnVKbtpbJI4RCpBLp36dUHWda6GM9P2jugWz8hdHJMPtJTlpGTdlXB6MywYlxuzf++zNv0TDV3eClJ6JFGX5SFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcltJu/J; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcltJu/J"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so187193b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Jan 2026 20:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760992; x=1768365792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WslmtEFTWEHvFrP3QiD87NaWkQaTvkUfKeQGZcqLgCc=;
        b=BcltJu/JYjbn+Xmpr/qgdsykxt5s+xXi9hsHduR7cr/ZrbV8Na5jmE10JE2wKIYs58
         Wg+Dmy2++m0a9Ds1CvIkcPmP8f6gIIAUgocRO1hmhYnBi3u1Cei6dygyiQZXXvlIiS0/
         Fe8CEgAtpipgj1155Hib4aiIyOwwy38R8PqEwcYIorPaQvZGC0ihSMOg2/qUuXYVBksx
         eboER5kyX+nbagl+t0XLhDrpitRbAS2KIExFHPiTAG37LSm+7qKBQF8wzKjTX87NrI5l
         j0SfSu78uBxRb4togFAEyb+YVyJ2a5V6FeWIsGEsCoALmzm7cYiXKZ8SSIBysaKcUkMp
         AFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760992; x=1768365792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WslmtEFTWEHvFrP3QiD87NaWkQaTvkUfKeQGZcqLgCc=;
        b=pExb+gQQwYgwKXwrShWEOYfEhA16ZqFBgGKjwSTmjRrHGc/nLtPl6cWWfMNYrsa3Pz
         reCoYmpzY6VZDvO289LnSbjDL8E4j5nz4nQ5rJnxca03Kn9+ZTZJLUoT+U5cuQxW2H96
         Z3sIvEbJis5fBc1JmWbFvSOEXRHvpMRGKFuFrXlyher9OPFPhucYzUzrAtj8HDnI4d/N
         HBZ9mjwWHRn2YEt8EEmCDnK8CiZdOjhTJl+7H5WBfasqrku5WxLvVvuSgvXrlI6JaLeT
         8vMYcSL657HqbvpijOWfDZpj6uuq1SvYiTRBAJZWB7qXhDrTCvr2GmfGz+1/SolKnHdC
         Wi5w==
X-Forwarded-Encrypted: i=1; AJvYcCXVLJH/xYt1N0O6PLU2itd699AAJb8BOh67YEQfFAbnD1OweufXoPnHf7CmSXutA0DKWuWSzMsna045jGnn@lists.linux.dev
X-Gm-Message-State: AOJu0YxltWVgUUbHZZjp6UqTeEV9Xx/ik3yhLLvf5DiydCGVJVVXe+RY
	3jnTMuKtpQWBuABLSVYKfPjwBuG2ojZzmi4K7praCJJJsNYQ1/A8/xes
X-Gm-Gg: AY/fxX4mIjgtc5c8asCOPCrDelLdA6Pd3GLgQ3YDVjz/mbR8kypfrZLbQ/k5t1DKCuB
	K+dK/rOt898Phd01/o2zrTv4CaUxGjguKPRdkaMDgBkDGHy9Ti+SbBlXGdGxoipPSd/u9v10KI+
	EFX+xLEefd6XuYzGz5dvFTJDRVtNubzuJ5nAay7tFcF1yTX7XsIY1gd0Jj+a6CRujj4dmPtrsss
	Nt7Od32mv9yQuFMD0P5c5BhWDnElFKT/FbkZH0OFCXl8uyODrEFp+5P9XIa0hxaYXOpelac7Tn7
	cDlAGT0XvXpVk8/b7MceFZB18Hk0swj8M92hO+poxJoQnwfsAx6iDCXUDES3OzIKrCY8nNQcQDl
	UCYF6UGR0NVHnCHo7e86t5fCibuNIJ6Tmv32nv3VMjIPALCXchrfY1pp1AUQ5IkDOMIqPwXgWYQ
	xL1RjRMSVxm7+Vb71h5uBMop3i24fDoWsfHEezJ+RtLkE=
X-Google-Smtp-Source: AGHT+IHvMYshChHPS/SvCPXJOds/HFiMhuycAJvqKdORLFBZ5x1SeAE0yuJFjXTcwpdgt59hPsI5hw==
X-Received: by 2002:a05:6a20:548d:b0:366:14b0:4b1a with SMTP id adf61e73a8af0-3898eb23fe7mr1504437637.37.1767760992455;
        Tue, 06 Jan 2026 20:43:12 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:43:12 -0800 (PST)
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
Subject: [PATCH v4 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Date: Tue,  6 Jan 2026 20:42:53 -0800
Message-ID: <20260107044258.528624-1-chintanlike@gmail.com>
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
Changes in v4:
- PTR_IF() was removed and overlay sysfs is now optional via __maybe_unused 
  and #ifdef CONFIG_FB_DEVICE (suggested by Helge Deller)
- Decouple variable definition and assignment in 
  omapfb_remove/create_sysfs (suggested by Andy Shevchenko)
- Added Reviewed-by tags:
  - fb: Add dev_of_fbinfo(): Helge Deller, Andy Shevchenko
  - staging: fbtft: Helge Deller

Changes in v3:
- Use PTR_IF() to conditionally include overlay_sysfs_group in 
  overlay_sysfs_groups(suggested by Andy Shevchenko)
- Decouple variable definition and assignment in 
  fbtft_sysfs_init/exit(suggested by Andy Shevchenko)

Changes in v2:
- Add dev_of_fbinfo() helper (suggested by Helge Deller)
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
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c   | 18 +++++++++++++----
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |  5 ++++-
 include/linux/fb.h                            |  9 +++++++++
 6 files changed, 49 insertions(+), 11 deletions(-)

-- 
2.43.0

