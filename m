Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D8B397B06
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 12:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779539471; cv=none; b=ua59NMwBkBynq46LE57j9XGWN1W7FmbfuF7Pbl7gYQ+JF3xBzoR45zm9bex1QHy0T50l8A91mDf4x0Ojpu1VQjVvNuNaB0bZhxyqY06c0KiQGzRrFRjgMEBMBWJwB7zRRXyw+4KQ/fMeoHonP1uTgcwfB+64PSKu3WcaQJE6SPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779539471; c=relaxed/simple;
	bh=taS7tC/WQXQNmqTbNXQ7Tmfe8gF4SLsfo8ITj07xmrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gd8+odNA8Slt1dTA/5pAk1LoFYLMU7kWcuNF+gxAH6L/yRUBS+JVvtaLkRnEHYx76ZgQWzATTStPdwajYjP1WoGFn6yDYqCHkfBIklrISXQhuKWZSIOpJWiZ888zyOMAkPbq3c2ldiwoEKgFhJaFY0UT45MOn4Px4QeFLxIwnHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xX1xH2un; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KxQvIrKJ; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xX1xH2un";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KxQvIrKJ"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4gN1hp6tSFzB16K;
	Sat, 23 May 2026 14:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779539467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UNghriqaXlFMg/01wGShh0lCx7qxch7wWmFGSim+oxI=;
	b=xX1xH2unUTcqe5DWw7tirKiHglw7MNU6AtCvzc1QSYR0CIrLzCCpKk62t8swD/KBVj2XTC
	uFHSWeDZd77k7JjJKWq40rt+NfK3HYU1IWbuGv5jqmrpDdkbgmUf+M185g5A1geCIKdRD1
	0/Qol/S7evsuYwO0PBi60oAmcmwQ14Lgd3U75h3Rhcp8/3YttTJPcPr4VuYRU4mSs3dzJ4
	gqz+hIsrIWFAfqEvDEZ+xH6K7UZMKA4N+ey5GYdRvO7lxGtBQF3+v2m9w0+aWARkXpGbfU
	n52duz7b285i/AW/B8KiTdj2ROLEvUvdrZpCfGGrfZHMWoA8cWc1QmlPi0l/Kw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KxQvIrKJ;
	spf=pass (outgoing_mbo_mout: domain of oliwieriwan@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=oliwieriwan@mailbox.org
From: Oliwier Iwan <oliwieriwan@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779539465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UNghriqaXlFMg/01wGShh0lCx7qxch7wWmFGSim+oxI=;
	b=KxQvIrKJc4l9YQYgoMo34PHB4T63p/fb9AGXSbZ5SVfnIL+nur4kL81KGQ7dzPJIxLYYXk
	BnmZ9LXsEmfDv2EhZYAQ6YKgOA81HGoMMmbJZBijsoYVLozWHjKQ7T3pBuu9qNzclHV7KF
	5PhWfCpEhXV7UvvyYvwYYImIJWvraZBTvN1guWIPMUZdKH2tRfR0ZV4+TSHWPxfoSaWzND
	yWm1NDxp8wB8EfyAXEQQlB2Ir6JU8H/OEq3TGB9nrXK8osJlMXiki1Ub9N1J889IK0gfsB
	YtFNuhtCqhvUqFaZJ289CHvzWWAn26dL1CVe5stnVz6djHT0xuNKnktNl/u0vw==
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Oliwier Iwan <oliwieriwan@mailbox.org>
Subject: [PATCH 3/4] staging: rtl8723bs: align '*' on each line of block comments
Date: Sat, 23 May 2026 13:30:42 +0100
Message-ID: <20260523123043.22907-3-oliwieriwan@mailbox.org>
In-Reply-To: <20260523123043.22907-1-oliwieriwan@mailbox.org>
References: <20260523123043.22907-1-oliwieriwan@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fj49gb7xeczpwakcpe3pomyojdcdhzcq
X-MBO-RS-ID: 2206d6728c4109ef9ff
X-Rspamd-Queue-Id: 4gN1hp6tSFzB16K

Add missing space before '*' on each line of block comments
to fix checkpatch warnings.

Signed-off-by: Oliwier Iwan <oliwieriwan@mailbox.org>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 28 ++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 1130511859ab..665bfec5ffdd 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -478,10 +478,10 @@ void rtw_init_hal_com_default_value(struct adapter *Adapter)
 }
 
 /*
-* C2H event format:
-* Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
-* BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
-*/
+ * C2H event format:
+ * Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
+ * BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
+ */
 
 void c2h_evt_clear(struct adapter *adapter)
 {
@@ -489,10 +489,10 @@ void c2h_evt_clear(struct adapter *adapter)
 }
 
 /*
-* C2H event format:
-* Field    TRIGGER    CMD_LEN    CONTENT    CMD_SEQ    CMD_ID
-* BITS    [127:120]   [119:112]    [111:16]	     [15:8]         [7:0]
-*/
+ * C2H event format:
+ * Field    TRIGGER    CMD_LEN    CONTENT    CMD_SEQ    CMD_ID
+ * BITS    [127:120]   [119:112]    [111:16]	     [15:8]         [7:0]
+ */
 s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 {
 	s32 ret = _FAIL;
@@ -526,9 +526,9 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 
 clear_evt:
 	/*
-	* Clear event to notify FW we have read the command.
-	* If this field isn't clear, the FW won't update the next command message.
-	*/
+	 * Clear event to notify FW we have read the command.
+	 * If this field isn't clear, the FW won't update the next command message.
+	 */
 	c2h_evt_clear(adapter);
 exit:
 	return ret;
@@ -625,9 +625,9 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		break;
 	case HW_VAR_DM_FUNC_CLR:
 		/*
-		* input is already a mask to clear function
-		* don't invert it again! George, Lucas@20130513
-		*/
+		 * input is already a mask to clear function
+		 * don't invert it again! George, Lucas@20130513
+		 */
 		odm->SupportAbility &= *((u32 *)val);
 		break;
 	case HW_VAR_AMPDU_MIN_SPACE:
-- 
2.54.0

