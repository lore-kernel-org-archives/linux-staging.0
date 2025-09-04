Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB6A215F48
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952117; cv=none; b=rpFnDoDp288UFyUlV8qcWC2fHNcthYzyX6AgoX9Oxej/RBJgcqLS6yUE8BNH1LjUYAgvRrIwZHdrs7cNP6vN186CPlJ5CTDCF9bOfi5biZ+2MBaCAPSoMadCUPlNkxWdJEW7KBebDqXkl0BkN/59GqbTBembcqpTkFVNko0TwKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952117; c=relaxed/simple;
	bh=WvsYf4htlmaRnQimGmB6zOdcA6l8TLaYGHRCyCVqilw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W5erPSuB2JhwFFsClL4QOPjfTRkgqqgm0NT84/GAx93eTfXHJl/n2bxngdttG5BtjOb43XR99kR/S0I6loOk+IfJ0jSh3lKmAv8PJuYou23A/8bYdp6Ol1tEssWjRW5WCCnSBCd2FyqCPI0HnLbzAVyE6b7D1ds6XovlTH5NJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX0SOB+C; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX0SOB+C"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-722e079fa1aso5480166d6.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952112; x=1757556912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgytSi7eWruZ4IgCQ9+woJWiBKve9B/1Gpbx5IGpnoY=;
        b=EX0SOB+CUopSg9Es35KFHRzrnIPGKqDBojeOpuqtQgp3mfNGe5xO2/5YwUnw26ZnDd
         ab/LD1EUgJvpzRmo+1928Ug33bbnWveLxQNrGVWNLUKjpqvBfNX49/MW+IcjPmcgrR7q
         iBlrLTfyMXsFo2/cabiLX1kziUANVS9rEaG3+Y4B8ZksfAlY9laCvA09eBj9cQgbEG9r
         kIRbIay7upuPFCJ3sNw6+pKMCPaq3ZF2diLAnCLX0bbbTpmNjAEX40GWrYZgITcZL/d6
         l4qBeh9CJ7kwwy4afeh2zE6m1kFl3oxUnrc3eZpoOTMwR3+ZMOADHVLctFYprUPDADnB
         ClCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952112; x=1757556912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgytSi7eWruZ4IgCQ9+woJWiBKve9B/1Gpbx5IGpnoY=;
        b=SjU/rZywDYJKy7dQedq5sl9niL8DOyjb05jxeXc7y0t8sCvRWeWAQLMxENFophPFHi
         xBRyPHJKIZosGkLuKhodP7Q06PdKqKdwOrLL4dYO3MIUVWAJGP4xffReYMhycS+g2oKW
         2adtQRjym0G2gVKBi93kqAzXBMwz52kq4JdZSFg1kQ+PvN/s8QRSTSINUBNHxcAzIEVh
         f6OeGNlZ9Ll2N9iE0E9FnjPjAR+eDkNkA8GL68rVdewWpp/IJh30VE9DbZKC6cki/4Q5
         BityaDgWNFxrUi0tEKw55uKsebfdr8d0UzYbH8TTHQesPntqi2vzlSI/tnTvC4lAi7xF
         2fhQ==
X-Gm-Message-State: AOJu0Yz964sR1x9V+S5AcAygUb1pRkcxil0wj4e1W8BbrPmBjSUHNpB+
	cK+b3aZPQo2UChgEqvZco7kR371dPWyD0rBLji3afZ1M5kOGGpX8L+ePSyUdXw==
X-Gm-Gg: ASbGncsZ63LMDdUWKmxZ4I2b+sBlnFzRl726sHIsntEAVEeSzDyQdSeZ94p032fq893
	ZDfiEKkApwO3y0qa2gKhElutBjxrAIm6uJUS5mv56hmBwAjZeRgt0tBsi+VAPhT2aqaYHstyodQ
	s20HqKsOZdf1Cu7yRABNiuJa1zEpqXIpaqVUPF9CjXqU/zCqbadIyazmy/Qtlb6bCwPt9W5pt8J
	TAB87bgnd+aa5UudH+7ZYJCkG7AywRF3xQkDgTL4o7IB0RT+AZPalMXuSbTQ5dRutlB6+NiiRtN
	OsrPzR4mhdbK6UWCQ3OEEaMQdKquMTkiaRwQLjY3JKvHQtcwmeN0D+s8ldpOkQ1B2tCmmuJBvBX
	IiZh0B5E6YW2UZ+RYlksfoa6StMKD/Hr/Qf9fFkeSkZNCWq3wSQ8=
X-Google-Smtp-Source: AGHT+IH7XVMZzkg1jb98CxCDa1Hsqg+aNrQL0tORQU6Tn6SKAs7whG+6Fq5+0Mn0Xl6S5DwLgMBR5A==
X-Received: by 2002:a05:6214:1ccf:b0:70d:fa79:baf0 with SMTP id 6a1803df08f44-70fac88e924mr217252246d6.38.1756952111913;
        Wed, 03 Sep 2025 19:15:11 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:11 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 07/16] staging: rtl8723bs: adding asterisks in multi-line block comments
Date: Thu,  4 Sep 2025 02:14:39 +0000
Message-Id: <20250904021448.216461-8-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Format multi-line block comments with leading asterisks

Add leading asterisks (*) on each line of multi-line block comments,
in accordance with kernel coding style. This improves consistency
and readability of the comments.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 33 ++++++++++++-----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 19bf6bb360f9..ab626c88e7dd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -217,10 +217,10 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct list_head	*phead, *plist;
@@ -322,10 +322,10 @@ void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnet
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct	wlan_network *pnetwork = _rtw_find_network(scanned_queue, addr);
@@ -489,8 +489,8 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 }
 
 /*
-Caller must hold pmlmepriv->lock first.
-*/
+ * Caller must hold pmlmepriv->lock first.
+ */
 void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
 {
 	struct list_head	*plist, *phead;
@@ -523,7 +523,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 	}
 
 	/* If we didn't find a match, then get a new network slot to initialize
-	 * with this beacon's information */
+	 * with this beacon's information
+	 */
 	if (!target_find) {
 		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
 			/* If there are no more slots, expire the oldest */
@@ -1891,11 +1892,11 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 }
 
 /*
-Calling context:
-The caller of the sub-routine will be in critical section...
-The caller must hold the following spinlock
-pmlmepriv->lock
-*/
+ * Calling context:
+ * The caller of the sub-routine will be in critical section...
+ * The caller must hold the following spinlock
+ * pmlmepriv->lock
+ */
 
 int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 {
-- 
2.39.5

