Received: from cvsmtppost26.nm.naver.com (cvsmtppost26.nm.naver.com [114.111.35.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6130A3939C2
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210842; cv=none; b=pUpaZfXvJMhrx/dMPk8m0xqnQ3nLPwIRhbFfuqODcQDdYQ0/zLlhmyRk4mste1yOcor56F4n9mBEGI/nYHybXqe6jhynOxwpiALHq8dDRuUdY8JeThtR/NixUa/1r+o3px+32tmEy9LB5tOW84kukB3qweZVnlLDmAXeqTSwVY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210842; c=relaxed/simple;
	bh=tidUkevLFVEkQaUCAzTADZbjOKoksBAm5WFxzLQshFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lIHI/SwMsXfb/zV6J+HFb8Jw4yFTKyb75czNDIUE7lk52aWlt8f5ud5K0KTN889/xe/Qtv80E1sUwXWnzPt9nzn+M4+eT9aDG/yMFz4f4UsAp6r3OJBHgAixJ/EpTAUJK+5jVFrwsug6MJg3scbOR+E+LXxeXX2R2QyoFupQpG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=ckGkyt3z; arc=none smtp.client-ip=114.111.35.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="ckGkyt3z"
Received: from cvsendbo021.nm ([10.112.18.58])
  by cvsmtppost26.nm.naver.com with ESMTP id fYTn8IlOTHGkiZUcDyRgUQ
  for <linux-staging@lists.linux.dev>;
  Wed, 04 Feb 2026 13:13:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770210834; bh=tidUkevLFVEkQaUCAzTADZbjOKoksBAm5WFxzLQshFk=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=ckGkyt3z7cEAI2xhYSFjDv7vifd+l9M5bV3rAgerNPffFY5nhGcYnrQ0MfdUiPb3V
	 0Nj3vWk6BmaTgWXhbG56zD8N0LnjsNfvtnEERBXdwqhDSZc5jHExT8SK8SIlCuFInQ
	 NbnIT+owKNzNdDejRKMygAuCokpvMVJlxkEAcvlqIRpe1Uzj/UcHgVQoXQJo2pjZN9
	 +HjIR9we1FJmGyYtVB2zN79kY2MEvmPHEwVF/VWfyr4yOzufK44c01K3CIuPX00v3b
	 MqsjtjG5zoKnanLp2YTeAS1d53cmfd4RQRZML6fFAiND+pY9diXfY3okNhb6ThWf0J
	 XsJHIfU91PcRQ==
X-Session-ID: 9rygvBhGQVeYgMoU5+1X1w
X-Works-Send-Opt: M/YXjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: XqnXKxgXFqJZ+HmqKqt/+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp008.nm.naver.com with ESMTP id 9rygvBhGQVeYgMoU5+1X1w
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 04 Feb 2026 13:13:53 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org,
	andy@kernel.org
Cc: dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v6 0/5] staging: rtl8723bs: replace custom wrappers with kernel APIs
Date: Wed,  4 Feb 2026 22:13:42 +0900
Message-ID: <20260204131347.3515949-1-s9430939@naver.com>
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

About GFP Flags:
- GFP_ATOMIC is used for allocations in atomic contexts such as
  spinlock-protected sections, tasklets, and timer handlers.
- GFP_KERNEL is used for process contexts where sleeping is allowed.

I would like to thank Andy Shevchenko
for the continuous reviews and the time spent on my patches.

Changes in v6:
(suggested by Andy Shevchenko)
- Add standard for selecting the GFP flag in Cover-Letter
- Patch 1: Removed unnecessary curly braces in OnAssocReq() and comment
  about GFP Flag.
- Patch 3: Converted a remaining 'return -1' to '-ENOMEM' in
  cfg80211_rtw_add_key()
- Collected Reviewed-by tags from Andy Shevchenko for patches 2, 3, 4, and 5.

Changes in v5:
(suggested by Andy Shevchenko)
- Completely restructured the patch series.
- Use kmemdup() where applicable (replacing kmalloc + memcpy patterns).
- Used kzalloc() for allocations followed by manual zero-initialization.
- Used array_size() and size_add() for overflow-safe allocations.
- Updated error return codes from -1 to -ENOMEM where appropriate.

Changes in v4:
(suggested by Andy Shevchenko)
- Use kmemdup() where applicable.
- Use array_size(), size_add() for overflow safe allocations.
- Use sizeof(*ptr) instead of sizeof(struct val) for
  better maintainability.

Changes in v3:
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
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 45 +++++-----
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  4 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  3 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  8 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    | 11 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 28 +++----
 .../staging/rtl8723bs/include/osdep_service.h | 11 ---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 29 +++----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 .../staging/rtl8723bs/os_dep/osdep_service.c  | 40 +--------
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  5 +-
 16 files changed, 123 insertions(+), 187 deletions(-)

-- 
2.43.0

