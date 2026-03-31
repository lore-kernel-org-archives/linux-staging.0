Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7503B2417D1
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 04:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774929655; cv=none; b=WDV7ePdmraYuMZyB6p9if5sXJQa2bXELsV3PpRfuEay9sIsANNWN9iO3/It1y900FnQFxGmUmJXGz2CN79OeGS5cFJcZmIg6w22o2SUjXRPVVbGSe+27yttd1Ma54kKNujVyYZCv5bnOLaJa7cGR8xgxX5NfZUQuACGpHciJbx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774929655; c=relaxed/simple;
	bh=OFKMLDHJmlI0AlEIvKt/7x0jR4VUiay/1XxM3YFgaO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NFltrRH+8Br2lX5jcmqybp+YeNTc7BBq2or27cZnBGpGcNoKJP31M2zquHUUfFNwSSoeBzR5s5tGzUy9DutiU4sPIxWa3vcP84aqFCSumD2P6mwRG/RLw12AzOGjSNnGFHXiQsSRWQByz9OyKu64LUtSmCmjRAD7A+eHW4cTcJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZWBT5BZ2; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lozYXMhH; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZWBT5BZ2";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lozYXMhH"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4flDtP6VDGzB12G;
	Tue, 31 Mar 2026 06:00:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774929645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B59z79wnKQ3cxFCMVHGX1hYKM5bftayPlX52tsTJjTs=;
	b=ZWBT5BZ2sinWTcKhNsBvXVqITZnP8bBymPEVcL7QVQEHsuzSpf0Yg64zfVtNaLsYjCaxsV
	KUdf5gOrgDx/3tnqNxkwUQqw30LERIriuS9udUHKXJW6df19hpwgiuWHSogyXhOgNaTDJF
	wQhd56meRG2rtSlHDZLvsZdu+Th+igHavIaTVLHsVzuq8NHuTY+o19AT3tCSXMwDVhkql9
	IUb4c1gUIyDwTOxCLs9IYRgDfYY3TYjcA16maDxj7gEHMuGXU4B/B6abcf2wH1jGkp4hFM
	B7Cer/z4++nC0pJo26tRnYXpSdX3fl6BdRtKzxaFspMNXH+C6ib762UX5Di5/g==
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774929644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B59z79wnKQ3cxFCMVHGX1hYKM5bftayPlX52tsTJjTs=;
	b=lozYXMhHC4mGwr4PlNiiRbKU6+lU2JaI5YT64n/iTupTPNW2qbYGUYrEUb9OnHVG1uLaih
	7W8ZjYkIW3qFwraZ6F1eTQf+yvDdpEVfSdjcsVVV9tzyau/YD+poP3xbAzjHM3+Jnw+TWW
	ARVFcl6mM4Dw+saa9I5G7lvM5XNs6swueHXN6kHb+1qdhCiXHQcv+O8KNf2q8RQiH7DBRx
	Bsr3EE7p1TZlsXRDL47qYkhu/TZTWIw702wfYWenBDM6N0bQlkjzddEIl2EUPZgt5OZMij
	5HqMAdjUTWrYos/vFfzGdoHlZPnu2d0GLFnW5U+bgYuH0CDqcwMaVFV73CAxSQ==
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mashiro Chen <mashiro.chen@mailbox.org>
Subject: [PATCH] staging: rtl8723bs: remove unused RTL8188E antenna selection macros
Date: Tue, 31 Mar 2026 12:00:23 +0800
Message-ID: <20260331040023.45627-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qtqbos7mdkqajdwr9axzwjk97fciifnn
X-MBO-RS-ID: 345d7d62029f2c507b1

Remove the SET_TX_DESC_ANTSEL_{A,B,C}_88E macros from odm_types.h.
These are leftover dead code for the RTL8188E chip and have no callers
in the rtl8723bs driver. The RTL8188E is a different chip family and
has its own driver at drivers/net/wireless/realtek/rtl8188eu/.

This addresses the TODO item "find and remove any code for other chips
that is left over".

Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
---
 drivers/staging/rtl8723bs/hal/odm_types.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_types.h b/drivers/staging/rtl8723bs/hal/odm_types.h
index 8168dc14e879..0da662e1493a 100644
--- a/drivers/staging/rtl8723bs/hal/odm_types.h
+++ b/drivers/staging/rtl8723bs/hal/odm_types.h
@@ -36,10 +36,6 @@ enum hal_status {
 	#define	STA_INFO_T			struct sta_info
 	#define	PSTA_INFO_T		struct sta_info *
 
-	#define SET_TX_DESC_ANTSEL_A_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+8, 24, 1, __Value)
-	#define SET_TX_DESC_ANTSEL_B_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+8, 25, 1, __Value)
-	#define SET_TX_DESC_ANTSEL_C_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+28, 29, 1, __Value)
-
 	/* define useless flag to avoid compile warning */
 	#define	USE_WORKITEM 0
 	#define   FPGA_TWO_MAC_VERIFICATION	0
-- 
2.53.0

