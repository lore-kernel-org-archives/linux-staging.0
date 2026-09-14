Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAAA3BBFD0
	for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394270; cv=none; b=dyvulvuH0ycz9i4jpAQQGgHQLg515UrEsVXMQ/ft1ghpR0MB7ee26h9G6bvDts7h9O9R89+M/mIwB6RDwK6Tsb3OS+exMD1EpmR1Og7yWKJ+TTxKAOsK9WLIw+F8Yjw272S2XEFrDcSunjiRsYYI/NWLa2rfSmztQIletXTb+Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394270; c=relaxed/simple;
	bh=duDW4MTgv9us/ONwJoTNsNlJr2TmZ9c/C+zVNu8JAhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i2a1i7AuTE5XqRdrr7G8d7A5CVPlcyRNj3j+63I8bf1gtUi1UWnRnGGtsSSw67tMIc4UZ0Ok9sxF2ds3ykhfAZF8blDbYHApgfmGMn+GHbeP90Aj76GhB5Ixjr4i6qukgLP7iuJp/u0Bt0ulHpN9cyr523k5bFrvIjJPDGVfGpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fO1iXnsU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fO1iXnsU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso15614755e9.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394267; x=1789999067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pm6FQW4GbFGly5zHN646NB+7TgBYiGFIis+XHe7PrJM=;
        b=fO1iXnsUouQw3wEdA/djFLvYz1TwVMqDn1q8gPor7jBMcwh/jAgaZ1CI1TKIIdj1Tw
         qHmO2QxftRfwyK/pFo8apjxOT7wOT9PsgrdlUHmmOoGotpw/a13BBAhjWteSBnrtY/E4
         gMaUBLh+4Wi3we3DvVp21xvTifDAwI+wWTQX5IY7EV7b1PCedOMXGwH/G1Q/8O7ikpnI
         jEjlT08EXSWlYVJXsTRywlmzz/GN7o1VXdQXr49hfMOZOvDgWwC8VPdmV2LLpp1Pglyq
         KqL8N75gmVoX66571uCL+qPdWszew6dj7nkKlNzYxDW0vivU8WTD0n8fJB8wUI26m9JY
         fdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394267; x=1789999067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pm6FQW4GbFGly5zHN646NB+7TgBYiGFIis+XHe7PrJM=;
        b=cCFCSWw8F+8gWpugzjedBUqkGtB9aZAGTMJtJdIU3w6WD+Se6858vedu6XLvCE0Ufv
         YEb+jCjJfPXhVPK8yzJZNs2Iuy8RrCe2kTUShZNdLtRm/Ny0hW8Db011Z069WGpJk9so
         wpLmdpx3/iSGQaYsZt6bdgY0SPPQN1cMrujwOE8iuDqhfn97EQvbI+wKlLCXXs99/SjL
         jwrW32+rYii3oTuq7Yhg4AmdOmSdyKGASrDTWY9tSIt9aqWDH7dCTAUOoW9zZ6y3SOMg
         53tMgpeUVeMlWkw5ebCt+MA7JU6OUrm70FlAH2TUydchxisRoWkiiRrDIrHHT7cIzirs
         diUA==
X-Gm-Message-State: AFuF++kkGV6y0ZOAyfsd19IudmqKW3RDFC1i949mWfQP+DgWydoX3ETt
	ByAGpJmhxps0IqHzTCmPOypFN5mGeDCJzC1abuJdlt8U/uDFTp3Zchbd
X-Gm-Gg: AYBFou0++jUXuypawp0xewD01E9EdBtWK2rxZrNAdGd+ubT7/bQObc4fzUWN14kuXMN
	P7fkpJzg2Du7mKgC3U/QFlY0cGatQFSAlKVibxg4+84JMo0dVnu54RjVP4mEyv8l+xGYtl+wIC1
	HKoDdWg4q6Bm9FoI81e34WA6hLuUVeEVEqmwV9hA6OJDcT6MVwipnwv4+Czg0j0ZOnsLQtHCCcD
	dK1eiK9AV+KTVR2vxJryRa+zUVRha5Xv5djs7rtL46YHBIvObHeATNHLH2EIVQ39MjWv8jqHvbw
	gE5/SOW+dVxksbmBri9E8OBb+nBLwG/Ixwrzc3Ewl1yQ0+++8X1VQ+wNt5JbO7V7OI/H/FWOZup
	EPfzu2IgEdcX9he7eaY+Pe1w6/1xFLI8Y4mbXJ1Sa66hM+nUM+1mOCPTVyjEHAwqyb5aa/Q/8PJ
	7GllwFjzpow2tM5CuqADgqCLN/C/InvaeaW4naDmcFd6o02T2kmepD8c3cA2UwlXfYVYs=
X-Received: by 2002:a05:600c:4f81:b0:49e:6683:d23c with SMTP id 5b1f17b1804b1-49e7a5edd99mr31944155e9.0.1789394266695;
        Mon, 14 Sep 2026 06:57:46 -0700 (PDT)
Received: from zephyr ([2407:d000:508:1732:c5ca:107f:bc81:7575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bc5fsm382832675e9.3.2026.09.14.06.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:57:45 -0700 (PDT)
From: Muhammad Israr <7israr.work@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Israr <7israr.work@gmail.com>
Subject: [PATCH] staging: rtl8723bs: add braces on all arms of if/else in rtw_mlme_ext.c
Date: Mon, 14 Sep 2026 18:56:39 +0500
Message-ID: <20260914135639.28269-1-7israr.work@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch CHECKs: braces {} should be used on all arms of this
statement, and Unbalanced braces around else statement.

i checked the kernel CodingStyle, when one branch of an if/else
requires braces, both branches should use braces.

did not change any functionality

Signed-off-by: Muhammad Israr <7israr.work@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c39fb142302e..e60b2c825162 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -356,9 +356,9 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 					channel_set[chanset_size].scan_type = SCAN_ACTIVE;
 				else
 					channel_set[chanset_size].scan_type = SCAN_PASSIVE;
-			} else
+			} else {
 				channel_set[chanset_size].scan_type = SCAN_ACTIVE;
-
+			}
 			chanset_size++;
 		}
 	}
@@ -1221,8 +1221,9 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 		memcpy(&pstat->htpriv.ht_cap, elems.ht_capabilities, sizeof(struct ieee80211_ht_cap));
 
-	} else
+	} else {
 		pstat->flags &= ~WLAN_STA_HT;
+	}
 
 	if (!pmlmepriv->htpriv.ht_option && (pstat->flags & WLAN_STA_HT)) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
@@ -2838,9 +2839,9 @@ void issue_assocreq(struct adapter *padapter)
 	if (bssrate_len > 8) {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate, &(pattrib->pktlen));
 		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (bssrate_len - 8), (bssrate + 8), &(pattrib->pktlen));
-	} else
+	} else {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len, bssrate, &(pattrib->pktlen));
-
+	}
 	/* vendor specific IE, such as WPA, WMM, WPS */
 	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
 		if (i + sizeof(*pIE) > pmlmeinfo->network.ie_length)
@@ -3848,9 +3849,9 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 		memcpy(bssid->ssid.ssid, (p + 2), *(p + 1));
 		bssid->ssid.ssid_length = *(p + 1);
-	} else
+	} else {
 		bssid->ssid.ssid_length = 0;
-
+	}
 	memset(bssid->supported_rates, 0, NDIS_802_11_LENGTH_RATES_EX);
 
 	/* checking rate info... */
@@ -3928,8 +3929,9 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 			if (le16_to_cpu(pHT_caps->u.HT_cap_element.HT_caps_info) & BIT(14))
 				pmlmepriv->num_FortyMHzIntolerant++;
-		} else
+		} else {
 			pmlmepriv->num_sta_no_ht++;
+		}
 	}
 
 	/*  mark bss info receiving from nearby channel as signal_quality 101 */
-- 
2.55.0

