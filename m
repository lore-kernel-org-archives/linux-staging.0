Received: from cvsmtppost21.nm.naver.com (cvsmtppost21.nm.naver.com [114.111.35.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD3836AB5D
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769888425; cv=none; b=p23uMadFTtQHslLKAFpQaSGFpM1/40t1jCQjyysSoR+caIFO7Lmgsr0BoNLg2hfimTAJbkUkV5ilYDNv0gC297sOEJyhmGlYlpjHpQBvaLrhpF+tG1KftyOaQhS2PMFl4jWRhJAyM12QyLh9WA5kKwhWoc9HEM+ew/unUUGf7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769888425; c=relaxed/simple;
	bh=wA8dyFgtW8lHrhEt1RJrUA4vN/YT+vyt0Sl13aAZBQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1UnlQQ+SmYlOOCKKvQoUWhNAyfU3NcBhstckcbYZyHwzgjzit6lX51Z8Z9yuwNmmceyHV/OrSE6Tf6zzwYl6567fist5EcEGa2J7Htdvk0TY7UHSYYMAYAf3cm9ZSjzjGFRjroZt1X0Xbe3nNP+Yw7PIi98L9GJkYaDXSABC94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=vcSJ4ZFW; arc=none smtp.client-ip=114.111.35.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="vcSJ4ZFW"
Received: from cvsendbo001.nm ([10.112.18.53])
  by cvsmtppost21.nm.naver.com with ESMTP id FslPElULSZKVf2MZDD-xXg
  for <linux-staging@lists.linux.dev>;
  Sat, 31 Jan 2026 19:30:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769887807; bh=wA8dyFgtW8lHrhEt1RJrUA4vN/YT+vyt0Sl13aAZBQI=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=vcSJ4ZFW3njMnHqduH9XjachPxvAiwdnYf6qP6bssK7uc2C+FvwKQ4Lu9kCsFDPxC
	 o4Fpq13RTneFPWMlN4Ms0HZF8/wHTebHB6r8PGjNIlvvq0s+F6lFQGMQ7sv/ILrKB6
	 XTIvVzaBtzhjG8O6GjeJk0m94OWjRZyzkSTsGMmX/u5FROGjvyVl2gMujEc4DAD55c
	 /VdN34FjqObEFh876x4oCtJM4nxhEPE6L/O+lQ2mBcsLGnxShPlPz/T37mUJdZEC60
	 0v27SDg0v33LEoaZanYPep5jls/Jq/ShTPRAn/aCPr41x7qBVuwNnGzTbYSmM4tmbZ
	 3WXSHTwLXK43w==
X-Session-ID: TL9-JDwvSLOA8WmB-aRF3A
X-Works-Send-Opt: M/YXjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: uqK9aAvrFqJZ+HmXKAt9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp011.nm.naver.com with ESMTP id TL9-JDwvSLOA8WmB-aRF3A
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 31 Jan 2026 19:30:07 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	andy@kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v4 0/4] remove memory allocation wrappers
Date: Sun,  1 Feb 2026 04:29:57 +0900
Message-ID: <20260131193001.303307-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace redundant wrapper functions with kernel APIs
kmalloc(), kzalloc(), skb_copy() and __dev_alloc_skb().

The original wrappers relied on in_interrupt() check to decide between
GFP_ATOMIC and GFP_KERNEL.
So, I have analyzed call sites to apply the appropriate GFP flag based
on the context.

- GFP_ATOMIC: For data paths, tasklets, timer handlers, spinlock, and
  functions called within atomic contexts.

- GFP_KERNEL: For driver initialization (init/probe), configuration
  setups, and process contexts where sleeping is allowed.

I would appreciate a review to ensure that these flags were correctly
identified for each context.

About the usage of kmemdup():
        while Andy suggested a fallback to kmalloc() when the source is
        NULL, I chose to skip allocation in those cases. This is to
        maintain consistency with original logic, which only performed
        copy when the source data was valid.

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

Minu Jin (4):
  staging: rtl8723bs: replace rtw_malloc() with kmalloc()
  staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()
  staging: rtl8723bs: replace skb allocation, copy wrappers
  staging: rtl8723bs: remove unused allocation wrapper functions

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 20 ++---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 83 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 12 +--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 41 +++++----
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  4 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  3 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  8 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  8 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 18 ++--
 .../staging/rtl8723bs/include/osdep_service.h | 11 ---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 23 ++---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 .../staging/rtl8723bs/os_dep/osdep_service.c  | 30 +------
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  4 +-
 16 files changed, 113 insertions(+), 160 deletions(-)

-- 
2.43.0

