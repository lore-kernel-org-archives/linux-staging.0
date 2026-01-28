Received: from cvsmtppost22.nm.naver.com (cvsmtppost22.nm.naver.com [114.111.35.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D24D24E4C3
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609413; cv=none; b=P1GNSdYC9xg9b2SbS9C/ggq359DDby21m+KZE98Z4Q2JQecMH2I5S6M3xc68WXkVMkfkFlgwceH2P5DsYmIA7sjGxTCTtc17DvXwKO/xPKI6CV+RXi0Z4wMCWWFiUiZAEbVCbcV15L6iVTRlwdTwyquM1fWbaYA/NlimXUxICOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609413; c=relaxed/simple;
	bh=HVtBFC68xJvB167berwMWQgvzHKrkQeT+A4Ew6hAFOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOT8AMyNOqJ2aBAekROvslGHxGeKljr9TjDAb4QfMUKJ+wdthGUcYyvW+dcYSwWOynAp8vSujRyKZeDGQIuRE44ffoAcUY1r795/AMhU6K1O7FOlaFJ0+h3EPJ7ZahLLys1vFc4nelUkGyzKsuSme98VzbaE79Sv9CZ0IW+EziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=ZXni9dLq; arc=none smtp.client-ip=114.111.35.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="ZXni9dLq"
Received: from mvsendbo25.nm ([10.179.34.214])
  by cvsmtppost22.nm.naver.com with ESMTP id qhgyc25LQ4mQbA3WIE0TQA
  for <linux-staging@lists.linux.dev>;
  Wed, 28 Jan 2026 14:10:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769609401; bh=HVtBFC68xJvB167berwMWQgvzHKrkQeT+A4Ew6hAFOM=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=ZXni9dLq2B9IGa1RWrD981aDO6RRi9+r83o2ocoWwHXFm3AqE+r/MZNN4Zzcmi2/U
	 BFXkUF/Ch52FXQbdwRxDJKezken9XrEGYQtQ14V/ruClfHT0fRYwiM+kU+RSfFVcHh
	 3GlqNRoHKmbCfwfbSbs9nJwoGa228zZFMpJhu7JubqhreG7Bk1Wy6pLDxS3gVmPc3J
	 uIHI/iEvzMjDzXKXH12UJbYCxOOpwfrKwAavLosSQ90eCDniI8TnMIw+2xFxX1UwpQ
	 fKZpbYL9tYwX2sQmhxjdbeSNshN9NnDGZ+vTmubp6J0q5hXwF1ApKTThyt9ZV0vRHx
	 X4ljZBXkviWJg==
X-Session-ID: btAXfQsRTEG7We4pTQ7kZA
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: AmYXFxvrFqJZ+HmmKAgX+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp004.nm.naver.com with ESMTP id btAXfQsRTEG7We4pTQ7kZA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 28 Jan 2026 14:10:00 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	andy@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v3 0/4] staging: rtl8723bs: remove memory allocation wrappers
Date: Wed, 28 Jan 2026 23:09:50 +0900
Message-ID: <20260128140954.1065382-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces wrapper functions in the rtl8723bs driver
with standard kernel APIs (kmalloc, kzalloc, and skb functions).

The original wrappers relied on in_interrupt() check to decide between
GFP_ATOMIC and GFP_KERNEL.
So, I have analyzed each call site to apply the appropriate GFP flags
based on the execution context.

Specifically, I used:
- GFP_ATOMIC: For data paths, tasklets, timer handlers, spinlock, and
  functions called within atomic contexts.

- GFP_KERNEL: For driver initialization (init/probe), configuration
  setups, and process contexts where sleeping is allowed

I would appreciate a review to ensure that these flags were correctly
identified for each context.

Changes in v3:
- I have analyzed each call site to apply the appropriate GFP flags
  based on the execution context.

- Improved the logical separation of patches to maintain git bisect

- Removed redundant definitions and unused macros (e.g., rtw_skb_alloc_f)
  in the final cleanup patch.

Minu Jin (4):
  staging: rtl8723bs: Replace _rtw_malloc with kmalloc
  staging: rtl8723bs: replace rtw_zmalloc with kzalloc
  staging: rtl8723bs: replace skb allocation wrappers and fix build
  staging: rtl8723bs: remove unused allocation wrapper functions

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 12 +--
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 80 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 12 +--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 40 +++++-----
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  4 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  6 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  8 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 18 ++---
 .../staging/rtl8723bs/include/osdep_service.h | 11 ---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 18 ++---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 .../staging/rtl8723bs/os_dep/osdep_service.c  | 29 +------
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  4 +-
 16 files changed, 108 insertions(+), 144 deletions(-)

-- 
2.43.0

