Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B77216E2A
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504431; cv=none; b=TUKdSbXyoUUz0X0wbAftTcF5VGO+3kq1HVBMGEh4QKeb2wpNyuXxWaev/3n/zbFc0u5vBJrH9xVVdbzDpTEVIiLYWOHwew8IZLngayPCV8C9Z5LBPJ2WCe+BzAPHXYAFg1QpPfQFOAYoU2LqXph9XR7i19ZVZaPevJNgDgDj440=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504431; c=relaxed/simple;
	bh=EdxnZO1mKNHaUo/FDta0WRFmI4czY7CItQeP/9UpgWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iWkpVUW7bfGMzpxxyGswGztob7Cizv2cd0ZM++RqhgDbnHiExQX2vUKQHt5PIW8TFWun+ZUmPxTChvhfcEvCSkyb6EKaiUtrykHug2ozV9/2kUMRKzgvxnC2oxSf0O5IiNJITs+/5B9xhv7PlsCJHMTMPkHGR4VHFe5QezfKvCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxPmokg/; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxPmokg/"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e050bd078cso267457885a.3
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504429; x=1754109229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsGndhJCxr7LdkFb1HaNLZopmDj3oLL9w7okD1l9Vhs=;
        b=kxPmokg/B4saUUhGUCpCx13D8erEPPJMFRtx/xsXlIJkI0aIdSuOZK1+8IQxm4PHxF
         BEptlOeaMkWlw0P/ffFY8uJ7QsXKPRT+pw8MlfpfpdEUTmtGqlCRi+56847Sk9tsX68k
         pRrTzm2V6QHZcTCp/sSWLuA6TOk56CC6Fxko1A8uNp+0VMHXdr+PdXDuLVTsOdfI2d7G
         lghvpEPjvz6U7FFXx4M4HII7o2eQ/WxqjLZsTB88PxjTYZiDglL4fbAMgvDOBIHMPVxo
         WgOzitHME4zNTlwpjXwzZQN23j1uPw4a2eVNnMnzS/Ut33YWj1umSmMF/ebctpL4YqBM
         EbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504429; x=1754109229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsGndhJCxr7LdkFb1HaNLZopmDj3oLL9w7okD1l9Vhs=;
        b=cojdKgAeoW5cuevbnPrYhaAiBZCuj0UwvRwdgl1ii0u6t3zmgdiqIRHNfGaEpCpEuI
         SttQPaz7SmbLM9Xq23uVUKLgCxrvc9vQqWIOlrcTrDuzAvZwqZK7OgTw1zGkUczD8h6/
         EcTMuudDr08YzuM/Hhs+Z++bS1xhgRUHkikhoPob3KIPYQyrcNLSR/IF5LEvBbeeNBlf
         TeFjQODHR2DBSbwOtaj5ndzC6qX4agvakFp3iGwtDIWkD1/1KjV8acWHexEWTvH83TTu
         0LJAfxLQK5GJV3ZRMcwBlAVaTpxe/n5S5ZDsiFRYxQJlM8qC+7NEtmKR7LFkoe1fj4v2
         R49g==
X-Gm-Message-State: AOJu0YxkxuJOnrgbr5EXsZIurHetOnsQ/bwgBgsZ2Ff8wMbriEQkziJb
	xf3OzHKdXPBPT6qOUuqt5Q1ptrSgAHL04WxjpEUVqte6C/TIQ7pHBovz
X-Gm-Gg: ASbGncs7jQv/s8cti5IvrK9YfyXiPKtDOKOKE3Dku2lytywAufg1goSkqvAY9fMS0hh
	RwLih4oXSUdSPPp5YbNZUlgO3I1al0lS+1RfpYA697g/J4d8EJXNOvSnbAj273kIKE61QGEq3/0
	8SIJ3cjlSDbR0zn45HIox6/cCCbwtA4oPnWrYNJnHq9a0OdSvZF1Tw1vyWjw8NoUJRQbysPh4Rf
	Pgc0N/JNJe5g/3WPeOwE9M3NyRXZziDdY1+C7vJ+GSnbnSmYo1hqFtaJ78jWKhl6mSyieoRIKRd
	UAwYUNtdebUQl6dbRdNQao7ta/PW+Y1PMUK+5/eFdwbybiw7gsw0mYPDQl3y3vwP/qV+ZG66r0c
	Fa2S/Ehu0IKCmI51yTMm3ZlHu7kyaxlk1VZDxHUNPzvRIcjS6Ly0=
X-Google-Smtp-Source: AGHT+IF2+YIkjcc41lC9v8+3waLzCwcvEeYt2B9BhrVe0lQnXFX6zEQdSM6Kzv0Z4ZzooYHlZ1Hn5Q==
X-Received: by 2002:ae9:ee18:0:b0:7e6:2faf:883a with SMTP id af79cd13be357-7e63bfa87c6mr386323785a.29.1753504428742;
        Fri, 25 Jul 2025 21:33:48 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:48 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 10/20] staging: rtl8723bs: adding asterisks in multi-line block comments
Date: Sat, 26 Jul 2025 04:32:08 +0000
Message-Id: <20250726043218.386738-11-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Formatted multi-line block comments by adding leading asterisks (*)
on each line, in accordance with kernel coding style guidelines.
This improves consistency and readability of the comments.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 33 ++++++++++++-----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index e709a0bd24f3..161f149bf244 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -188,10 +188,10 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
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
@@ -293,10 +293,10 @@ void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnet
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
@@ -462,8 +462,8 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 }
 
 /*
-Caller must hold pmlmepriv->lock first.
-*/
+ * Caller must hold pmlmepriv->lock first.
+ */
 void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
 {
 	struct list_head	*plist, *phead;
@@ -496,7 +496,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 	}
 
 	/* If we didn't find a match, then get a new network slot to initialize
-	 * with this beacon's information */
+	 * with this beacon's information
+	 */
 	if (!target_find) {
 		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
 			/* If there are no more slots, expire the oldest */
@@ -1794,11 +1795,11 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
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

