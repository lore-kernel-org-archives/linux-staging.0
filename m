Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791FD3A71A4
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704592; cv=none; b=vBu+Zr/qhsEU4kbrlCNA0yvYGIZbfe85QfMj/4dhBqSj6DZ1iq8vfEoscN3aQm1YoQtRFKtWQ4TTYJhMajeuF2vEUusjNdoH6kCoTGWOIdjq++9vN0EKp2fDidAPRWGB4V9xazz3fs/00V0KZDh9rDDhx4f06vE4J3HYBnqCegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704592; c=relaxed/simple;
	bh=3VjogJRvlVNg3t8adN5DZTXgCr4LrHLIkitkB/fmWkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDjqE0PhCQuu7L2+SlcD8FnL7N/M2xFAnAKFmIGzK2G58C82Wwi1mviChvbcsWuYTOX2QtaI0WHp0FSNryySjH90tVU0LWc1fTUg/OAPjRBhmZ90GUGepVl2ZpZVk0V20YhHxyizF925/jnaSqoy++PojU2SSruazd3Bl1BW6hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=tuBoX9bJ; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="tuBoX9bJ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03AFB84FF3;
	Wed, 13 May 2026 23:36:26 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778704587; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=d9Ed+ndE0rLiuYa70jJCdm2waF2bxaiVchc8o7SFhK8=;
	b=tuBoX9bJNgrv5tS3LlDcZZwILPGoXK6QpZNhnvJKeKRfh+2Z5RZ6E7WV6V3BETlFdqugsM
	EPM1Zc5OPoJxCx8LXSjaBtdX+IvlI75ILCfscWZ1IGj8Z6AjcG+qPxI5FT5bT780tZyeip
	8cl1Woi5tMAk2vHi7xCK6bcQdA/j00oMWZpe+cktMV9naCa4oUflGbo+xgPDqNxL9bOkFd
	hSpA2DEmcLqh2d0xqQMWzcriNaU/UUqBQaT0iuQGybqiIudE2V6X8RPH1ZMnBcLKn7eUz5
	BujudJk5Rjy65PMMWNvQU+Rr8tdJyRaFPAM9Q/o5Alu6nzisTNKJfAUoAXa5KCy/DqZYtm
	kwlllY+LBrY5F85w8jKx4VtS7cNmgbZ2WOsuk262goyyZ0Wg/MLb/rGLtz5R4+XPcAYyrX
	NsU/8/A9/+8kSCiHjVmc0XGZyDZvWKoXViuNfUPq1omhj44oflJLiyYy0YxqDJMyZaXiUE
	WEC6NOJ7Ge4xA9Yfy+GUl4nnk+IyWQ+V7tHZNnedlADv2eISyN8WbxTbNe6XQlXLKMBXLd
	HUjRkXVYg2RKexrt7jNEbXwSTQejlVCDjHoMliB/uzl0WQAKq+HApkW2okf/j2LfxNeZXy
	nfGtPFiNNKxuxLbsGpdJaOlCWd4neKaDK+2f6CV3bsSIhYScQDkuY=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/6] staging: rtl8723bs: rtw_mlme: add blank line for readability
Date: Wed, 13 May 2026 23:35:04 +0300
Message-ID: <20260513203611.31872-7-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513203611.31872-1-me@cipherat.com>
References: <20260513203611.31872-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a blank line between the WIFI_UNDER_WPS block and the
wifi_spec block to improve readability.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index be8b50e8a232..0104829ca50a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -626,6 +626,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 		else
 			return false;
 	}
+
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
 		uint ie_len = 0;
-- 
2.54.0

