Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBBD3B0ACB
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 15:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278513; cv=none; b=clmMwjtQgZGVvN8Ysy7yx/bFgrJgRNNAtYAcd9LKClrw6DulQs+qWhXywKYadshI2wxl86pai7NpIF1CirG0tpqx51bb9FZnBJu2nwRNACepGeCnsfZ9APEt1LIX4BoJ+4SPvTySKOTDSIxJ2PFxiXUWpPrOI2gBk15E9rJebVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278513; c=relaxed/simple;
	bh=0MeaWEY/OcO43cA4hs0GwcLRbkhQbp8h6CvcuLGt/sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxShzC88S2kB436tgxU+q7KChb6v7vaZSrpjBJnm+5ExL8riEn0zukN8EW+bMFYR7o9/yDYl0H4HsKpg795erajoAcahz2xk3C6uSb+8PkXNYsah7EAKaW/aDInmcSSHNz4QUxYFx49cUf5oPdJccb6uhoWe6AQsJARdgth30jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PibPdXv6; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PibPdXv6"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7927261a3acso16640337b3.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774278511; x=1774883311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYtNTABixTYMowCwq44ZOTwCzZzz6micafGBQbSkrtU=;
        b=PibPdXv6QPIuYm3k3Yno6mID7gKpDztOV2K5ZOO9jiAxrKgE3Uph5RAzjp5ngAJ0Od
         ADVVD7VWOtYAx9PqVq/utfkC0RMatzRoPf2JSUN7kD7jZA93eqoTJS6nKC2hD3Fbu2Bv
         Q3dCuMB/hPeZIiXqW50ZVl9L4yp75ok/q+o42ZKZGuoZcDimlik+xbr/DMR5lWc+OrsX
         rexbJclms2l5yF3i6kzQhrfxHJbOShW9LVCJovbAPaP7+nwgMucwBfHef6ccsNk3k32U
         Zo7puxxljO1rW8otWCimdjC3dFqf7d1Lv/WkWCT76JSXvL8pQhMH8yBjVIbW9pdZKSFV
         p8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278511; x=1774883311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rYtNTABixTYMowCwq44ZOTwCzZzz6micafGBQbSkrtU=;
        b=Tpp7JvYfZ3MUNeq3JhtkJKPLbG4HfMjgBOAuOO9+SHceLqd8jVLFNI8IV1Y42oKgVK
         r1fZlORExEE3uHXW6wqpx0rPPuymvYi2u30MEU5mNdHDNB6l9mq27GHvMukTv0SQ6F2h
         or6iPQU9hR7eTmsB2tb/Mq/+FZYHVHGmJFGL9CuffJU3eBSDNuuAMWJ9mLXzPd8gvjUw
         OoFAcH7Ax1maFG5UPgmXonb5voNvw75YGLrBFE1KeX9eOUmD/MqOj6EWeIVWxrDOYjyh
         gwuzKIZ4fCK4uiOei9HaG+Ums5G64GxzwVyi7oQqH7pEUf2jfT/9hPF9xUQnUWSKqCDw
         ZL0Q==
X-Gm-Message-State: AOJu0YxCZT4rAX13tH0e4slSB8zUjBWROQymWg5u3m6AXppWao6DYYDm
	YtfM4HKiICmZN9v1p7t9JBbRPvHAiM63ICmKCmSbXWIEJe2ibiLljfxC
X-Gm-Gg: ATEYQzzQ5Jx22mPpU/ik1wXBg2+gUu6D20eo4H7jsdpVmJYAs8BdkicYonRd5AR3Jgk
	FGy1Y6aWPrG++PVGLxn13h2krKjMhH2TtsgN/KooBU4kx+h8+smTPil3foNFdOeYU5dLYwzH0Nw
	bi1QiGC44bRRetTiuRbjILfUMawH4vZKup8xiArUFTgiFyH/Qtbk+uQC99RUoAyP3picx9Z2Fr5
	S50dTSUe9WCW5wadRwfh5f5tvxW1K+LO+8qFAs2ay3giattiONEh8tUI6FKe+mtjWezepmQPIzi
	jeHMrURt0t0OcyGK4AGNYy7G3r9U9Y75CW3jbHglSXV7gcLZSGdTDNRBjHheqtDkloxV0pjhnxB
	uLhTc/6E6OiOzteR1jLYw0ZefQUibTB8zd3hRXUQz3Hvr2qY8RKCL1FxBRn0t3Lc6KEGEa1wz93
	nGYUMZ6ak6x3Csx/UbosTS5JL3mdE9hgU9
X-Received: by 2002:a05:690c:7107:b0:799:3a3:2f25 with SMTP id 00721157ae682-79a90b9babamr136249747b3.38.1774278507049;
        Mon, 23 Mar 2026 08:08:27 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90425d76sm58662227b3.22.2026.03.23.08.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:08:26 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 1/6] staging: rtl8723bs: replace deeply nested if-else with switch-case
Date: Mon, 23 Mar 2026 18:06:03 +0300
Message-ID: <20260323150650.7168-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323150650.7168-1-nikolayof23@gmail.com>
References: <20260320122119.19563-1-nikolayof23@gmail.com>
 <20260323150650.7168-1-nikolayof23@gmail.com>
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

Changes in v2:
	- leave 'psta' uninizialized

 drivers/staging/rtl8723bs/core/rtw_recv.c | 48 +++++++++++++----------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a52884d2129f..78746cc0d078 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1250,33 +1250,41 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	/* struct mlme_priv *pmlmepriv = &adapter->mlmepriv; */
+	struct sta_info *psta;
 
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

