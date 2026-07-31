Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37347372B39
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481593; cv=none; b=mgQLK107IYQ/T2cYNisGy+t3ykSIZAA4gAqD1bMB1+NPn7UDVZv9EaOjXY2RbGkHUhAJZfQ8i+fMz4fFApiP4L931+9ZYW2LZuKHQ2ZUWRBzbkC36X8GTDt5NYfXxQ8Q2vh4VJAsC60lKFxWmW5HQXljgsYida8Cz+2JW4J75A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481593; c=relaxed/simple;
	bh=bmbAN0joM0QSQlBsr+1XRr4e0QuytSVMbBJ5jv9uc0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPsN2SNu78giXCoRjlb/YTNgxw/g5DMK40Lmi7T0FG+ScBd7+F+T/sbA2xaP7in2OZLkfVENJOGlJyu3i0Qd/Dha0kVao9M6DSytjtFqveGyvsS08HjagWpWGImpxWG/stsJ1tdhwrqvpNfMmyy9lZtizACsqUE6niOHuosth6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdUDY6aE; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdUDY6aE"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2cf5e516e67so2912745ad.1
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 00:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785481590; x=1786086390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2eeMe4bUYVoR8xJiruE/ZmrCkmBvcANozp9bXajUHw=;
        b=CdUDY6aEqTh1QI30BWNYpEvDi9sVxmXRmmpfv4OfO8ZRuYpzyQJswmBlYstSjyjYPP
         GWz3cufhSm05bWzGvHWJU/vSPpOHSu+sB8z9903LLcKBIg4I/v6GhOXab+whT1b00Gw1
         ePtesQSmQMDrXL+6nmcTIdcAvrZVkAxEJBQRFq9IjM/txhMiUxdpi/hqmXlk3uPzaTH9
         asL+hnE1TNp4QefAOLUTz3ULs69YKNavo/HPZgA8BExj0Fcm79vcAagQFbxMakgCQHkD
         kkxJLE3nintZaqWIfelS+0Y4b0Pwp0SSxX7lepfng5QgteS26PsjKWmEtmmc11cKyMpS
         Ii4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481590; x=1786086390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2eeMe4bUYVoR8xJiruE/ZmrCkmBvcANozp9bXajUHw=;
        b=kvm3JbgUOqnvWoPa+XCVq8vs3tcbaH9jGTNsH8hkvWnusZsqPzkS0QSRnIBPQ1KAoh
         kqJmRo7Zzahu2rvFjk/3RKJICtA1fkN9aFpOvWuNp17dddbuVBqHXGeRCvYxrUg2GesM
         61uYbpRAZwKHY0TBJPS97FPpevcJbuapBi8PdYaVg68ILHFf99w0aTOasXn7vNaW0Mdd
         wvcKCRJEJEoZgG0xFIN+rvAfEgHnY++fw2Lz3ySSPKOO5L1CHVhleesr2hmKnF3FJmJh
         yNwMOIfnkhtqFxM/BbXHDLl7T8MupqMfDpQRLcIpb9dlgXwl53wMbC9cH5RV3x+zsSB+
         JYNg==
X-Forwarded-Encrypted: i=1; AHgh+RqtI3cMfoa6y6ZM5k9fXmmCExUNueDZBm8WsDwsDFnI3bevOszXKI7mJTr0Xpmwa0L86MQ1qMj2e0bAjFk+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9qha0659rZQ6fArAye+/M1ATXBCDk5oAwOiDfNPl7cf49Jc+9
	pue7ocYNQVOepWaMzbYAAzOK3REkDuZLPOuW4izlfCT0GNS1nr69TkSA
X-Gm-Gg: AR+sD12WD5pSfWEYa+34/YKkt/JEsTwtiLxunba9r1MCahBPHf2+K5gk0icxaK6X3K4
	qzaZDa0UBSK9fTkIyhUytK4WwD7ryFboorgBP2qoBGbzMvwqPdSSQLrNvezLEUWNpkRZ3ixSTi6
	xqUqTfLb8h+3TS5oWELbepPsie3nZnoDHpG0VeZkUbFuKAhGjfwRNLTuteO2PXK/NjpGMfJTBVn
	xk9k0NHQ//rgcTwfZDjGgrs0rdPyvZrjI59yJ3MVyIBJpzfKog/CLxb4EsYBL4MRm04Qz8slypv
	ikgGk65QLkj0lA81HKhDAOLtJSJCsXl85tikceVBEmGCQICkj3PfPYRjcpX7S/hAfSBWugBSIT7
	/Fr5eYkg+GFO73bxS6Z9p9BYqWIBVvivuJCXd4gpQ49H6gc9Reu8RbfjK8tXc2A0us6g80vD5SR
	/XNwkw69VD30HK/IXpdorucmOxuWI2OvWaQu3BvyybH4+i0gGxmWtV6ILXniYHIWebP8jkKp2M1
	dNi25A1bhap+QLc+U3K
X-Received: by 2002:a05:6a21:730b:b0:3c3:a140:938a with SMTP id adf61e73a8af0-3c91b316892mr899765637.45.1785481590453;
        Fri, 31 Jul 2026 00:06:30 -0700 (PDT)
Received: from localhost.localdomain ([76.86.179.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm2589587eec.7.2026.07.31.00.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:06:29 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: convert mgmt xmit coalesce to errno
Date: Fri, 31 Jul 2026 07:05:44 +0000
Message-ID: <20260731070546.20959-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731070546.20959-1-dennylin0707@gmail.com>
References: <20260731070546.20959-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change rtw_mgmt_xmitframe_coalesce() to use kernel-style return values.
Return 0 on success and negative errno on failure, and update the
declaration in rtw_xmit.h accordingly

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 8 ++++----
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 16e6c9567224..01512f438295 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1187,7 +1187,7 @@ int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 }
 
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
-s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
 {
 	u8 *pframe, *mem_start = NULL, *tmp_buf = NULL;
 	u8 subtype;
@@ -1210,7 +1210,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	BIP_AAD = kzalloc(ori_len, GFP_ATOMIC);
 
 	if (!BIP_AAD)
-		return _FAIL;
+		return -ENOMEM;
 
 	tmp_buf = BIP_AAD;
 	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
@@ -1341,12 +1341,12 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 xmitframe_coalesce_success:
 	spin_unlock_bh(&padapter->security_key_mutex);
 	kfree(BIP_AAD);
-	return _SUCCESS;
+	return 0;
 
 xmitframe_coalesce_fail:
 	spin_unlock_bh(&padapter->security_key_mutex);
 	kfree(BIP_AAD);
-	return _FAIL;
+	return -EINVAL;
 }
 
 /* Logical Link Control(LLC) SubNetwork Attachment Point(SNAP) header
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 917e846e9ce2..31decc210e73 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -424,7 +424,7 @@ int rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 extern u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
 #define rtw_wlan_pkt_size(f) rtw_calculate_wlan_pkt_size_by_attribue(&f->attrib)
 extern int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
-extern s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
+extern int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
 s32 _rtw_init_hw_txqueue(struct hw_txqueue *phw_txqueue, u8 ac_tag);
 void _rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv);
 
-- 
2.43.0

