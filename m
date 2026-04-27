Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39F3EB813
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312745; cv=none; b=eKaRwf7/QsQDosmjPQuRD2Ht7bdsWV4jXyiJT/6IFYdqpzTEhjODqqQNhhUp8RYUfflTZZEKBytBsw4QzVtyWjw+el22TbRUU6rSJ4oPdfkCE/SysowW4HxcMwVbBK0qpQTwmbAN2AXAsRv1J1u/qKIVjl5TT60e1Fqb39xfefc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312745; c=relaxed/simple;
	bh=Wl0vsXcXr+IWlr+sLnuyPyNN/x2Uq+dh234rYpq5jN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FTq/q2Z/RQJBT69ZlHwKM+FIGjJbaLW1JFT6oyNUOqfIc0nNDKhTeo0e/SotCrAroQCimJPPVyITaQN80x9g7j+hE4+eH0BWdX7E2oRiA77KcbCZwGIuf14UeYWEBobPx7z/PrZPz5EvAqv4psZPBhtkBqWl1R2T6vBrdXvTaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=i095KVP9; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="i095KVP9"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g4BC72Wc5z9tty;
	Mon, 27 Apr 2026 19:58:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777312739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pfeYLm8GG0Otk+tfmDJN13jN+x3z5LAkqivx3mcDYQg=;
	b=i095KVP9WWCQNBdYpV0iqo3ZAyQitztS42I8aDFft5J5VvoNxn1TJ5w+o0NgOMf7FIcftM
	c9oC4ob5eAGdYdjIPQCC5PrSok3yfoxL5q/vBt4ijCeUkxyVwZYWdZK7/8Q6+epkxMhmuX
	a0e40/DXzzmaHO0vYR152IFPVdCvHjc0nnYvpSFRJG/BFYcJvqH1nNh5pCWeEZeFacD6S4
	9aQXmdLSQwlFCBBoAGa6ZaB7OsVFFba4hKnDOtFDi+gHFuUcZW0kFIXsiNg4OpF+lP98k4
	sjtd/b7adi/2I5NrosVKJH+8/tOIEJSFlv1XHfAz2zcL5gwzUGq3HBOpJYAuYg==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v6 0/8] staging: rtl8723bs: simplify booleans and cleanup style
Date: Mon, 27 Apr 2026 20:58:38 +0300
Message-ID: <20260427175846.23470-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: cb0bf5dc92f032021a2
X-MBO-RS-META: ud3kbfmc6o3ny7tzxk7g8rh14q1hbk5o

This series of patches simplifies comparisons in if-statements
and fixes some checkpatch.pl CHECKs and WARNINGs.

Link: https://lore.kernel.org/linux-staging/20260421220058.29317-1-khomenkov@mailbox.org/

v6:
 - Reorganized the series following Greg K-H's feedback: split
   boolean cleanups by subdirectory and separated style fixes
   by issue type.

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

Andrei Khomenkov (8):
  staging: rtl8723bs: core: simplify boolean comparisons
  staging: rtl8723bs: hal: simplify boolean comparisons
  staging: rtl8723bs: os_dep: simplify boolean comparisons
  staging: rtl8723bs: add spaces around bitwise OR operators
  staging: rtl8723bs: remove redundant braces for single-statement block
  staging: rtl8723bs: move logical operators to previous line
  staging: rtl8723bs: fix alignment of continued conditions
  staging: rtl8723bs: wrap lines exceeding 100 characters

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 54 ++++++-------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 16 ++--
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
 27 files changed, 197 insertions(+), 204 deletions(-)

-- 
2.53.0

