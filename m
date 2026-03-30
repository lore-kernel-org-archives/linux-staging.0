Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED3377031
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896426; cv=none; b=qX+VF6btjHt3JHpPjR/p00rPA9QGcBxg5uJmt2vjf6BcyZIwjWKClfuA+gD93A1AVtxGf5Zn6nl7/CU9bZekhwD3k75M4i++UlEap0u+9hRso6zts1t1YWnX3Ko9yzZfr5cqPBftrTq8xfLiiX93SjyDbmzfwZAc5Z1LETkdeIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896426; c=relaxed/simple;
	bh=IEH7ER0XCW1DeemallDjZWDcB68/uqLF+pMG88ec5nE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hGX3gRApsn9bEGJvHf33bKLCRse/8eeFTB43vdRzgwBKss14G9MBeg8xMIaoUMLIsHN60u8z22qQyVmZgWBf6pGGWADBMwIwU/TTX8uodBNlq3nCmlnCS3K54eNgiK1ftqXNCYoM2O/fdfqbyZfP9hktFspnOqph9J8kJb9npP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TXiWH+Lw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=L2i5pC3K; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TXiWH+Lw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="L2i5pC3K"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fl0bQ3rggz9tvR;
	Mon, 30 Mar 2026 20:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774896418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s0sO6fUGo44tt3aDjA158yqC/5aMZ9WECKO9l+zcu/o=;
	b=TXiWH+LwHXHLUkGTwfozO58PwO19fur+JF2Yh/6YMgfd4cio8nocL/vlfi8EFKt96nJMkW
	lRkA2YdWIvMFYnhBt0Yv/OmK+BiTYEIlWSYHBYK0IQB0S6MgnIvooXF794+1MVks2Uk/8+
	yBeXU/HkcRNUkRIpAYOzJvk5npmULZfwiD1wfBnKLzvdCxaLpHgGqNjq7dAlC6zb1+E/ZU
	c2ZUJyO6QXDpL1lXFRK4grmSRefiiYYMMof6gzSSYxl45atUYjEN24rpKP+pqI8wskfdQl
	cVlDjtwLvJOZc7hZM1zCscqdN/HEryYZ7nYSuO4IK7ojqbahoWFZVILRahC08A==
From: Andrei Khomenkov <khomenkov@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774896416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s0sO6fUGo44tt3aDjA158yqC/5aMZ9WECKO9l+zcu/o=;
	b=L2i5pC3KpPZABSUzEgzUapZiVUVDZa/G8miJbJiomerCNeTAgRk8Uy8i14dgoqBcH3N+NP
	CKbmyqFHPZu7BQqGNXAVEdZuTQxFug4pU8R1DBcg++urx9RCh5V3aRUnoGZHJ1Q/vg/lkC
	pyO6YdM1XcFiLQdoe6eLHuZrhR7pnC46DPN946aJvNmixk/5F3tQ/8OdlmBJ9y7g3dMncF
	X6cyE6YtwvTHwpgyizY7BlR2OrNv5UMgKiyM3bF18CoWw4c1lc0n+hNw2feVF4k3r+ig5u
	ztvfAzeUp1Ew0qnIFV5LQIj3MQCayuvjtfLc7i92SsDbDVLGBk9KhTH/pLlsbg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/2] staging: rtl8723bs: cleanup code and style
Date: Mon, 30 Mar 2026 21:46:37 +0300
Message-ID: <20260330184640.17795-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: k3h4h4nbpn6wk9msnci7rkqpzzrx7hx1
X-MBO-RS-ID: 7866e19cbeb3d77faed

This series of patches cleans up the rtl8723bs driver code to improve
readability and better align with the Linux kernel coding style.
The first patch simplifies boolean comparisons, while the second one
performs general code cleanup.

Link: https://lore.kernel.org/linux-staging/20260325110143.35466-1-khomenkov@mailbox.org/

v2:
 - Split the single patch into a two-patch series to separate 
   logical changes, as suggested by Luka Gejak.
 - Cleaned up additional boolean comparisons found using 'git grep'.

Andrei Khomenkov (2):
  staging: rtl8723bs: simplify boolean comparisons
  staging: rtl8723bs: cleanup code style and parentheses

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  4 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 50 ++++++-------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 18 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 16 ++---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 72 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 18 ++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 37 +++++-----
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 10 +--
 drivers/staging/rtl8723bs/hal/hal_com.c       |  4 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  4 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  4 +-
 drivers/staging/rtl8723bs/hal/odm.c           |  8 +--
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  2 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 32 ++++-----
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   | 10 +--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 ++--
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  2 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  6 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  6 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 51 ++++++-------
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  4 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 13 ++--
 26 files changed, 194 insertions(+), 198 deletions(-)

-- 
2.53.0

