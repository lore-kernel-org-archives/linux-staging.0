Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60A83B3885
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075336; cv=none; b=OysDanPHhul8GJya5nCqXdbDXRpS2gfpyzqBY6ULMqop06XxDsouTXp7u3niO2D6pxjH3nlSC0xNwFyiYBi5HwDIrVDaC/MfFb2tmrwFqXXtY8/0tMEbpE9dnjBnhsSwbD6+NE5lzegr3CZNimn86uyrVjYZTDuQfruR8AJa9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075336; c=relaxed/simple;
	bh=xLNyd4WSW7nzPFpMksReBLY/Hhxa5k3aSGb2bhAaukM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qH/4d4+vJDjfT/X4aeZDpDJKwd4Uozy6x1SZToUiutkmxxZmR0hzFsFIwBCsKKtGg3WAn8wmN7/ld82DTYosi96IE4sK1UHiWdAvRm4OA4zhUHDjexg7uiSnBp5SH5+9nh6amVWasAzUa+eUP7Lf8+LfaafRl5P0sIImBZgjSfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Uv16Q+Is; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Uv16Q+Is"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776075331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RppUm66t3ATpe/wWI5LWZprHlIA2kT4A2uwhrHzVJm0=;
	b=Uv16Q+IscpgdSPP/NDjnYCPo468vIJtvjvKAhsZT6cmuC/aGifIFNU0Wg0Li9DSzCWqb7t
	pPpCN0MLmxT7619cv/GFQeeYkDZfQ8bdlHG0djrz3uZ+CzugLHtObhh5K/sqyHP58BQRoV
	IduBhDhC6ObIMeIImorf+2lDPzM6fc8=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 03/11] staging: rtl8723bs: os_dep: fix spacing around operators
Date: Mon, 13 Apr 2026 12:14:24 +0200
Message-ID: <20260413101432.158925-4-luka.gejak@linux.dev>
In-Reply-To: <20260413101432.158925-1-luka.gejak@linux.dev>
References: <20260413101432.158925-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Fix spaces around operators in the os_dep directory to adhere to the
Linux kernel coding style. This resolves multiple spacing warnings
reported by checkpatch.pl.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d0feb28b7043..95523c3a508b 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -77,7 +77,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
 
 	sdio_release_host(func);
 
-	return err?_FAIL:_SUCCESS;
+	return err ? _FAIL : _SUCCESS;
 }
 
 static void sdio_free_irq(struct dvobj_priv *dvobj)
diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index f9c4d487badf..ce835802c442 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -93,7 +93,7 @@ static int _rtw_reg_notifier_apply(struct wiphy *wiphy,
 
 static const struct ieee80211_regdomain *_rtw_regdomain_select(struct
 							       rtw_regulatory
-							       *reg)
+ * reg)
 {
 	return &rtw_regdom_rd;
 }
-- 
2.53.0

