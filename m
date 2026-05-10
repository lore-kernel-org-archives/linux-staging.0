Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE31121ABC9
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420609; cv=none; b=doydhFuPS3EquRVU5OJfMcWmt7HOV1qM3TjZk/O5dbvz4N0kMZKLgT/j1rHhf3MmZUx+j58WBmpddWW1sdjYop+F9sb42XoA4hxAcVU38CM6f+P7JQDvN7Y1gnt3R9BVukfpwETK23UJj7zyrZuv842RReNMxslANq/uudHFcLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420609; c=relaxed/simple;
	bh=tnjSsVucPG2J7LgL3tdMgf/TVpsZtXQ3FlY4oC+EuWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehYCjhd2IR1fbDzNBrD7Qff866TC9KreygKUCSBoWGsDioZHw/r3eho/VPzcMJKQ2El+8q8CGZNwf/CQTt/kr8xlz3CnqTW14Ip5b2RtMCTAR4ajZoX+6O1BVdBG25InEiGg3Vi+M2OCEO60xbGXJJE/XcaU3sjtYlmXCHsi2yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UwIRn3TD; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UwIRn3TD"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gD3w661Svz9t2V;
	Sun, 10 May 2026 15:43:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778420598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z5LQU3NBl0eMRU5H8wNpXDEdGL+Hz6sCzi2fUGM0HQ8=;
	b=UwIRn3TDcHVvIW+KEBD2adaU2ezp8HWWziV2fio9cLukaVe9orTiDZPh0yaZHIJsT7g4u1
	581aK2o0B7UNlFpGGGOIPzE1k8RJQ5GZgxzQyxU+wMfhKK3P3Mg8r3++UgX3xlCtTnTCRP
	E5IxBUAr+LQFiR4rDou44Dtf4ywbr+IRgZSGKaaeqAWE4OC8tlPIAgUco7+cadMHgOn5hm
	Rv1yBAJv1Rvvem2YEagywjmu3GAlSe3SrGSzHcGttLh7VtBYQDeuZwXufKJdJDScwtzKQH
	dFyyA8nwwr6cu8h1m8bGZdL3gEWy/gVV61JJ6jkWSC8R/8VOZ/JqS0YjbsGv7Q==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 0/9] remove unused code and simplify if-else blocks
Date: Sun, 10 May 2026 16:43:06 +0300
Message-ID: <20260510134315.64295-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: cwf4hcakxcoa6h43rabkqmthtnbijijw
X-MBO-RS-ID: f3a672ded34aab90cd5

This series of patches removes dead code hidden behind unused
ifdefs and simplifies if-else blocks to improve readability.

Andrei Khomenkov (9):
  staging: rtl8723bs: remove unused DBG_FIXED_CHAN code
  staging: rtl8723bs: remove unused DBG_RX_DUMP_EAP code
  staging: rtl8723bs: remove unused CONSISTENT_PN_ORDER code
  staging: rtl8723bs: remove unused DBG_CH_SWITCH code
  staging: rtl8723bs: remove unused REMOVE_PACK code
  staging: rtl8723bs: remove unused RTW_DVOBJ_CHIP_HW_TYPE code
  staging: rtl8723bs: remove unused RTW_MLME_EXT_C_ code
  staging: rtl8723bs: remove commented out code in rtw_mlme_ext.c
  staging: rtl8723bs: simplify if-else blocks in rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 28 ++++---------------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 11 --------
 drivers/staging/rtl8723bs/core/rtw_security.c | 10 -------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 26 -----------------
 drivers/staging/rtl8723bs/hal/odm.h           |  4 ---
 drivers/staging/rtl8723bs/include/drv_types.h |  3 --
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  9 ------
 7 files changed, 5 insertions(+), 86 deletions(-)

-- 
2.47.3

