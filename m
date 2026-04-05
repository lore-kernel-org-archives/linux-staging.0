Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75A61DDC1D
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775404928; cv=none; b=EaERjvuU9Wqu5CJcqOODaD2rQkfDufvSdKs/mpqee6366RyPOdIw7wQBaoycUyXSHA89Zif6/BOKw25pwY+YkGHM6sOS4TQoVz1/8yxdNtzn6ufKqBPv1NdPrZBH9kMIZdQJqu8IPG3mGlTcCt5Sj5LUY81zzPXncj4fesD99zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775404928; c=relaxed/simple;
	bh=IuoPXDkIb9CwH/PZ9HjlfXiqRH6BuvGv50KwkuaGiM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F9ZexQnMdETGpvE6ESt4vyMzN0IjYq2+EHHqKpRXddK9Aq+zUbRfIO9MVaiJ7q3L+j+EXhe5uaQlh1Eg8Q5Jq/auAF9DIvG7Xr2OCkLkI/4mvBqy6RV6KxEiCNZmFvnhouj4Aof8al8/L1sGWyPYRzIKa3lsDf+zaZFGvBG4xgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IKWWUcof; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IKWWUcof"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fpcfF2b3hz9tcd;
	Sun,  5 Apr 2026 18:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775404917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/eZrnklGIb4F3oxzNuTwgYbQFMT+EmLP1lGg6QZU+rE=;
	b=IKWWUcofexRN9nKDY+I7oocuseiXgaigrm2a1Xa4XiVas7Pz5wt7Y8qU28GWIw6Ixd7hxw
	VQwBs3SzEdKhGoPRWMkv6qRumTJMdu+ErYEnRqUuLmnZvwLTHQijoGdVptGXIvW6eqz4fe
	VzMQPf53fxGGjKvhGHDNalqgshSkHbHKNeOed4m1voDbQqDWMhNKBklbiU3ez5VbRFzI3/
	hUWgFQ+pEEDFwX3Btgdh70PKEQmuaTSNCZ6I5eT/iRR/1kgH5KuMgdWdkNK+4+NUt+Dwyf
	0606ajOb8my4FeYX2U/MshsmZPOcYdg8AzpbGJIJBOVfyRW8RZSV1o/FmVzxwA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 0/3] staging: rtl8723bs: cleanup booleans and style
Date: Sun,  5 Apr 2026 19:01:32 +0300
Message-ID: <20260405160135.22291-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8f980a2866fb897bed7
X-MBO-RS-META: gf43bpki9cmm9du69gd5qzr3psa9u8ro

This series of patches cleans up the rtl8723bs driver code to improve
readability and alignment with the Linux kernel coding style. The
changes affect if-statements and while-loops, including:
 - Simplifying boolean comparisons by removing redundant ' == true',
   ' != true', and ' == false'.
 - Adding spaces around bitwise operators.
 - Removing redundant parentheses.
 - Wrapping logical operators to the previous line.
 
Changes are limited to 'if' and 'while' statements, where both logic
and style are cleaned up at once. No functional changes are intended.

Link: https://lore.kernel.org/linux-staging/20260402150429.14761-1-khomenkov@mailbox.org

v4:
 - Combined logic and style cleanups into single commits to
   avoid fragmented changes, as suggested by Dan Carpenter.

v3:
 - Split the commits into smaller parts, each focusing on a
   single directory.

v2:
 - Split the single patch into a two-patch series to separate 
   logical changes, as suggested by Luka Gejak.
 - Cleaned up additional boolean comparisons found using
   'git grep'.

Andrei Khomenkov (3):
  staging: rtl8723bs: core: cleanup booleans and style
  staging: rtl8723bs: hal: cleanup booleans and style
  staging: rtl8723bs: os_dep: cleanup booleans and style

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  4 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 54 ++++++------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 18 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 16 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 83 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 18 ++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 37 +++++----
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 10 +--
 drivers/staging/rtl8723bs/hal/hal_com.c       |  4 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  4 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  4 +-
 drivers/staging/rtl8723bs/hal/odm.c           | 13 ++-
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  2 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 32 ++++---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   | 14 ++--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  2 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  6 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 55 ++++++------
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  4 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  2 +-
 27 files changed, 202 insertions(+), 211 deletions(-)

-- 
2.53.0

