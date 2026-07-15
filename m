Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2454D47CC86
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119849; cv=none; b=OWhbzOMS93XiOdh2QHuqgshVsmYu6RNOIiwyM0VWVlH1RD+Kzz9byZbA0ztItGGUaQZfkRqcLmhyUetxLKb7gAvosnYUEhJ7b9CZaVv84E0/n9wiEP2hZFNXLJEhPlr5k9IYKy6vXSiEQVSn9qR0HSwLcpxLsfEVOl6uCwztfgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119849; c=relaxed/simple;
	bh=MLDCAjhau4+N8EDZSJMo7maYPptWbIlQKd6yEnP5wYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kji5DhTuW0HmTqlCPiQRA8EbO1R9LmChBOnyGzCoPv1U1oxQFrNTEeZ/zUcV9pKQLTwEOMcyLKRF+GZvR77XY5+DGp0nq0czbrY5s6Qj4xTqxQJMREJmTFpsSfI0SQa8ynqu8+3dA+9L+i1BRs2n9gxyvtxeTTsqeceL89LRK1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uq4DXfY/; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uq4DXfY/"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c83acb86eso19092311fa.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119843; x=1784724643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DshzI76EE/QJT7xJTIgm81rXA61uLEsU1/ph4m1+q0M=;
        b=Uq4DXfY/tbdsdDoh3naDzzEfipRb6p8i7JMLyHTHCoB5ylDjxlHG5QLjn7pKEqzWx7
         52UYwKUJsKv9J8+gToSLcS1WlpQv91F//OPqM+EKrNYUED8YQlHAFJUrAXxfkW/Jsz/y
         aONF7PthFYPHhKbRyi3+IKFsnYBXaIW8xELgslG0xVaU1MykxzILddUtFJkKYyk5/xHt
         uIfktkQogCIhWnK/uba4JbGpPHP61BwRj2KrV8S1ZHE9tcYunckFMZMoCaH1YcfmUw/g
         YqujvvOypQVwGuOpD5UAJQEy293x+MmsBcJzkh5SD5xwCUm5q+TPSVTtNyEh67iBto37
         1O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119843; x=1784724643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DshzI76EE/QJT7xJTIgm81rXA61uLEsU1/ph4m1+q0M=;
        b=ciOQnSkI+9SjRLjNWNpS7YPiXT49FC7FFzMXijbrBYhHTDVGugwZV2ighp2lj/OwJ5
         rb+gRpbqnmZJXC8s7dglMSxfygl62ejV+L5fQoYv+P0/EbT6z136MbqOyI0obrb+j4r0
         Y2cCSPMenMDK078Ys0/uZAB+DwiQ57PgGQs7i7sS9M372Tz7uCx1rnqzkdiSUyPIp2Id
         cFy8XOb+peGSciRKOFoTWJwqBAgZBmCOKOzC8V6Ht3bmS+iD8jz4A+KK+byVGLs2/wRl
         qj53giNYwD6DTD1OsDu6Gm2pkJZHzpRPnSWeRiQ8aGjgv3QMD+WslB9/Pn98ME1gPD1n
         SV9w==
X-Gm-Message-State: AOJu0YzM7uHKsIXAjKPDBMzpwvzBTK32wyMsy1FsilvLsDhBKIWo3W0o
	4a8ryECDEIat2K0qbxt1NbmlgRg15ZGq5CNc8afj7ZCH7T4w1CWOdoOE
X-Gm-Gg: AfdE7cmRe9CHXxXZ5+raXBlhw/RnvvTKW/1Cqz4bYb5CO7tsNfhFh4YaesUpDcXPMRX
	NySZRqdn3fUz/fu5vPRKHvtJ/Q491rPtSfUaabkL3NHiCotW28uPK2nKgd5uU3tionGnxkLdTop
	NB/VWJ2kVBusAmyzCg7ZMmm/ZBwLYVCQrv4F3SXnT4TuHA/ist9KZRj2LX14CYGLoa7JoQwXd19
	/pFoSD+Hi4fWdOT/E1TtCgLrC6LcENuT5GcstNFcXZfq9P74BUzNh+PlA0Kc4KumW8HVjLvbXCQ
	SyNo7qATepX4aJIo+2S319kqFSJv/q4FSy2ClFujMAYkkjzXXIX/RGCXD3+AbpDnICRSLIwY5HD
	AqSJu6VJsjUgnw3fjcnUj2RC63XLQUJ7qTiacgBevjlOUf2pJNcBmNfM6fUBwAp9fdzAMUaRqO2
	7a11RqSCx8Ldk4jjSKbKOR03ybDHJOKU0rYrwq8vjhGU2ZJleBa/q9XnLRFTVuj7hrUHmFUAT5X
	pZ0FSa1dSuUvg==
X-Received: by 2002:ac2:5686:0:b0:5b0:161f:8fc6 with SMTP id 2adb3069b0e04-5b02369d941mr3891332e87.40.1784119843154;
        Wed, 15 Jul 2026 05:50:43 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:42 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 35/61] staging: rtl8723bs: inline _rtw_free_network_nolock into wrapper
Date: Wed, 15 Jul 2026 19:48:03 +0700
Message-ID: <20260715124829.90290-36-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Collapse the internal _rtw_free_network_nolock() helper function into
its only external caller, rtw_free_network_nolock().

The separation between these two functions served no architectural purpose
and only created unnecessary call overhead by extracting and passing the
mlmepriv pointer. Inlining the logic simplifies the BSS network freeing
path.

Clean up the internal function definition, remove its prototype from the
header file, and keep only the unified rtw_free_network_nolock() function.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 26 +++++++++-----------
 drivers/staging/rtl8723bs/include/rtw_mlme.h |  2 +-
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 0ec599383..1450589aa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -198,20 +198,6 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 	spin_unlock_bh(&free_queue->lock);
 }
 
-void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwork)
-{
-	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
-
-	if (!pnetwork)
-		return;
-
-	if (pnetwork->fixed)
-		return;
-
-	list_del_init(&pnetwork->list);
-
-	list_add_tail(&pnetwork->list, get_list_head(free_queue));
-}
 
 /*
  * return the wlan_network with the matching addr
@@ -300,7 +286,17 @@ u16 rtw_get_capability(struct wlan_bssid_ex *bss)
 
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork)
 {
-	_rtw_free_network_nolock(&padapter->mlmepriv, pnetwork);
+	struct __queue *free_queue = &padapter->mlmepriv.free_bss_pool;
+
+	if (!pnetwork)
+		return;
+
+	if (pnetwork->fixed)
+		return;
+
+	list_del_init(&pnetwork->list);
+
+	list_add_tail(&pnetwork->list, get_list_head(free_queue));
 	rtw_cfg80211_unlink_bss(padapter, pnetwork);
 }
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 23c46df90..f15dfcac0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -360,7 +360,6 @@ extern struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv);
 
 
 extern void _rtw_free_network(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwork, u8 isfreeall);
-extern void _rtw_free_network_nolock(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwork);
 
 
 extern struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr);
@@ -395,4 +394,5 @@ int rtw_select_roaming_candidate(struct mlme_priv *pmlmepriv);
 void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta, u32 mstatus);
 void rtw_reset_securitypriv(struct adapter *adapter);
 
+void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork);
 #endif /* __RTL871X_MLME_H_ */
-- 
2.55.0

