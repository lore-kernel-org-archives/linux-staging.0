Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC73502B8
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 22:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776808891; cv=none; b=bJH+gcbj9KY6nrXQOiuSJbaXzp9O88QIgf3Hn2KxxlZUwIVoUXtALphVqKM4gfs4RKftdMkKzko9FvuUS2lzLhNkSkp1mOa9O/ueQXXphfguIumAg6a4BkvcFIzllUXZpl/iWI0XZTPJjsDdC3yyDr2gGjfZgHwYTc4TfIwktts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776808891; c=relaxed/simple;
	bh=UrbOo5yABaeQ7YCc0g3myhOIyJtYTqN9Ib6F2ZzL4ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ausFe+YlZ/y9eSAQ92rlGEojyouHn7R33/bTeMX2WwHUvjCIi3vKUXkbm3Nw8k3VpG+pv7YDCNCVrqwfle5XaYLNB7uQLaEUxHkUXyPY3jElW/EXeqaXBVkTbGoszgatsSjjHSMbTKGTLsMpNcPUFpC/3RgBitLm6aYBD/YCQNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=L4SRDreu; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="L4SRDreu"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g0bsc2GJbz9tl2;
	Wed, 22 Apr 2026 00:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776808884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lf+4vdWl5FseCHdVTdGosuECjX8ePmohhQ7GyJeF87M=;
	b=L4SRDreuhcjREuzdhyBs4sCF4ds/KHXThkrdbkAkRXsaX9kSjD5ngI4JuqPLFqhsN0Sre4
	YEZAIst2MmwHNbbEBwrBjreCRjWsw8NgfrTyklaLoTiDCJ/9Jq5FTYKHeGYwSdUS58d0U7
	r56qfZvZ6jHDgzOnTY61POjGoJdcSLEzi18mS8RmqXcxRrFafAyWOVc8Vb1pDQ8B7DMP6D
	coGOF4SmVxJhuINEwohVi0nEnA923KKBdf5HGoVjbVWUnD3GnxJSnMVW3h4yqj3KLGjl7U
	QLID0WuYFmY9LPQ3QXdmCfHlS1dxcuuVSM5A+cy+F/R42bYx3r3Jpafiejdedw==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 0/3] staging: rtl8723bs: simplify booleans and cleanup style
Date: Wed, 22 Apr 2026 01:00:55 +0300
Message-ID: <20260421220058.29317-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b2180946bde5f432f9c
X-MBO-RS-META: ijxufx8y9ctudpkt1mcqsj486cpyn68h

This series of patches simplifies comparisons in if-statements
and fixes some checkpatch.pl CHECKs and WARNINGs. I hope I did
everything correctly.

Link: https://lore.kernel.org/linux-staging/20260405160135.22291-1-khomenkov@mailbox.org/

v5:
 - Split logical and stylistic changes into a separate atomic
   series, following Dan Carpenter's advice on simplifying
   boolean comparisons.

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
  staging: rtl8723bs: simplify boolean comparisons
  staging: rtl8723bs: add spaces around bitwise OR operators
  staging: rtl8723bs: cleanup if-statements formatting

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  4 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 54 ++++++-------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 18 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 16 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 79 ++++++++++---------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 18 ++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 35 ++++----
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 10 +--
 drivers/staging/rtl8723bs/hal/hal_com.c       |  4 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  4 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  4 +-
 drivers/staging/rtl8723bs/hal/odm.c           | 13 ++-
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  2 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 32 ++++----
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   | 14 ++--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  2 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  6 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 53 +++++++------
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  4 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  2 +-
 27 files changed, 199 insertions(+), 206 deletions(-)

-- 
2.53.0

