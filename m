Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAC822F755
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 18:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156603; cv=none; b=Mu3JIHOd/bv0uiMcOm9ROoa3dk6HexOHrI5e0+5CtqgV8a907/0cafy4QafHecXB5iSUx1Qjl8PBTWinH1st7acr8uoN44bMAx8uMsF4Bs8L3mNYkZn8Bt/uZvBj0o/2tB+CU93w13pfTL8dsqIWwA3ZdzaDL8g0nqysYR6cH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156603; c=relaxed/simple;
	bh=0EQK9jLamOF13CERV6haWtMUIM4LeAUJQFEfTy/tAlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNcvgrpzATPpmL0eYZ/HvW5hCzadfQBMxha+9051O5Py3yLo7h6ax7wqqLv3QtWy6DaGyHIc5/I0RpZRS+ZP3l812AAKZBrovS7K9pJINgZJHz97lGtFzXpXXdJ+18rzn2uF06Lge/26aZ8AAJTbpkm8gPKSp0O6WsWpfFyBBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGntAx3T; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGntAx3T"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a2ea96930cso38015765ad.2
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 10:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156601; x=1768761401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lS0zbOZv+WuMYu3IdEy0i+Z+X9k9XgXA7rQQ70YNshE=;
        b=TGntAx3T0kGF3BqCUChWW+ihgi/k/3cz3DrLjY50Dyqj2Pe2vcB/ZoP18Dpu7Ys50s
         OoVsD4bcJ+nESXrbDAM8wtLZ/oNA3sjOyZsVfmPYWgG+u/jhtNuOvWIUzWCLaIJjAVr0
         NZ3dDbeNYo7R8p/5NtAg5AGDyNNaHPSyXOOmzR7R7I0ttVKtTRN0wsUE5C/mCXRI40Fd
         5Sa+qT6BUP+c8Hx1X/UZlFc43wswlwO+IbErilrtQU/3++OP/t2m+9K5c8uxto68bqEi
         ztQm0vsJvzMCibHFPK/jFG8bNAgmpVtrC1FWZRsUtkGjBDOG9wOHjPnH0fiQTkmhaoyf
         iyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156601; x=1768761401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lS0zbOZv+WuMYu3IdEy0i+Z+X9k9XgXA7rQQ70YNshE=;
        b=YAxwafQT2A2FIPsaFTK33xYTMGq431ax0PWn6v8qzhAaaBF3R0eyjV7h41DH0djEvv
         c6o6RG/RvEdjhVbkCseOD/VrmujR/RaLjPtAL1i4JAqtWi/TC5E0V5CucLfRnJvw9fFK
         lbbPITDDw+8tN8Zgu0Avc37TXJGLrDOqSB0odo5t1YlcGbvDqsxeeSpWcKX8bTj0DDd9
         bFDqdus66y30cq3SDKcdR863ylEdqdc1h/hyU5mr8H3mLXfiyc2F+AEp/w65869I2A/c
         k0Vk4b4eVwsTauQX3ouf3ScTe5frVHYP7A+HDxkNzGOXHCUJZMVhLjk+R7CVh1OX6Jm5
         e74A==
X-Forwarded-Encrypted: i=1; AJvYcCVDBzRPT3lXhcdYOObZiDVgEpuqnLyOJsq9kSBlPoKsPMU5BnbhhgiUUdA5b1zwNeyn8F2hC9YWK891iuXx@lists.linux.dev
X-Gm-Message-State: AOJu0YyyycM335uiOg+eAGVIOW9znUjq7l3nqiyQbqcjfJ9SZ3Uz98V6
	JXVKAjo9KQ7NeOdqQYCLEFyzL/jiKlocyjH7gulzIrQuwPQtcnxo5sxZ
X-Gm-Gg: AY/fxX7mZ/lQnT8xuFSddZCZ6jZ2SZccNzEcoyDsOaMZTWsCLTGZqiIMzR/He4IVVj2
	baVWL7UXAtxoSrrGKQOuU0+Q4HXMbx2dWvWfnB8DsFrLzKW7q5hi1GDvvKHnXTctv8bhuOd5btL
	wehtKbwpZAVt/aSZZekpqnHHJWkXBODj77IidLqF2icsmhaO+ADspFVFK9shdLzf7gWjKhz6Ge3
	IBj6S3DhZ5jLFBI31oAKcio8GQEeJUw4vSnn1vFY0MNcS+bGTeFKdL6P5IicRmMmiPZfEJeJ6wc
	pkunw2JnMXpade9IlaEjZ+Yx8I/Gn0UuloMDsgqyK0Fix92CNNob6aacJ/Z92gJcjRKUAfpYO0M
	2beJ4f6Ae00kJyo/VLZqDg/cMthZaw5TdEKtPletSllaWXRaSyvR8ZuFSiF2mhoUl8GIthi9lTD
	w4DxjLp2I0Q4a4cjkv3Rmy6Q1O
X-Google-Smtp-Source: AGHT+IGvQ8aAI410un9LtC6Hr31UVdhUU9wrOyk8wpHeyjAm9bECJaWhuBkEj21x4dJFIt2dgyp/vw==
X-Received: by 2002:a17:903:1104:b0:297:d45b:6d97 with SMTP id d9443c01a7336-2a3ee47d2b6mr129068505ad.14.1768156601034;
        Sun, 11 Jan 2026 10:36:41 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152220415ad.86.2026.01.11.10.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 10:36:40 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 0/9] staging: rtl8723bs: coding style and refactoring cleanups
Date: Mon, 12 Jan 2026 00:06:21 +0530
Message-ID: <20260111183630.12816-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series refactors the rtl8723bs driver,
focusing on rtw_xmit.c and addressing most of the
checkpatch.pl warnings.

---
Khushal Chitturi (9):
  staging: rtl8723bs: fix operator and type cast spacing
  staging: rtl8723bs: remove empty branches
  staging: rtl8723bs: simplify boolean expressions
  staging: rtl8723bs: replace msleep with usleep_range in rtw_xmit.c
  staging: rtl8723bs: split chained assignments
  staging: rtl8723bs: rename struct members to snake_case
  staging: rtl8723bs: rename local variables to snake_case
  staging: rtl8723bs: replace N_BYTE_ALIGMENT with PTR_ALIGN
  staging: rtl8723bs: fix line length and alignment issues

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  26 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  66 ++--
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  16 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  48 +--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 106 +++---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   4 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  34 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  38 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |   2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 338 ++++++++++--------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   8 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       |   2 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  32 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |   2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |   2 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   2 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   6 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  16 +-
 .../staging/rtl8723bs/include/rtw_security.h  |  36 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |   2 +-
 drivers/staging/rtl8723bs/include/sta_info.h  |   2 +-
 drivers/staging/rtl8723bs/include/wifi.h      |  30 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 176 ++++-----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  18 +-
 25 files changed, 526 insertions(+), 488 deletions(-)

-- 
2.52.0

