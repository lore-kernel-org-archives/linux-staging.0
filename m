Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4EA2D7D2E
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 23:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681117; cv=none; b=o20tw3Abwv4SNxP2COvjsyyWtVq0O2FGhGbsQRaIr/637tYwbDBoDn4yxnSKWuvVb2yV9QLIeaheGPLAp2qT+rZKztihsnK5+MpL0X4xQxclUckQ2REUshHWmJUJ22RaMgDiVMU4f7s3rzkAdfISdnzBnmkvrBdso9mXXHjG2KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681117; c=relaxed/simple;
	bh=Lcmp6PQChIC11YulEgmegEfpHXX4bo2RRsieqwb5WPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wqn3o+lFxlY3bamHGlLiMx7uE2xM+UWiiHJiD65mIhn9qAwY862L6heD/kNFPSiUOt7S8h0B2Zg+vFEzPiqW+bdTaeJylj4Ge/QaWcJdajm+jJYNKR8ZnE7ZMZ+l1tputhbplv1x3nkxTMfO2yTDRx1Tb+xAFM8eNBUDvLZqUAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6XgGeI0; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6XgGeI0"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so3202494a12.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 15:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770681116; x=1771285916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8IAzho2QMsIonUNkQ/TFfJip7sHsS70ES9uYr5ooYXA=;
        b=X6XgGeI0SZm1ajsE+S8oHKojN5maOmVpGMVQDkSsVPILkPNhUEPGSRpBc89tHiBZEM
         FlICFCBfUYoJUI0BKLJDJR/MiXuLd1WAiScotJfk/Wehz0kqFhPnPnGkJzaUGDI2SkRQ
         H8IgQMoHUnu+tjNoESjRxv6M9pXJTuVY6D+sLZhbh7MZmgFWQ0TivIerqj19mC2/vkvy
         BqDkwyvMeUvzGUtLNqwrlCg+vJcuMNObkmWhpM9IlHQlMHSoQrDcZAn5v8TyQSpLOgQ/
         Jn3vGLfPf5qRB6XqRK7ujyU6lafmUvhM4eVW8hUxjKX9/npQs9gDzhVJamJh8Tr5f8hY
         I/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770681116; x=1771285916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IAzho2QMsIonUNkQ/TFfJip7sHsS70ES9uYr5ooYXA=;
        b=e4xPR4LPdH9mkVU93GfCW5xIvSrI+hQZI+3y9xMMzX6sZGGFZl2wl111LD7M4un3kn
         MKAmhXDGX5e2QjA/jtp0CAEXgDCAEM7h7vOyg13rAQUnxJm8THYg3K3q7cGbJeU8vAjQ
         1oqkUXTEVsm5PmvQOLj13FICxmhxnXeQu60Bxoy3WFebKOqA/YtVN2a6/OFOTp6vwL6L
         YcDslAu3hg9Zoud70NHGt4vpckGz69aka1emPw8fx/L2A7dV16w6vWzfKsP0my7SMjTg
         vWxV7txtpvzkgxITw20I3jhl0oPBVOljyGz9p91Y+qKSjXrxjvdKTDMk3mMibxhvqftp
         5hUA==
X-Gm-Message-State: AOJu0YypGgC1HRGv8dN4bnqd5rVnPehsuzGOyymWCrMYjYLoEE759oTU
	HhH6OM7Ei1bulz3ihZdT0yxNY6UCA/5XYkADGO07kG9XWJ6oq64DoaJibWlOJtJD/94=
X-Gm-Gg: AZuq6aJizQgd6hVK+WHVIx7w8cHLmzzZBUL/J/4PYpv06nG1ZQNvHtvROtN7Gob2du3
	gmJ6Wq47bQF2VapOUzChNWSig08CqQDSMWWdcQ5jCrepOtFYh77bEcBW6mZI+1yoz6ajfQvTvYn
	cW4iMxkvQgzK6IxT/QGr6rfZeoJlPYcNbE5q65yL/vajd4LJIiFSJEYudaAsSGoEl8ISgOebvrN
	1SiS6pabf1FtKxRGTqu38TyCTva1tR1JF9FWkJ85qQoaOea97PHzDggJCH/LaoHkGi4SM10on3M
	UqdL1a3T4ZWwyF0L8B+tYqXvLb7YV0+gGbcLv/tWe3ow8k4QB0/QhyKLCTSpQD69EYtz+0zVwvE
	CmnzpVRwzGZSIY/oBpRv1eGCLRSE8k553lyeh63X+idI01mf0g7KYrKv7FChUIKj8wiCJ06EA/R
	Yjv02jke6RsaVsjntgNcfcAT6UJRg8mNGYJQ==
X-Received: by 2002:a17:90b:3d0d:b0:354:999f:1b27 with SMTP id 98e67ed59e1d1-35667d88ffbmr169878a91.31.1770681115897;
        Mon, 09 Feb 2026 15:51:55 -0800 (PST)
Received: from Horstaufmental ([159.192.34.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb64499fsm11581843a12.31.2026.02.09.15.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:51:55 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH 0/7] staging: rtl8723bs: remove unnecessary void pointer casts
Date: Tue, 10 Feb 2026 06:51:26 +0700
Message-ID: <20260209235133.1292161-1-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes redundant (void *) casts across rtl8723bs.

C automatically converts pointers to void *, so these casts are
unnecessary and add noise. Removing them improves readability and
follows kernel style guidelines.

No functional changes.

Siwanan Bungtong (7):
  staging: rtl8723bs: rtw_ap: remove unnecessary void * casts
  staging: rtl8723bs: rtw_efuse: remove unnecessary void * casts
  staging: rtl8723bs: rtw_ieee80211: remove unnecessary void * casts
  staging: rtl8723bs: rtw_mlme_ext: remove unnecessary void * casts
  staging: rtl8723bs: rtw_security: remove unnecessary void * casts
  staging: rtl8723bs: rtl8723b_hal_init: remove unnecessary void * casts
  staging: rtl8723bs: ioctl_cfg80211: remove unnecessary void * casts

 drivers/staging/rtl8723bs/core/rtw_ap.c        |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_efuse.c     |  6 +++---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 18 +++++++++---------
 drivers/staging/rtl8723bs/core/rtw_security.c  |  2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  |  4 ++--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 18 +++++++++---------
 7 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.52.0

