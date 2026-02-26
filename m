Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A9B396D0C
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100268; cv=none; b=ByqqvC/HiElOyHlmzdYj1+qx9wrbhE2kTduqNCDA2abOMw+VUN6KSgn1wzycMwYlGCWL+2T/Ksn9RhnyXNIFSJEAXsUfRh/1m7HyXdouIYHbuMxpvENAJ2YOGV5yxAbjeQmnKqUXMCGjhXIrNTDnyVl53f95joUHUXUmmJbbf6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100268; c=relaxed/simple;
	bh=O7oXweegiPUiporNi/3gCfotw3jUdPqMelJ3TWc1bKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WaosbGTgsPdU/Kj9gHK3hsqm+mNfdU/CIAP+lOFn0/vXA5cJ/o0B0JkpjgDNN9lG/QfmAY5OUIyEmRQehOubfyCwUP1tc9UZVmD7a4Tzen5WYGYlpk1wi2pfhvxN7p9Z7eX1jPuX+Arzcqe/68ANhKOW6TKDvmn8t0KLFJnAvKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkAOLuVS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkAOLuVS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43995fdfeceso23780f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100264; x=1772705064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+LWHv2PenTEv3EWFLjqjFQwrrE/JlVM1JwcjP/GpyJ4=;
        b=RkAOLuVSAAHNIJIFqBUhX7QwsYDtE/Agj4dmtv15E1FG2V4qKufax8/t51iwZ9RNTQ
         wlkKmomP9N/RADYvtfyo9f12BsH79aZopv5YT0IhOUmh6bKh8rpcg4hSwB2ZWsk0prnR
         l8dUisxrNeMl8KUchTB48OgwlBNMmM5tlKOwNuz4Di7nM0YPOc74u8L170LmxkxOUn1W
         F2BqefK0kXIh0ms606X6Urok2ruLf3bi9PrFbEaW5fEqrSsNR3gYm/m2Yc/BJ2ARcH5G
         CAUUfRlm/kJalXbYSxrNE+wWdBhbO9r/D6KVLzTbv6USjdbDPFWm4LdPlfGHa25yGEw+
         HECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100264; x=1772705064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LWHv2PenTEv3EWFLjqjFQwrrE/JlVM1JwcjP/GpyJ4=;
        b=Q5enmT0ROgHW0F+ihSY3+Q/7TF9bhSMJ3CJJwrnqqblgEUf0ja1E+0Cah7vXfcfmYk
         uV9m/B/U+51GKQ3moRGkeKX7pVpoUEqqL0KQA8+RPWtemj8NWvFkdOUawDCTmfe7gHuW
         DfGhucBOmPA/oKIbWyQ+6dxMb+ynmr960VQJLZA8K7bbJvvx0fH/BytSPjvX5KOPHHwy
         lMPFuKfsQG3XcYd82JC2JifqALD8lc7B7Xe4t3mnfgNX/9y0HwA5VrgBlszchgOqYhzf
         pegF2OdVxfvdlJ17bQNYoxKFGiSYGSPL+uwetre17DHTi8uJ+CIWGuHS2+YGQboQjVJ0
         IAOQ==
X-Gm-Message-State: AOJu0YwYfG3s8978tfN1A8JIPR/Me7JmyNDuKtBT7sbiT8JzTJEhW9PA
	fkJC+6C4Gf0wKDv0zJU2C6LLXx/xQlI54IrtSfTze+J2WMBHnybL218JjlzFOebayh0=
X-Gm-Gg: ATEYQzxjn/WMHc2ZVLJQtTHVF2YqfKWf+JhoJnxR70K3DRTDAftG5zl3268tdKKA6GH
	JsdQq3OrucyLnZEsds7KVuDobFprch/EYh25ffeUEcCPmH03/gaXAk5RN/WJLmBzAawKjC3pG7H
	0DeBlZrc4Bi1nmUYu/yC81l4is3XgW30/tAHC/uWaprHH7gfaejj/REKWBXlp8P/AnikS40oNfI
	CO6sdfZnnPVlEJWBqtpJgYoBL/7y6yDcGQJJps6S5GbTH5mSjud7LxAF1ys65t5pr6YEwbvH1AQ
	9xqic1obl9BHdQ5XU7QWsOmOZdA20ZdxQc+dcU2M/rGiu0eQI1OFiy1m/jC/0Eqv1YK0g8fkrEX
	ikFqpaZJmsZh/7jPxtO8RCqOW3N7SBWYSWuVPrpkBOHmMAR4Xp8+pKUgBgMzNoSGAD5OnSFZ1o8
	eAtdlHWlyxakdK7EZHNDLqCWwnHoSbsnzxy7vG9rpR5TOfJof6Of8rdSpTZ0eZcWaBz9kgF2Fb1
	5iOYH7pgMVNBu2wmyT/Q919wQ2h0CUmHod6zJHqcJQROL9n3HAB
X-Received: by 2002:a5d:5d86:0:b0:439:8c42:8ab5 with SMTP id ffacd0b85a97d-4398c428c1fmr7779169f8f.8.1772100263553;
        Thu, 26 Feb 2026 02:04:23 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:23 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 00/12] staging: rtl8723bs: remove unnecessary pointer casts
Date: Thu, 26 Feb 2026 14:02:44 +0400
Message-ID: <20260226100255.167059-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unnecessary pointer casts in memset(), memcpy(),
and memcmp() calls throughout the rtl8723bs driver. These functions
accept void * arguments, making explicit casts redundant.

All changes were verified by comparing objdump -d output before and
after, confirming identical object code (except for one embedded
debug line number shift in rtw_mlme_ext.c).

Found using Coccinelle semantic patching.

Giorgi Tchankvetadze (12):
  staging: rtl8723bs: remove unnecessary casts in rtw_ap.c
  staging: rtl8723bs: remove unnecessary casts in rtw_ieee80211.c
  staging: rtl8723bs: remove unnecessary casts in rtw_mlme.c
  staging: rtl8723bs: remove unnecessary casts in rtw_mlme_ext.c
  staging: rtl8723bs: remove unnecessary casts in rtw_recv.c
  staging: rtl8723bs: remove unnecessary casts in rtw_security.c
  staging: rtl8723bs: remove unnecessary casts in rtw_sta_mgt.c
  staging: rtl8723bs: remove unnecessary casts in rtw_wlan_util.c
  staging: rtl8723bs: remove unnecessary casts in rtw_xmit.c
  staging: rtl8723bs: remove unnecessary casts in rtl8723b_cmd.c
  staging: rtl8723bs: remove unnecessary casts in rtl8723b_hal_init.c
  staging: rtl8723bs: remove unnecessary casts in ioctl_cfg80211.c

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  8 ++--
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  8 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 26 ++++++-----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 40 ++++++++--------
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  4 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  6 +--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  6 ++-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 46 ++++++++++---------
 12 files changed, 82 insertions(+), 70 deletions(-)

-- 
2.52.0

