Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE53750CC
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009341; cv=none; b=bwU1FX8o7YPeQobux8uf6XW/NgUIaHeBFrBVI9yCXIyQB8cwqiZwMKFxHkKe8StD/aLn6mhBONDFTlPLH7P1FyjyiERFqpEHzwu4ANrBg6X5jMjp/BQX3wR8BfTZ3Kgd7oQ0oblc8zt+s4KlzO4brQxnjD/IqFnVLNCD6kR0z2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009341; c=relaxed/simple;
	bh=HGKQbBUaQmtPnaaxj5UAEfIoiOziEmblj8lx/M1KCy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1N6ogXYE5twnhm+moWXAPtUYvlXy1hk0LZfzVIWgG2wNTRUHVOVklpa05pKud0r0FGR/joWqHWcw748DUWD7YK6f9tRKc7UzWn8C2Ekz4Xv+Y8DUoxoWcARpnckYSpH09NnYo84zuBKs948ItNWKQuqf69M7jmwCkcQCIAfAgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlOgVxFF; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlOgVxFF"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79495b1aaa7so15231507b3.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774009340; x=1774614140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kMCLvc0vquVnWFO4H4BnNfarLbjVmIeBponvGIX79g=;
        b=LlOgVxFF6w8zKBWrhy4pBI3ytq99wnaV4Gwo8FUV8xnW5TxAct+EjQBKazmHKUuTP5
         /wea5t9KT+OZb+t1pVTfGUmj9WtTM2FesRNCAJrrq7e61Cjt/W/Q28KCd6/MdrLqp10h
         bDiflTVnTb9a3Z5Yee+iM5YJd79AGERBiFhOM5iRrsJW55yRm0O95l8IekuJpF/0AcI4
         yxDz1TOuUxeVZTaVkHYxWu9L5wwqS3hmVsL0DRrejub0tgVE6kVWhs0y09LvKoLtP/of
         XErQF7PWT2T3XxLSXbGDlN9oPRqsP2z8SutVwoJxnC0LdVQe4MLqdMka7sRRLWNso30t
         wyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774009340; x=1774614140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7kMCLvc0vquVnWFO4H4BnNfarLbjVmIeBponvGIX79g=;
        b=jYqYEaxGLTMGPNXQmwACKuoy1rFm4JzjlTwDjMdFjzniKDxuRBxGH5wDP0SoZ+EI9q
         wGrECLiGI/BevGMIEpgqHA/PKxk+YMFsQGxyjS+sm3jCph4kD2NrhA9ij0j7CRhmiLz6
         Ul8JwUY9LA9YalNeEF0IX5ZDgKHOwBpSGPU6SGfHlwXMpVs3f72obDUsNYmMhrYKJNXl
         LTdBxRKk+8MtepLX5PzuSaDVo6VhXJ+jtV5Ut/2f1BLpcs7vUg98/TA8WokXweWC4VsO
         TzSwttYT30h/R6UgeQ91QBmlV8N/DlquqCztozyIgJZ+PEF50btEkcdSOMKDmwBH+nlY
         LemA==
X-Gm-Message-State: AOJu0YxfVqn/HMMxRKOd5QdsJKw0qwgEh/L0L4IwQwk+DuvhHkcMsyvN
	K2kpUyU10R7vg75lQG+sSzYQP6yGkhu9Qow8VJum5ukSTzUl6FmTKxhi
X-Gm-Gg: ATEYQzx0EfevO+1yFyd1gNnaTlJ02Cfo+410+J4WNjvu3UmLwcT2NBaUXEar0//tCUS
	koSAMZG8y5Mpio6xxv3abzuOOO/J3yqpHTDfmglXW1epFiZa24qbUx0RekspEZUofVP1rzEs0ET
	JSuLUzRZasSdpx58SljtI9z1FnO3NKjCBqubQIhP+kDT/rHU7h37NIROJZBdL3yN7bUP6zAfNYK
	9rcY5WaqtTwDPMXYVOzoGOyu03RR+Eh6F/ONcXxEoDgpT6JgOxHMliWw4RNLUUSqq7l9ZuRaU1m
	c3BTpCRso9pp8bzdIt95aF3BScbGSanHDAZEgDiN354A6tg3uAlCNlzK+jXQYxJzAAoXXI7se1h
	swwE+Qt9V1sGdoHVb0XZ+mYHkCOjRMP82C7xq2I0B0XpUyGeX5JHNajSI9v7t0ZRyYaAB1Kpi6a
	XtuZ6KeLoWXNJNF7URvuSYww==
X-Received: by 2002:a05:690c:2612:b0:798:1637:fee0 with SMTP id 00721157ae682-79a90c05e2dmr31218857b3.52.1774009339491;
        Fri, 20 Mar 2026 05:22:19 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9057f820sm14075977b3.40.2026.03.20.05.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:22:19 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 1/5] staging: rtl8723bs: replace deeply nested if-else with switch-case
Date: Fri, 20 Mar 2026 15:14:59 +0300
Message-ID: <20260320122119.19563-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320122119.19563-1-nikolayof23@gmail.com>
References: <20260320122119.19563-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main logic of the validate_recv_mgnt_frame() function is deeply
nested due to multiple if-else statements and additional block scope.
Fix this by replacing identical if-else with switch-case statements,
which will improve code readability and correct checkpatch.pl warnings
about line lengths.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 48 +++++++++++++----------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a52884d2129f..6ffb7be93350 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1250,33 +1250,41 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	/* struct mlme_priv *pmlmepriv = &adapter->mlmepriv; */
+	struct sta_info *psta = NULL;
 
 	precv_frame = recvframe_chk_defrag(padapter, precv_frame);
 	if (!precv_frame)
 		return _SUCCESS;
 
-	{
-		/* for rx pkt statistics */
-		struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->u.hdr.rx_data));
-
-		if (psta) {
-			psta->sta_stats.rx_mgnt_pkts++;
-			if (GetFrameSubType(precv_frame->u.hdr.rx_data) == WIFI_BEACON)
-				psta->sta_stats.rx_beacon_pkts++;
-			else if (GetFrameSubType(precv_frame->u.hdr.rx_data) == WIFI_PROBEREQ)
-				psta->sta_stats.rx_probereq_pkts++;
-			else if (GetFrameSubType(precv_frame->u.hdr.rx_data) == WIFI_PROBERSP) {
-				if (!memcmp(padapter->eeprompriv.mac_addr, GetAddr1Ptr(precv_frame->u.hdr.rx_data), ETH_ALEN))
-					psta->sta_stats.rx_probersp_pkts++;
-				else if (is_broadcast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)) ||
-					 is_multicast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)))
-					psta->sta_stats.rx_probersp_bm_pkts++;
-				else
-					psta->sta_stats.rx_probersp_uo_pkts++;
-			}
-		}
+	/* for rx pkt statistics */
+	psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->u.hdr.rx_data));
+	if (!psta)
+		goto exit;
+
+	psta->sta_stats.rx_mgnt_pkts++;
+
+	switch (GetFrameSubType(precv_frame->u.hdr.rx_data)) {
+	case WIFI_BEACON:
+		psta->sta_stats.rx_beacon_pkts++;
+		break;
+	case WIFI_PROBEREQ:
+		psta->sta_stats.rx_probereq_pkts++;
+		break;
+	case WIFI_PROBERSP:
+		if (!memcmp(padapter->eeprompriv.mac_addr,
+			    GetAddr1Ptr(precv_frame->u.hdr.rx_data),
+			    ETH_ALEN))
+			psta->sta_stats.rx_probersp_pkts++;
+		else if (is_broadcast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)) ||
+			 is_multicast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)))
+			psta->sta_stats.rx_probersp_bm_pkts++;
+		else
+			psta->sta_stats.rx_probersp_uo_pkts++;
+
+		break;
 	}
 
+exit:
 	mgt_dispatcher(padapter, precv_frame);
 
 	return _SUCCESS;
-- 
2.53.0

