Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC72066D8
	for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739533656; cv=none; b=qDfh+Yj23VO2RXTQ5qLtFEGB8/55KFUfbLl22qDnxYfSk71N/SlQ459G2+Y3Mju68h1F4YY0X+WRH9vVOSai9Jtjcie3zk7NCogKTU7hxJxmQ7kfXDgtjjSPyVoMeV6ulKr2g5dE5d9Pgpf49tM9QQQk3y3DN9J186rgEGYM3zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739533656; c=relaxed/simple;
	bh=uCxvq91fIV7zlKUB593M/og+Sy08hkHmHvkNocDjtAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBnP4tYat/MOI4Z4mXPI7OB5ej+r5Nqw5Qi9GzJCd67HstUHMEEGbMA2vXMsOzQjmAfErfd16PtQjMpSEyJqxGzA/pnrq+C5yn9ocO1AEN01UF7pDhmsT+eRX2qnuBf+L1QfzHYhaawp4f+zOclhVzMyQoatCDf4owPwkFX9x9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFWjpcn3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFWjpcn3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4396794c044so6715885e9.2
        for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 03:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739533652; x=1740138452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8g8mDwgrWpwYxCnplOse0iyDpwOW9AqnpV1941TQhgk=;
        b=mFWjpcn3an5bDlhQbhrjdJX7eU3JZVi7IfpA8tYOk6jPH0xJk6bITbsrGwVnBcQkQw
         KOdss9MnUAyCUSdNCKhgwDh14ErX0qXpSe0Tz2y1n13G3yCB1V5KR+pM9pjwFVNifmMI
         kc0kc3DwP95Lyp/W42ItpWcLTuOFzUv8jkJTrvn9QACP5UWwh6DgPjY7IBeni7JrnHWf
         Got419ETytdm7ZTiqqZdu5IMYLDxqFKdlz+B4ixi4gEy2FiQcjjrcQpVSXAFX/1upRTB
         RtjmsZzoc13FAWfOmHFKFt5n0OVskthHChScjcKC/2cp3cePpnaQ2fw2pNw1yDifaFnz
         rA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533652; x=1740138452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8g8mDwgrWpwYxCnplOse0iyDpwOW9AqnpV1941TQhgk=;
        b=erScP2g1K0a0NpwPLLn3XZElLbQ10LPW5we/WyL1wiPiQACl8vTzJBwEdezuxcQiF9
         NQmcV6N8sv717LH8cQhiTH8X/Ba764ja/+QA5JkypQAKpW7n7CoxEGW8JfkD1WpZMnVP
         2M73HBLvgcGw+gdcZI0WefmsuKEtku/ekdbuX3aN37Ghh6x7inAR2EoNY7L5HLMDw+kS
         KhVf9We9CWf5ZIfQ3D7XotPvOUJydfDc3clov1cWEBmoJusBPyKuGp66QuBmT+0m2XAZ
         paGMCmZG7HTWM4e5AmKmx6DoKEg9gcg1167geUnmphx75bIN0aM529YwWmYDHzv10AAI
         FAWA==
X-Forwarded-Encrypted: i=1; AJvYcCWvkyt8V6cvBXJC8sA5DanZp1HhbGKtop3vVmo/Q8p0m2gS290E4i760UkQROnDPOC5pMPxsp3zuURU7wu9@lists.linux.dev
X-Gm-Message-State: AOJu0YxcBm+0KAd3RM1Al3FOFxliROoJWB94ZXoGJqdNyJ5okOO5HjRk
	W4H93h0ovFwIfalapA2bQv89Iihs6iDNHbaKTYP/oS7TTYowhXpqu8IuO6CZ
X-Gm-Gg: ASbGncvatNAE/vP0bzRNISyzBhf9ZZsXIWSq2FrMwXRfmHl8gyjQnQSq5EP9RQ64rVP
	Sh+5J1AFK13eLPpBJ7CCp4TLN8DGgLGgD5/nogJrSmrSYI05tssPwXfRM62Sz1Ival9DwB5KqrA
	h22yvERxpWMjp5RAwtjXovvSmdB6fy9pbfkJM+g5ZzQVK9Zx2cyjD2sfdE8PXmb6HJv24BQumk4
	CH4blJdpjO2xzArIL/uf8/ICrVcTGKyosG8h0bLjFb8exg+TSQATE6FLxV2mSIEQBV07fKSAVnt
	qC6kXIvQM2Y2dMEPpErfHNtIyNG5y5F4LB0c666zRNTdY12bo78=
X-Google-Smtp-Source: AGHT+IE62dvCnVIu96tU8ej81r1rPurvJp40jfvtzAAQcuVDLOv/ozFUJIrtVbP61YS/zwF5ZxGzdQ==
X-Received: by 2002:a05:600c:1e25:b0:439:43b1:e60 with SMTP id 5b1f17b1804b1-43960192a13mr100687845e9.17.1739533652258;
        Fri, 14 Feb 2025 03:47:32 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fccfesm41945245e9.11.2025.02.14.03.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:47:30 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 00/17] staging: gpib: Console messaging cleanup
Date: Fri, 14 Feb 2025 12:46:51 +0100
Message-ID: <20250214114708.28947-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIB drivers printed a lot of spurious console messages. This
was linked to the level of code maturity, often using console
messages for debug.

This patch set cleans up the console messaging in the spirit of Greg's
recommendation: "When drivers are successful, they should be quiet"

All pr_info's have been removed except for one which is in the module
init of the common core driver indicating that the GPIB subsystem is
initialized.

All dev_info's have been removed or changed to dev_dbg except for the
attach and probe messages in the agilent and ni usb drivers. This is
to facilitate the creation of config and udev scripts to ensure that a
particular usb device is systematically attached to the same gpib
device file.

All custom debug and tty logging has been removed or replaced with
dev_dbg.

Error messages where the user can figure out what went wrong with
errno have also been removed, particularly timeouts and interrupts
during reads and writes which can occur quite frequently uneccessarily
cluttering up the console log.

The patches are 1 per driver.

Patch  1: agilent_82350b
Patch  2: agilent_82357a
Patch  3: cb7210
Patch  4: cec_gpib
Patch  5: common core
Patch  6: fluke
Patch  7: fmh fgpa
Patch  8: gpio bitbang
Patch  9: hp82335
Patch 10: hp82341
Patch 11: ines
Patch 12: lpvo
Patch 13: nec7210
Patch 14: ni_usb
Patch 15: pc2
Patch 16  tms9914
Patch 17: tnt4882

Dave Penkler (17):
  staging: gpib: agilent pci console messaging cleanup
  staging: gpib: agilent usb console messaging cleanup
  staging: gpib: cb7210 console messaging cleanup
  staging: gpib: cec_gpib console messaging cleanup
  staging: gpib: common core console messaging cleanup
  staging: gpib: fluke console messaging cleanup
  staging: gpib: fmh console messaging cleanup
  staging: gpib: gpio bitbang console messaging cleanup
  staging: gpib: hp82335 console messaging cleanup
  staging: gpib: hp82341 console messaging cleanup
  staging: gpib: ines console messaging cleanup
  staging: gpib: lpvo console messaging cleanup
  staging: gpib: nec7210 console messaging cleanup
  staging: gpib: ni_usb console messaging cleanup
  staging: gpib: pc2 console messaging cleanup
  staging: gpib: tms9914 console messaging cleanup
  staging: gpib: tnt4882 console messaging cleanup

 .../gpib/agilent_82350b/agilent_82350b.c      | 118 ++---
 .../gpib/agilent_82350b/agilent_82350b.h      |   3 -
 .../gpib/agilent_82357a/agilent_82357a.c      | 359 ++++++---------
 drivers/staging/gpib/cb7210/cb7210.c          | 133 +++---
 drivers/staging/gpib/cec/cec_gpib.c           |  32 +-
 drivers/staging/gpib/common/gpib_os.c         | 127 ++----
 drivers/staging/gpib/common/iblib.c           | 109 ++---
 drivers/staging/gpib/eastwood/fluke_gpib.c    |  90 ++--
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 140 +++---
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  56 +--
 drivers/staging/gpib/hp_82335/hp82335.c       |  19 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      |  70 ++-
 drivers/staging/gpib/ines/ines_gpib.c         | 101 ++---
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        | 255 ++++-------
 drivers/staging/gpib/nec7210/nec7210.c        |  69 +--
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 425 ++++++++----------
 drivers/staging/gpib/pc2/pc2_gpib.c           |  51 ++-
 drivers/staging/gpib/tms9914/tms9914.c        |  33 +-
 drivers/staging/gpib/tnt4882/mite.c           |  17 -
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 186 +++-----
 20 files changed, 912 insertions(+), 1481 deletions(-)

-- 
2.48.1

