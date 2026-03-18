Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AF0368962
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 20:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773864147; cv=none; b=hl7X1tI09k7ebevBg9a+ZWST9XTu8t4MGedAyLzQygYVW4RWVJOz3JTNdtzqHKOTfBHtngW+54KKC7nmY/81j86kqSqINvIqnFG8rZmHIWPDo7zVhpzCi9GeLI9Gk91eOmkD5+jAS74+2lv6cutxbdWB7YvmhHFbUPlTkGfFoT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773864147; c=relaxed/simple;
	bh=TluxubrLT87Pfl6ia9Jg1CTeUrqQ4bDtvsN6LkanGek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rzqOUqqyGoa/7uq4iKpeaVkX2DIb6K7Fu0RmHPYtBpUMGZu8wfvOrXz21ZvsDktsVig/YL33X9KS+LnYBABnqEBRnlQi624Sta9DpePgIyIO1/a4OPklA3YJxadjX2Mqrb4hCYIx7/pz7XKMZWBK7ynmf3cjLiyXgBL7xaOxa6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOQuoAF1; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOQuoAF1"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c0c482e069so309923eec.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773864146; x=1774468946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T3Up1MBUYiApmwmLIyCoGifvunWwUHlMipfkU0axVaA=;
        b=YOQuoAF1dCbRnA6BFE8t7FpcFdiynMOCTKCQX1ev67oRqUSsuK4dF704AK/4BmEujP
         GJp5fcNcOLUmDmSBffPD/oV5ikIr4TyQMTKg1mKJG5uZp296mM00ZF2vWf4BQGNY7fBw
         ZZ4zbIDXA9hKePizG/EH01Tqvlq30hv/WaD/QhV7vOUozpSeW0tiSjf/IuXFwz0D4Ib+
         fo17w4MwfjiqGZNK5NiF4FWBtODAwSxZHdgeEk8UWh0DnlmO0844GQOJBsNGFy+QDgJI
         E1+DfQ3msYc/CS/EE429sAypj/QVOsYzbmomO05F55GwCCoBvQOKPSzdLy4Pc+GzPvKL
         xWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773864146; x=1774468946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3Up1MBUYiApmwmLIyCoGifvunWwUHlMipfkU0axVaA=;
        b=YnA59NsJ3xiXBmxMsZL47FVUtgxiETTsO5xbbZ+YwvJCZVwe0hWvRirFX89XxyGRb3
         t5eQhLaszXF/k4++0agvgJnBZo1TK1BN133fNVB8PqXMipIXu3za0C1mPco/0MmFVtw2
         E8LbN3B5ftb0TX1TlG8pu8Mlef+WRerAkG0Pv9ZO0SST76x4OiQaVzEId90eSQuu+BrA
         p+ieNkUfJr6I1/AM51451qoItkHgRWICr3AhTQKMxgExx5MNFxMC9NKbpY8pXRiOYKkT
         pH2/RFhpcwafuITEC9SDw763hcQ8rNLxW8CDqTqE3Q+ZRCkg07D2G2y3RFE4h7sgOYSE
         bbbg==
X-Gm-Message-State: AOJu0Yw0RtW8d791VrcDSJAJwws0lQsZtyxtn93LZbgdzqm5NDVKKSHN
	AbrmkgHCX5Vs9Nr0QpOz3NITit+xJ7tjCVB1Y2vJJAJpkE4Kbbmbsh8k
X-Gm-Gg: ATEYQzzmyNkN87GmNtGCA9t7bYWShUSu5cMLmf6wDaIujLP9taZKJBg6sidZh9ulynz
	3HvkCztCUycfvL70synlVO5mHICyvm1kKiiii1BEPvO/WNJ85SC2vEDoKsPbAZQignMcV7P8Tqm
	rCjr5Nb/MjPwxUaQaTR0BQXmUzeNSKvTVDdA86TgAmZI4zInGHsrWFPVdgQVdKaR8jClXhRDOjH
	Mjl3x0c3bVsCi7NlzHE5hwIt5hbaLG3nClZ0srku6hSOtOum2PbnEwU7bDu3Irb+G1RK6L0DypR
	48yIRcAEegairQyAVVwXEINDwcIXjXL3hJjQoKcufmvDNsUI6N0NkJyR+8/JGhvaEKJpqIDc3Xu
	RIxhivVdc65ou9bqyGyu3gps2nXrl7EzJaUXQgRYMBwuyjjuFjKHL8V0NUQWsCP2s2W2+33P3/Q
	eUTw8dZI031PO9v0P+vh4mdI/ko8KP9XVIxwIcK16ohQsbHPb81MNteBhenZWz3dXBE3Tk1ahsO
	dB6
X-Received: by 2002:a05:693c:2801:b0:2be:1f56:ed21 with SMTP id 5a478bee46e88-2c0e4f9a462mr1309140eec.7.1773864145318;
        Wed, 18 Mar 2026 13:02:25 -0700 (PDT)
Received: from Malavya.sfsu.edu ([130.212.92.173])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e536894bsm5682289eec.5.2026.03.18.13.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 13:02:24 -0700 (PDT)
From: Malavya Raval <malavyaraval@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Malavya Raval <malavyaraval@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Rename TrafficTransitionCount to traffic_transition_count
Date: Wed, 18 Mar 2026 12:59:24 -0700
Message-ID: <20260318195924.2096-1-malavyaraval@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renaming CamelCase variable to snake_case to align with kernel coding style standards.

Signed-off-by: Malavya Raval <malavyaraval@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 18 +++++++++---------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8ae..cf6b2bf8c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1173,21 +1173,21 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 			bEnterPS = false;
 
 			if (bBusyTraffic) {
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <= 4)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 4;
+				if (pmlmepriv->LinkDetectInfo.traffic_transition_count <= 4)
+					pmlmepriv->LinkDetectInfo.traffic_transition_count = 4;
 
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount++;
+				pmlmepriv->LinkDetectInfo.traffic_transition_count++;
 
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount > 30/*TrafficTransitionLevel*/)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 30;
+				if (pmlmepriv->LinkDetectInfo.traffic_transition_count > 30) /* TrafficTransitionLevel */
+					pmlmepriv->LinkDetectInfo.traffic_transition_count = 30;
 			}
 		} else {
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount >= 2)
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount -= 2;
+			if (pmlmepriv->LinkDetectInfo.traffic_transition_count >= 2)
+				pmlmepriv->LinkDetectInfo.traffic_transition_count -= 2;
 			else
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
+				pmlmepriv->LinkDetectInfo.traffic_transition_count = 0;
 
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount == 0)
+			if (pmlmepriv->LinkDetectInfo.traffic_transition_count == 0)
 				bEnterPS = true;
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1ef48bf65..b27a726d8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1174,7 +1174,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
+	pmlmepriv->LinkDetectInfo.traffic_transition_count = 0;
 	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
 
 	if (pnetwork->join_res > 0) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index b1f20aa81..07719cd53 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4757,7 +4757,7 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 	timer_delete_sync(&pmlmeext->link_timer);
 
 	/* pmlmepriv->LinkDetectInfo.TrafficBusyState = false; */
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
+	pmlmepriv->LinkDetectInfo.traffic_transition_count = 0;
 	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
 
 }
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 2a128568c..23e3e5d1f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -103,7 +103,7 @@ struct rt_link_detect_t {
 	bool			bHigherBusyRxTraffic; /*  We may disable Tx interrupt according as Rx traffic. */
 	bool			bHigherBusyTxTraffic; /*  We may disable Tx interrupt according as Tx traffic. */
 	/* u8 TrafficBusyState; */
-	u8 TrafficTransitionCount;
+	u8 traffic_transition_count;
 	u32 LowPowerTransitionCount;
 };
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 29939bf5a..35e948cbb 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -621,7 +621,7 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
 
 	/* pmlmepriv->LinkDetectInfo.TrafficBusyState = false; */
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
+	pmlmepriv->LinkDetectInfo.traffic_transition_count = 0;
 	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
 
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING);
-- 
2.43.0

