Received: from mvsmtppost02.nm.naver.com (mvsmtppost02.nm.naver.com [61.247.196.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC432261B96
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 07:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.247.196.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188735; cv=none; b=JoylULjdI2Mut2rwJgAAUe/X4iW4IBujXoeU1imIdAGlVSADjhd3iG8AAVYeFvUggE/um9S36fGMNJFf5fgGEVp54UnDoa7CJ5yF3AJQVIx/bFIJCs9QFEDEI4+rQbPAPItgnadVjMLAotDC2j5uPfzgBAsEP8tbd0qFS6EP48k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188735; c=relaxed/simple;
	bh=JLPZ52MemnD1zo2asQcvtTcs+FlkVHPv+dOQNcVuZW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkuxRpnyH6dkTXLdaMh7paqfg869KAHpKdj1aGhjGVS5tj6nxP6urx3ovtZ33wH/xDQRaTiU1twEXAnWDgo3H68JYfu80trfi+XZRxa5ABOhMjl+KSuk5DcgfdO81lYomeXF4FMMW8l1ZLz/Aqe/GpGoZQyzYvNixNN77P+vUoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=KFus0Flh; arc=none smtp.client-ip=61.247.196.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="KFus0Flh"
Received: from cvsendbo036.nm ([10.112.24.44])
  by mvsmtppost02.nm.naver.com with ESMTP id eG7c+4RRTsmg4UmCgntTmg
  for <linux-staging@lists.linux.dev>;
  Wed, 04 Feb 2026 06:45:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770187518; bh=JLPZ52MemnD1zo2asQcvtTcs+FlkVHPv+dOQNcVuZW0=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=KFus0Flh82/w0BXMdBb64OMnSh4ihFGIrTjIJV6horWLQzrLN2CWhAj/p4GDE0Yv2
	 tGK5lC3WJyDSBtWg9Y3qlgGmXdEZHcATpXuh/QCJSSN6TYcZeX++itGYqSE4Jgswuq
	 hyxb2khA9vej1HTj623F0t8nO0pVptI5qn8G31hlXgM99pPVSQloZGShpRn63qj5Av
	 P+Ec/S/io/+U/jJBDz4+ra+IkzGphfTtnnevpYIK9caCAkkitkYugermlezgt2T19N
	 MVtmogH/fuDvla1+kkiAegcupveP+fur0yspIBWSmVVDNbI9raZPPchh4ysqtN5PSI
	 uLmOijX9DSdEg==
X-Session-ID: JC5+Px8VR8SUcRlQTeN23w
X-Works-Send-Opt: M/YXjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: 9Zn9KxgXFqJZ+HmXKxu9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp001.nm.naver.com with ESMTP id JC5+Px8VR8SUcRlQTeN23w
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 04 Feb 2026 06:45:17 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v5 0/5] staging: rtl8723bs: replace custom wrappers with kernel APIs 
Date: Wed,  4 Feb 2026 15:44:49 +0900
Message-ID: <20260204064455.1379342-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces redundant custom wrapper functions (rtw_malloc(),
rtw_zmalloc(), rtw_skb_alloc(), etc.) with standard kernel APIs (kmalloc(),
kzalloc(), kmemdup(), skb_copy(), __dev_alloc_skb()).

The original wrappers relied on an internal in_interrupt() check to
select GFP flags. I have analyzed all call sites and replaced them with
explicit GFP_KERNEL or GFP_ATOMIC flags based on the context.

Changes in v5:
(suggested by Andy Shevchenko)
- Completely restructured the patch series.
- Use kmemdup() where applicable (replacing kmalloc + memcpy patterns).
- Used kzalloc() for allocations followed by manual zero-initialization.
- Used array_size() and size_add() for overflow-safe allocations.
- Updated error return codes from -1 to -ENOMEM where appropriate.

Changes in v4
(suggested by Andy Shevchenko)
- Use kmemdup() where applicable.
- Use array_size(), size_add() for overflow safe allocations.
- Use sizeof(*ptr) instead of sizeof(struct val) for
  better maintainability.

Changes in v3
- I have analyzed each call site to apply the appropriate GFP flags
  based on the execution context.

- Improved the logical separation of patches to maintain git bisect

- Removed redundant definitions and unused macros (e.g., rtw_skb_alloc_f)
  in the final cleanup patch.

Minu Jin (5):
  staging: rtl8723bs: introduce kmemdup() where applicable
  staging: rtl8723bs: replace rtw_malloc() with kmalloc()
  staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()
  staging: rtl8723bs: use standard skb allocation APIs
  staging: rtl8723bs: remove unused allocation wrapper functions

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 22 ++---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 83 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 13 ++-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 41 +++++----
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  4 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  3 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  8 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    | 11 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 28 +++----
 .../staging/rtl8723bs/include/osdep_service.h | 11 ---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 27 +++---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 .../staging/rtl8723bs/os_dep/osdep_service.c  | 40 +--------
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  5 +-
 16 files changed, 120 insertions(+), 184 deletions(-)

-- 
2.43.0

